# README

## Reference

[https://github.com/esa/pagmo2/blob/master/src/algorithms/simulated_annealing.cpp](https://github.com/esa/pagmo2/blob/master/src/algorithms/simulated_annealing.cpp)

Corana, A., Marchesi, M., Martini, C. and Ridella, S., 1987. Minimizing multimodal functions of continuous variables with the “simulated annealing” algorithm. ACM Transactions on Mathematical Software, 13(3), pp.262-280.

## Source Code

### C++

The C++ version can be downloaded from [https://github.com/esa/pagmo2/blob/master/src/algorithms/simulated_annealing.cpp](https://github.com/esa/pagmo2/blob/master/src/algorithms/simulated_annealing.cpp).

### Repeatability

Unfortunately, the well-written C++ version differs from the original paper regarding some implementation details. Take [the choice of variables](https://github.com/esa/pagmo2/blob/master/src/algorithms/simulated_annealing.cpp#L155) as an example, where it uses *randomness* to choose. As a result, such differences make fair comparisons between our Python version (where it uses *cycle* to choose) and this C++ version difficult.

The following result is obtained on the **Rosenbrock** benchmark function:

```python
best_so_far_y: 1.634e3
n_function_evaluations: 400000
```

## Open-Source Python Implementation in ```PyPop```

[https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/sa/csa.py](https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/sa/csa.py)

Basically, our Python implementation, different from the above C++ version, follows the original paper. Since several details were not given very clearly in the original paper, however, different people may give different implementations, resulting in different performance.

### Repeatability

The following result is obtained on the **Rosenbrock** benchmark function:

```Python
best_so_far_y: 3.079e3
n_function_evaluations: 400000
```

NOT surprisingly, we obtain two different results since they come from two different implementations. But luckily, they have the same magnitude.
