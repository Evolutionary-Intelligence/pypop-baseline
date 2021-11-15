# README

## Reference

[https://homepages.fhv.at/hgb/downloads/mu_mu_I_lambda-ES.oct](https://homepages.fhv.at/hgb/downloads/mu_mu_I_lambda-ES.oct)

Beyer, H.G., 2020, July. Design principles for matrix adaptation evolution strategies. In Proceedings of Annual Conference on Genetic and Evolutionary Computation Companion (pp. 682-700).

[http://www.scholarpedia.org/article/Evolution_strategies](http://www.scholarpedia.org/article/Evolution_strategies)

## Source Code

### Matlab/Octave

The Matlab/Octave version can be downloaded from [https://homepages.fhv.at/hgb/downloads/mu_mu_I_lambda-ES.oct](https://homepages.fhv.at/hgb/downloads/mu_mu_I_lambda-ES.oct).

### Repeatability

For making comparisons, we need to use the code, as represented in the same folder.

The following result is obtained on the **Ellipsoid** benchmark function:

```python
best_so_far_y: 6.0135e+06
n_function_evaluations: 2000448
```

## Open-Source Python Implementation in ```PyPop```

[https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/es/saes.py](https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/es/saes.py)

For making fair comparisons, we need to use the code with the same hyper-parameter settings, as represented in the same folder.

### Repeatability

Owing to their difference on random number generation (RNG), we do NOT expect to get the exactly same optimization result even on the same function.
As a compromise, we focus more on the *magnitude* similarity. That is, two different implementations should generate as the same magnitude as possible, even under randomness.

```Python
best_so_far_y: 8.85134e+05
n_function_evaluations: 2000000
```

Luckily, we observe the similar results (within the one magnitude)!
