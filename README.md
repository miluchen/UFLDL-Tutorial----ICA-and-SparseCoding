# UFLDL-Tutorial

The solutions for most of the exericises in [UFLDL-Tutorial](http://ufldl.stanford.edu/wiki/index.php/UFLDL_Tutorial) (the link is not working anymore) can be found easily. But I've had some issues when looking for the discussions about the last two additional exercises: Sparse-Coding and ICA. So here I am.

The code files downloaded from the UFLDL-Tutorial may have some bugs.

### Sparses-Coding
To be specific, the `sampleIMAGES.m` in Spares-Coding needs to be changed. The most important thing is to comment out the data normalizations. Moreover, the optimization algorithm seems to play an important role. [cg](https://en.wikipedia.org/wiki/Conjugate_gradient_method) does have better results than [lbfgs](https://en.wikipedia.org/wiki/Broyden%E2%80%93Fletcher%E2%80%93Goldfarb%E2%80%93Shanno_algorithm). You could try it out yourself to see the difference. If you want to have the same pictures as shown in UFLDL-Tutorial, you may use `256` hidden features and `16*16` visibleSize.

### Independent Component Analysis
As for ICA exercise, the code provided by UFLDL-Tutorial has bug in line-search implementation. Using `backtracking` method, `alpha` should change to be a smaller value (i.e. times `0.9`) if there is no sufficient decrease, while `t` should be a constant. In practice, `t` is chosen to be quite small, say `t = 1e-4`.

One problem is that, `alpha` may become too small. So in my implementation, `alpha` may go under `1e-20` within about `300` iterations. This could be the point where the program should stop (this is not implemented in the program, I just stopped the program manually). It turns out program using line-search reaches a much better minimum within 500 iterations than gradient descent could achieve in `10,000` iterations. The weightMatrix picture is much better.

The method to orthogonalize the weightMatrix also matters. `(A\*A')^(-0.5)\*A` mehthod gives better results than Gram-Schmidt method.

Cheers!
