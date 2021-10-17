# README

## Reference

Beyer, H.G., 2020, July.
[Design principles for matrix adaptation evolution strategies](https://dl.acm.org/doi/abs/10.1145/3377929.3389870).
In Proceedings of Annual Conference on Genetic and Evolutionary Computation Companion (pp. 682-700).

Beyer, H.G. and Sendhoff, B., 2017.
[Simplify your covariance matrix adaptation evolution strategy](https://ieeexplore.ieee.org/document/7875115).
IEEE Transactions on Evolutionary Computation, 21(5), pp.746-759.

## Source Code

### Matlab/Octave

The official Matlab/Octave version, written by one of the original authors (H.G. Beyer), can be downloaded from [https://homepages.fhv.at/hgb/downloads/ForDistributionFastMAES.tar](https://homepages.fhv.at/hgb/downloads/ForDistributionFastMAES.tar).

### Repeatability

For making comparisons, we need to slightly modify the code, as presented in the same folder.

The following result is obtained on the **Ellipsoid** benchmark function:

```matlab
best_so_far_y: 1.4466e+05
n_generations: 17967
```

## Open-Source Python Implementation in ```PyPop```

[https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/es/maes.py](https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/es/maes.py)

### Repeatability

Owing to their difference on random number generation (RNG), we do NOT expect the exactly same optimization result even on the same function.
As a compromise, we focus more on the *magnitude* similarity. That is, two different implementations should generate as the same magnitude as possible.

```Python
# https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/es/test_maes.py
best_so_far_y: 1.4436e5
n_generations: 17968
```

Luckily, we observe the very similar results!
