import numpy as np

def tecplot_writer(filename, variables, X=[], Y=[]):

	if filename[-4:] != '.dat':
		filename += '.dat'

	with open(filename, 'w') as f:
		f.write('Variables = "X", "Y"')
		for key in variables.keys():
			f.write(', "' + key + '"')
		f.write('\n\nZone I='+str(len(X))+', J='+str(len(Y))+', F=POINT\n')

		for j in range(len(Y)):
			for i in range(len(X)):
				f.write(str(X[i]) + ' ' + str(Y[j]))
				for var in variables.values():
					f.write(' ' + str(var[i,j]))
				f.write('\n')

