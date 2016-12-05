# README

This set of GAUSS codes calculate the impulse responses functions generated from the real business cycle (RBC) model, fitted VAR and VARMA models in the paper by W. Yao, T. Kam and F.Vahid (2016), "On Weak Identification in Structural VAR(MA) Models".

## Contents

* **irf_true.gss** calculates the true final form VARMA representation for the observable variables n_t and \Delta ln Y_t from the log-linearized solution of the RBC model, then finds out its simplest VARMA(1,1) structure by imposing the scalar component model (SCM) structure. The last part of the codes calculates the impulse responses of n_t and \Delta ln Y_t to the two structural shocks z_t and d_t.

* **irf_ci_var200.gss** uses data of 200 observations from the true VARMA DGP of the RBC model, then fits finite lag VAR model and calculate the impulse responses for 10000 replications, along with the 2.5 and 97.5 percentile intervals.

* **irf_ci_varma200.gss** fits a VARMA(1,1) model with the SCM structure to a simulated sample path of 200 observations from the true VARMA DGP of the RBC model and calculate the impulse responses. This codes then repeats the same exercise for 10000 simulations, and calculate the 2.5 and 97.5 percentile intervals of the simulated impulse responses.

* **sim_roots.gss** outlines the simulation exercise in Section 3 of the paper. It simulates structural parameters from given distributions and calculate the AR and MA roots for different sets of structural parameters.

## Auxiliary codes

* **simulation.txt** is one sample path of 200 observations simulated from the true VARMA DGP of the RBC model.

* **simroots.asc** gives the values of simulated AR and MA roots from Section 3.

* **plot_roots.m** generates figure 2 in the paper. Requires MATLAB.

## Dependecies

* [GAUSS](http://www.aptech.com/products/gauss-mathematical-and-statistical-system/)

* MATLAB

