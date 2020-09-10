# bssaec2020
A New Perspective of Auxiliary-Function-Based Independent Component Analysis in Acoustic Echo Cancellation

Yueyue Na, Ziteng Wang, Zhang Liu, Yun Li, Biao Tian, Qiang Fu

Machine Intelligence Technology, Alibaba Group

{yueyue.nyy, ziteng.wzt, yinan.lz, yl.yy, tianbiao.tb, fq153277}@alibaba-inc.com

# Abstract
For better human-machine or human-human voice commu-nication, acoustic echo cancellation (AEC) is required to suppress echo from observed signals. Traditional AEC's performance is restricted when double-talk occurs. Blind source separation (BSS) based AEC has good performance in double-talking since BSS is inherently based on the full duplex signal mode, which both far-end and near-end sig-nals coexist. In this paper, the auxiliary-function-based in-dependent component analysis (Aux-ICA) algorithm is used to solve the AEC problem. After mathematical simplifica-tion, it can be seen that the Aux-ICA AEC is equivalent to weighted recursive least square (RLS) algorithm, with the ICA nonlinearity as the weighting function. The perfor-mance of the proposed approach is verified by both simu-lated and real-world experiments. In addition, a speech en-hancement front-end is unified in the BSS framework for the application of smart TV keyword spotting.

# Your Interspeech 2020 Submission (Number 1147)

Dear Yueyue Na:

The peer review process for Interspeech 2020 is now completed. The Area Chairs of Interspeech 2020 have thoroughly analysed the comments and scores of the reviewers in making decisions. Given the exceptionally large number of high-quality submissions received, this has proved to be a difficult task, and many interesting papers could not be included. The overall acceptance rate this year is 47%.

We regret to inform you that your paper

Paper ID: 1147
Title: A New Perspective of Auxiliary-Function-Based Independent Component Analysis in Acoustic Echo Cancellation

has not been selected for presentation at the conference. The reviews of your paper are included at the end of this message.

We would encourage you to carefully go through the reviews. Reviewer comments undoubtedly contain useful feedback that can strengthen future submissions. While we recognise that this rejection is disappointing, we hope that you will still consider attending the conference.

Due to the rapid world-wide spreading of the new coronavirus infections (COVID-19), the organizing committee has made a decision to hold Interspeech 2020 as a virtual conference (online).

The main conference website is

http://www.interspeech2020.org/

Any question related to the disposition of your paper should be directed to tpc-chairs@interspeech2020.org.
For any other questions, please visit

http://www.interspeech2020.org/contact/Contact_Us/


Best Regards,
Technical Program Chairs, Interspeech 2020
Interspeech 2020

============================================================================ 
Interspeech 2020 Reviews for Submission #1147
============================================================================ 

Title: A New Perspective of Auxiliary-Function-Based Independent Component Analysis in Acoustic Echo Cancellation
Authors: Yueyue Na, Ziteng Wang, Zhang Liu, Yun Li, Biao Tian and Qiang Fu


============================================================================
                            REVIEWER #1
============================================================================

Detailed Comments for Authors
---------------------------------------------------------------------------
-- Detailed Review --
This paper proposes a new perspective to tackle the double talk scenario in AEC, i.e., regarding interference far-end echo as another speech interference and utilizing Aux-ICA algorithm to effectively suppress the echo component. In addition, the authors analyze the filter expression of Aux-ICA and find that it can be viewed as the weighted version of RLS with the ICA nonlinearity serving as the weighting function. Both simulation and real experiments demonstrate the superiority of Aux-ICA compared with NLMS and RLS.

--Key Strength of the paper--
(1)	Formulating the double-talk AEC as a BSS problem, the paper proposes to use Aux-ICA to suppress the far-end echo.
(2)	The paper derives the final filter expression and compares it with RLS.
(3)	Both simulation and real-world experiments are conducted to verify the superiority of the proposed method.

--Main Weakness of the paper--
(1)	English should be revised carefully. For example, Section 2.1, ¡°The microphone signal x is consist of¡­¡±  => ¡°consists of¡­¡±. Section 4.2, ¡°which is accordance with¡­¡± => ¡°which is accordant with¡­¡±. Conclusion, ¡°which both near-end and far-end signals coexists¡­¡±  => ¡°coexist¡±.
(2)	In the last paragraph of Introduction, ¡°section¡± should be changed into ¡°Section¡±.
(3)	In the fifth paragraph of Introduction, reference is suggested to add for Wiener filtering or masking techniques.
(4)	In Section 2.1, what is the meaning of N source images?
(5)	Eq.(20), what is v_{1}?
(6)	Actually, both v(k) and w(k) represent the filter, so the authors are suggested to unify the notation.
(7)	Eq.(29), what are \mathbf{a} and \mathbf{b}?
(8)	Figure 2 seems to be rather blurry and the curve of Aux before 10s can not be observed.
(9)	From Table 2, the performance of Aux is inferior to NLMS and RLS in terms of PESQ and Average Misalignment despite AuxP can substantially improve the performance. The authors are suggested to explain the phenomenon.
---------------------------------------------------------------------------


Explanation - Quality of the paper
---------------------------------------------------------------------------
-- Novelty/Originality --

-- Technical Correctness -- 

-- Clarity of Presentation -- 
English should be revised carefully. For example, Section 2.1, ¡°The microphone signal x is consist of¡­¡±  => ¡°consists of¡­¡±. Section 4.2, ¡°which is accordance with¡­¡± => ¡°which is accordant with¡­¡±. Conclusion, ¡°which both near-end and far-end signals coexists¡­¡±  => ¡°coexist¡±.
In Section 2.1, what is the meaning of N source images?

-- Quality of References -- 

-- Reproducibility --
---------------------------------------------------------------------------



============================================================================
                            REVIEWER #2
============================================================================

Detailed Comments for Authors
---------------------------------------------------------------------------
-- Detailed Review --

-- Key Strength of the paper --
The paper is well written having plenty of relevant figures and tables. 
-- Main Weakness of the paper --
- The choice of some parameters is not fully explained (e.g. why the step size of NLMS is 0.05 etc, filter length is 16).
- Some assertions from the paper are not supported by references and the numerically efficient affine projection algorithms mentioned below are not introduced. 
- The numerical complexity of the proposed approach is not presented and it is not compared with the considered competing algorithms.
- There are a few inconsistencies in the reference section that should be corrected.
---------------------------------------------------------------------------


Explanation - Quality of the paper
---------------------------------------------------------------------------
-- Novelty/Originality --
A new algorithm for AEC is proposed. 
-- Technical Correctness -- 
Good.
-- Clarity of Presentation -- 
Very good. 
-- Quality of References -- 

The authors should mention the affine projection algorithms that link the NLMS and RLS algorithms (e.g. fast version from Combined echo and noise cancellation based on Gauss-Seidel pseudo affine projection algorithm,¡± Proc. of IEEE ISCAS 2004, Vol. 3,  pp. 505-508 and Fast block exact Gauss-Seidel pseudo affine projection algorithm, IEE Electronics Letters, Oct. 2004, pp. 1451-1453, Vol. 40, Issue:22). Also, the dichotomous coordinate descent approach for solving normal equations should be mentioned (e.g. Low-complexity RLS algorithms using dichotomous coordinate descent iterations', IEEE Transactions on Signal Processing, vol. 56, no. 7, pp. 3150-3161).

-- Reproducibility --
- To facilitate reproducible research, I suggest that the authors release the related source codes on github.com, the website of the authors' research group, or similar website. This could make positive impacts on the academic community.
---------------------------------------------------------------------------



============================================================================
                            REVIEWER #3
============================================================================

Detailed Comments for Authors
---------------------------------------------------------------------------
-- Detailed Review --
The paper proposes the use of the Aux-ICA source separation method for AEC, and finds that it can be seen as a weighted RLS method.  

-- Key Strength of the paper --
The approach looks reasonable for the use case of a high amount of double-talk.  
 
-- Main Weakness of the paper --
It unfortunately lacks sufficient experimental validation. There is a first toy experiment with only 16 taps RIR, which is too few to model any kind of a real room situation. The more impressive second experiment was done by using another method, Aux-IVA, and even though it is related to the presented ICA method, there¡¯s nothing in the text describing it and its relation to Aux-ICA (more than a reference).   

The problem with experiments forces me to recommend a reject of this current version of the manuscript.
---------------------------------------------------------------------------


Explanation - Quality of the paper
---------------------------------------------------------------------------
-- Novelty/Originality --
Quite an interesting take on BSS for AEC


-- Reproducibility --
The first experiment is easy to reproduce, and the authors have actually provided Matlab code with a time domain implementation. Very nice! 
The second experiment is very difficult to reproduce as there is no description of the IVA version of the method.
---------------------------------------------------------------------------


--
Interspeech 2020 - https://www.softconf.com/j/interspeech2020
