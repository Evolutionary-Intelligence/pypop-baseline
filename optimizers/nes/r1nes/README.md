# README

## Reference

Sun, Y., Schaul, T., Gomez, F. and Schmidhuber, J., 2013, July.
[A linear time natural evolution strategy for non-separable functions](https://dl.acm.org/doi/abs/10.1145/2464576.2464608).
In Proceedings of Annual Conference Companion on Genetic and Evolutionary Computation (pp. 61-62).
    
* [Complementary Version](https://arxiv.org/abs/1106.1998)

## Source Code

### Matlab

The official Matlab version, written by one of the original authors (Y. Sun), can be downloaded from [http://schaul.site44.com/code/r1nes.m](http://schaul.site44.com/code/r1nes.m).

### Repeatability

For making comparisons, we need to slight modify the code, as represented in the same folder.

The following result is obtained on the **Ellipsoid** benchmark function:

```matlab
>> [~,fopt]=r1nes(@poEllipsoid_,1000,4*ones(1000,1),2e6);disp(fopt);
   6.1939e+05
```

## Open-Source Python Implementation in ```PyPop```

[https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/nes/r1nes.py](https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/nes/r1nes.py)

### Repeatability

Owing to their difference on random number generation (RNG), we do NOT expect the exactly same optimization result even on the same function.
As a compromise, we focus more on the *magnitude* similarity. That is, two different implementations should generate as the same magnitude as possible.

```Python
# https://github.com/Evolutionary-Intelligence/pypop/blob/main/optimizers/nes/test_r1nes.py
best_so_far_y: 1.2296e5
```

Luckily, we observe the similar results (Note that Ellipsoid is ill-conditioned)! 
