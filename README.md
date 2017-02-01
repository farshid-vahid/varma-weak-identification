# README

This set of GAUSS codes calculate the impulse responses functions generated from the real business cycle (RBC) model, fitted VAR and VARMA models in the paper by W. Yao, T. Kam and F.Vahid (2016), "On Weak Identification in Structural VAR(MA) Models". **.gss** files are developed in GAUSS9 on a Windows operating system. **.m** files are excutable in Matlab.

## Contents

* **irf_true.gss** calculates the VARMA coefficients in equation (2) of the paper, i.e. the true final form VARMA representation for the observable variables $n_t$ and $\Delta ln Y_t$ from the log-linearized solution of the RBC model using the parameter values given in Table 1, then finds out its simplest VARMA(1,1) structure by imposing the scalar component model (SCM) structure. The last part of the code calculates the true impulse responses of $n_t$ and $\Delta ln Y_t$ to the two structural shocks $z_t$ and $d_t$ (the solid black lines in Figure 1).

* **irf_ci_var200.gss** produces Figure 1. It uses a sample path of 200 observations from the true VARMA DGP of the RBC model (saved as simulation.txt in the archive), then fits finite lag VAR models and calculate the impulse responses to the structural shocks recovered using Blanchard-Quah restrictions for 10000 replications. Then it plots the mean of these impulse responses along with the 2.5 and 97.5 percentile intervals as shown in Figure 1. Figure A.2 in the appendix could also be reproduced using this code once we change the sample size and lag length of the VAR model.

* **irf_ci_varma200.gss** fits a VARMA(1,1) model with the SCM structure to a simulated sample path of 200 observations from the true VARMA DGP of the RBC model (saved as simulation.txt in the archive), and calculate the impulse responses to the structural shocks recovered using Blanchard-Quah restrictions. This codes then repeats the same exercise for 10000 simulations, and calculate the mean, the 2.5 and 97.5 percentile intervals of the simulated impulse responses. These results are not shown in the paper. However this code could be used to produce the impulse responses depicted in Figure A.1 in the appendix using large sample $T=20,000$.

* **simulation.txt** is one sample path of 200 observations simulated from the true VARMA DGP of the RBC model.

* **root_RBC.m** performs the calculation on page 7 of the paper. It takes the parameter matrices in the reduced form equation (1) and (2) and calculates the AR and MA roots for this DGP using the method outlined in Section 3.

* **sim_roots.gss** outlines the simulation exercise in Section 3 and Appendix B. It simulates 1,000,000 sets of structural parameters from given distributions, and calculate the AR and MA roots for these different sets of structural parameters. The output is saved in the file simroots.asc. (Warning: This will be a huge file with 1 million lines. It is used as an input for plot_roots.m program.)

* **plot_roots.m** generates Figure 2 in the paper. It uses the simulated values of the AR and MA roots (which was saved in file simroots.asc), and plots their distribution in the 2-dimensional space. 



