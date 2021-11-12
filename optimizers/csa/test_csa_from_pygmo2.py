import time
import numpy as np
from pygmo import *

from base_functions import rosenbrock


class Rosenbrock():
    def __init__(self, dim):
        self.dim = dim
    
    def fitness(self, x):
        return [rosenbrock(x)]
    
    def get_bounds(self):
        return (-5 * np.ones((self.dim,)), 5 * np.ones((self.dim,)))


start_time = time.time()
max_evaluations = 2e6
ndim_problem = 1000
bin_size = 10
n_range_adj = 10
n_T_adj = int(max_evaluations / (ndim_problem * bin_size * n_range_adj))
algo = algorithm(simulated_annealing(n_T_adj=n_T_adj))
algo.set_verbosity(1)
prob = problem(Rosenbrock(ndim_problem))
pop = population(prob, 0)
pop.push_back(x=4*np.ones(ndim_problem,))
pop = algo.evolve(pop)
print("Runtime: {:7.5e}".format(time.time() - start_time))
