# README

## Reference

[https://homepages.fhv.at/hgb/downloads/ForDistributionFastMAES.tar](https://homepages.fhv.at/hgb/downloads/ForDistributionFastMAES.tar)

Beyer, H.G., 2020, July. Design principles for matrix adaptation evolution strategies. In Proceedings of Annual Conference on Genetic and Evolutionary Computation Companion (pp. 682-700).

## Source Code

### Matlab

The Matlab version can be downloaded from [https://homepages.fhv.at/hgb/downloads/ForDistributionFastMAES.tar](https://homepages.fhv.at/hgb/downloads/ForDistributionFastMAES.tar).

### Repeatability

For making comparisons, we need to use the code, as represented in the same folder.

The following result is obtained on the **Ellipsoid** benchmark function:

```python
best_so_far_y: 1.4466e+05
n_generations: 17968
```

## Open-Source Python Implementation in ```PyPop```

[https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/es/fmaes.py](https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/es/fmaes.py)

For making fair comparisons, we need to use the code with the same hyper-parameter settings, as represented in the same folder.

### Repeatability

Owing to their difference on random number generation (RNG), we do NOT expect to get the exactly same optimization result even on the same function.
As a compromise, we focus more on the *magnitude* similarity. That is, two different implementations should generate as the same magnitude as possible, even under randomness.

```Python
best_so_far_y: 1.49169e+05
n_generations: 17967
```

Luckily, we observe the similar results!
