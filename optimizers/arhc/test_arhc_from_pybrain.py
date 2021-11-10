import time
import numpy as np

from base_functions import ellipsoid
from pybrain.optimization import StochasticHillClimber as SHC

solver = SHC(ellipsoid, 4 * np.ones((1000,)), minimize=True, maxEvaluations=2e6, verbose=True)
start_time = time.time()
solver.learn()
print("Runtime: {:7.5e}".format(time.time() - start_time))
