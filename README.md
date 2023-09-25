# Markov_chain_lumpability
R scripts for solving the problem of approximate lumpability

1. Matrix_reparameterization_for_lumpability.r
  Simple scripts for vectorization of a matrix in order to re-write the problem of approximate lumpability in vector form

2. Approximate_lumpability_algorithm.r
   Scripts needed to solve the problem of approximate lumpability, i.e.: a) construction of lumpability condition matrix, b) solution via Moore-Penrose inverse and c) application of Dykstra's alternating projection algorithm. Examples given include
   the lumping of large credit agency transition matrices, as well as a portfolio optimization problem (as presented in the corresponding paper).

3. Lumpability_example.r
   Example of solving the approximate lumpability problem to obtain an IFRS 9-compliant transition matrix.
