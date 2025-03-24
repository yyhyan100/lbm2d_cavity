import numpy as np
import pandas as pd 
import lbm2d_sover as lbm2d 

# Simulation parameters
params= pd.read_excel('inputs.xlsx',header=None,index_col=None)
m,n=params.shape
pm=dict()
for i in range(m):
    pm[params.iloc[i,0]]=params.iloc[i,1]

print("parameters read: ",pm)
field=lbm2d.lattice(pm)

field.u[-1,:]=pm['u0']
field.equilibrium()
field.f=field.feq.copy()

# Run simulation
field.run(pm['n_steps'])
