import unittest
import time
import numpy as np

from base_functions import rosenbrock
from csa import CSA as Solver


class TestCSA(unittest.TestCase):
    def test_optimize(self):
        start_run = time.time()
        ndim_problem = 1000
        for f in [rosenbrock]:
            print('*' * 7 + ' ' + f.__name__ + ' ' + '*' * 7)
            problem = {'fitness_function': f,
                       'ndim_problem': ndim_problem,
                       'lower_boundary': -5 * np.ones((ndim_problem,)),
                       'upper_boundary': 5 * np.ones((ndim_problem,))}
            options = {'max_function_evaluations': 4e5,
                       'fitness_threshold': 1e-10,
                       'seed_rng': 0,
                       'x': 4 * np.ones((ndim_problem,)),
                       'v': np.ones((ndim_problem,)),
                       'verbose_frequency': 1,
                       'record_fitness': True,
                       'record_fitness_frequency': 50000}
            solver = Solver(problem, options)
            results = solver.optimize()
            print(results)
            print('*** Runtime: {:7.5e}'.format(time.time() - start_run))


if __name__ == '__main__':
    unittest.main()
