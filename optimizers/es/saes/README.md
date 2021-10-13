# README

## Reference

Beyer, H.G., 2020, July.
[Design principles for matrix adaptation evolution strategies](https://dl.acm.org/doi/abs/10.1145/3377929.3389870).
In Proceedings of Annual Conference on Genetic and Evolutionary Computation Companion (pp. 682-700).

[http://www.scholarpedia.org/article/Evolution_strategies](http://www.scholarpedia.org/article/Evolution_strategies)

## Source Code

### Matlab/Octave

The official Matlab/Octave version, written by one of the original authors (H.G. Beyer), can be downloaded from [https://homepages.fhv.at/hgb/downloads/mu_mu_I_lambda-ES.oct](https://homepages.fhv.at/hgb/downloads/mu_mu_I_lambda-ES.oct).

### Repeatability

For making comparisons, we need to slightly modify the code, as represented in the same folder.

The following result is obtained on the **Ellipsoid** benchmark function:

```matlab
best_so_far_y: 8.2085e+05
```

## Open-Source Python Implementation in ```PyPop```

[https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/es/saes.py](https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/es/saes.py)

### Repeatability

Owing to their difference on random number generation (RNG), we do NOT expect the exactly same optimization result even on the same function.
As a compromise, we focus more on the *magnitude* similarity. That is, two different implementations should generate as the same magnitude as possible.

```Python
# https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/es/test_saes.py
best_so_far_y: 8.8513e+05
```

Luckily, we observe the similar results (Note that Ellipsoid is ill-conditioned)!
