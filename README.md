# UFLDL-Tutorial

The solutions of the first 9 exericises in UFLDL-Tutorial can be found easily. But I've had some issues when looking for the discussions about the last two additional exercises: Sparse-Coding and ICA. The code files downloaded from the UFLDL-Tutorial may have some bugs.

To be specific, the 'sampleIMAGES.m' in Spares-Coding needs to be changed. The most important thing is to comment out the data normalizations. Moreover, the optimization algorithm seems to play an important role. 'cg' does have better results than 'lbfgs'. You could try it out yourself to see the difference.

As for ICA exercise, the code provided by UFLDL-Tutorial has bug in line-search implementation. Using 'backtracking' method, 'alpha' should change to be a smaller value (i.e. times 0.9) if there is no sufficient decrease, while 't' should be a constant. In practice, 't' is chosen to be quite small, say t = 1e-4. One problem is that, 'alpha' may become too small. So in my implementation, 'alpha' may go under 1e-20. This could be the point where the program should stop (this is not implemented in the program). It turns out program using line-search reaches a much better minimum within 500 iterations than gradient descent could achieve in 1,000 iterations.

Cheers!
