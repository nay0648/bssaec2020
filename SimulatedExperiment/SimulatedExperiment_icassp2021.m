clear;
% data segment length
seglen=16000*7;
% echo path and adaptive filter length
flen=256;
% SER (db) in the experiment
serdb=-20;

%% generate test data
% reference and nearend
[ref, fs]=audioread('reference.wav');
ref(seglen+1:end)=[];

nearend=audioread('nearend_sparse.wav');
nearend(seglen+1:end)=[];

% echo path
echopath=randn(flen, 1);

% echo
echo=conv(echopath, ref);
echo(length(ref)+1:end)=[];

% adjust SER
pownearend=sum(nearend.^2);
powecho=sum(echo.^2);
ser=10^(serdb/10);
nearend=nearend*sqrt(ser*powecho/pownearend);

% mic signal
mic=nearend+echo;
audiowrite('aec_input.wav', [mic, ref], fs);

%% algorithm iteration
% NLMS step size
mu=0.5;
% forgetting factor
alpha=0.9999;
% ICA nonlinearity parameter
gamma=0.2;
% to prevent singular
diagload=1e-10;

% reference data buffer
r=zeros(flen, 1);

% space for NLMS
y_nlms=zeros(length(mic), 1);
w_nlms=zeros(flen, 1);
misalignment_nlms=zeros(length(mic), 1);

% space for RLS
y_rls=zeros(length(mic), 1);
p_rls=zeros(flen, 1);
R_rls=zeros(flen, flen);
w_rls=zeros(flen, 1);
misalignment_rls=zeros(length(mic), 1);

% space for Aux-ICA AEC
y_aux=zeros(length(mic), 1);
p_aux=zeros(flen, 1);
R_aux=zeros(flen, flen);
w_aux=zeros(flen, 1);
misalignment_aux=zeros(length(mic), 1);

for k=1:length(mic)
    % shift in new reference
    r=circshift(r, [1, 0]);
    r(1)=ref(k);
    
    %
    % NLMS
    %
    % calculate estimated nearend
    x=mic(k);
    y=x-w_nlms'*r;
    y_nlms(k)=y;
    
    % update filter
    w_nlms=w_nlms+mu*y*r/(diagload+r'*r);
    
    misalignment_nlms(k)=10*log10(norm(w_nlms-echopath)^2/norm(echopath)^2);
    
    %
    % RLS
    %
    x=mic(k);
    y_rls(k)=x-w_rls'*r;
    
    p_rls=alpha*p_rls+(1-alpha)*(r*x);
    R_rls=alpha*R_rls+(1-alpha)*(r*r');
    
    w_rls=inv(R_rls+diagload*eye(size(R_rls)))*p_rls;
    
    misalignment_rls(k)=10*log10(norm(w_rls-echopath)^2/norm(echopath)^2);
    
    %
    % Aux-ICA AEC
    %
    % calculate estimated nearend
    x=mic(k);
    y=x-w_aux'*r;
    y_aux(k)=y;

    % calculate nonlinearity
    beta=(1-alpha)*(abs(y)^2+diagload)^((gamma-2)/2);
    
    % update correlation
    p_aux=alpha*p_aux+beta*(r*x);
    R_aux=alpha*R_aux+beta*(r*r');
    
    % update filter
    w_aux=inv(R_aux+diagload*eye(size(R_aux)))*p_aux;
    
    misalignment_aux(k)=10*log10(norm(w_aux-echopath)^2/norm(echopath)^2);
end

%% plot results
audiowrite('y_nlms.wav', y_nlms, fs);
audiowrite('y_rls.wav', y_rls, fs);
audiowrite('y_aux.wav', y_aux, fs);

figure(1);
t=0:flen-1;
plot(t, echopath, t, w_nlms, t, w_rls, t, w_aux);
legend('Real', 'NLMS', 'RLS', 'Aux');
title('Echo Path');

figure(2);
t=(0:length(mic)-1)/fs;
subplot(2, 1, 1);
plot(t, misalignment_nlms, t, misalignment_rls, t, misalignment_aux);
legend('NLMS', 'RLS', 'Aux');
xlabel('Time (s)');
ylabel('Misalignment (dB)');
subplot(2, 1, 2);
plot(t, nearend);
xlabel('Time (s)');
ylabel('Nearend Speech');

fprintf(1, 'Average Misalignment (dB):\n');
fprintf(1, 'NLMS: %f\n', mean(misalignment_nlms));
fprintf(1, 'RLS: %f\n', mean(misalignment_rls));
fprintf(1, 'Aux: %f\n', mean(misalignment_aux));

%% calculate PESQ
audiowrite('nearend.wav', nearend, fs);
pesq_nlms=pesq('nearend.wav', 'y_nlms.wav');
pesq_rls=pesq('nearend.wav', 'y_rls.wav');
pesq_aux=pesq('nearend.wav', 'y_aux.wav');

fprintf(1, '\n');
fprintf(1, 'PESQ:\n');
fprintf(1, 'NLMS: %f\n', pesq_nlms);
fprintf(1, 'RLS: %f\n', pesq_rls);
fprintf(1, 'Aux: %f\n', pesq_aux);
