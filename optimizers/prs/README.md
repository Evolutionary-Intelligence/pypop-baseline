# README

## Reference

[https://github.com/pybrain/pybrain/blob/master/pybrain/optimization/randomsearch.py](https://github.com/pybrain/pybrain/blob/master/pybrain/optimization/randomsearch.py)

Schaul, T., Bayer, J., Wierstra, D., Sun, Y., Felder, M., Sehnke, F., Rückstieß, T. and Schmidhuber, J., 2010. PyBrain. Journal of Machine Learning Research, 11(24), pp.743-746.

## Source Code

### Python

The Python version can be downloaded from [https://github.com/pybrain/pybrain/blob/master/pybrain/optimization/randomsearch.py](https://github.com/pybrain/pybrain/blob/master/pybrain/optimization/randomsearch.py).

### Repeatability

For making comparisons, we need to use the code, as represented in the same folder.

The following result is obtained on the **Ellipsoid** benchmark function:

```python
best_so_far_y: 4.0489098e7
n_function_evaluations: about 2000000
```

## Open-Source Python Implementation in ```PyPop```

[https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/rs/prs.py](https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/rs/prs.py)

For making fair comparisons, we need to use the code with the same hyper-parameter settings, as represented in the same folder.

### Repeatability

Owing to their difference on random number generation (RNG), we do NOT expect the exactly same optimization result even on the same function.
As a compromise, we focus more on the *magnitude* similarity. That is, two different implementations should generate as the same magnitude as possible, even under randomness.

```Python
best_so_far_y: 3.9791342e7
n_function_evaluations: 2000000
```

Luckily, we observe the almostly same results!
