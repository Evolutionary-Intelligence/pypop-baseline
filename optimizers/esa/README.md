# README

## Reference

Siarry, P., Berthiau, G., Durdin, F. and Haussy, J., 1997. Enhanced simulated annealing for globally minimizing functions of many-continuous variables. ACM Transactions on Mathematical Software, 23(2), pp.209-228.

## Source Code

Unfortunately, we cannot find any open-source implementation for ESA, making comparisons impossible.

## Open-Source Python Implementation in ```PyPop```

[https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/sa/esa.py](https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/sa/esa.py)

Basically, our Python implementation follows the original paper. Since several details were not given very clearly in the original paper, however, different people may give different implementations, resulting in different performance.

### Repeatability

The following result is obtained on the **Rosenbrock** benchmark function:

```Python
best_so_far_y: 3.79e+02
n_function_evaluations: 400000
```
