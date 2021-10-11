# README

## Reference

Schaul, T., Glasmachers, T. and Schmidhuber, J., 2011, July.
[High dimensions and heavy tails for natural evolution strategies](https://dl.acm.org/doi/abs/10.1145/2001576.2001692).
In Proceedings of Annual Conference on Genetic and Evolutionary Computation (pp. 845-852).

## Source Code

### Python

The official Python version, written by one of the original authors (T. Schaul), can be downloaded from [http://schaul.site44.com/code/snes.py](http://schaul.site44.com/code/snes.py).

### Repeatability

For making comparisons, we need to use the code, as represented in the same folder.

The following result is obtained on the **Ellipsoid** benchmark function:

```python
# Note that the negative Ellipsoid function is used here.
# Therefore for comparisons, the final result should be negated.
best_so_far_y: 9.8270e-11    (after being negated)
n_function_evaluations: 655368
```

## Open-Source Python Implementation in ```PyPop```

[https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/nes/snes.py](https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/nes/snes.py)

### Repeatability

Owing to their difference on random number generation (RNG), we do NOT expect the exactly same optimization result even on the same function.
As a compromise, we focus more on the *magnitude* similarity. That is, two different implementations should generate as the same magnitude as possible.

```Python
# https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/nes/test_snes.py
best_so_far_y: 9.9659e-11
n_function_evaluations: 658989
```

Luckily, we observe the almostly same results!
