def bc(field):
	bouncebk(field)
	top(field)


def top(field):  #Zou-He bc for moving lid
	nx=field.nx
	ny=field.ny
	f=field.f
	u=field.u
	rho=field.rho
	j=ny-1
	for i in range(nx):
		rho[i,j]=(f[0,i,j]+f[1,i,j]+f[3,i,j]+2*(f[2,i,j]+f[5,i,j]+f[6,i,j]))
		f[4,i,j]=f[2,i,j]
		f[7,i,j]=f[5,i,j]+0.5*(f[1,i,j]-f[3,i,j])-rho[i,j]*u[i,j]/6
		f[8,i,j]=f[6,i,j]-0.5*(f[1,i,j]-f[3,i,j])+rho[i,j]*u[i,j]/6


def bouncebk(field):
	nx=field.nx
	ny=field.ny
	f=field.f
# lower	
	j=0
	for i in range(nx):
		f[2,i,j]=f[4,i,j]
		f[5,i,j]=f[7,i,j]
		f[6,i,j]=f[8,i,j]


# left	
	i=0
	for j in range(ny):
		f[1,i,j]=f[3,i,j]
		f[5,i,j]=f[7,i,j]
		f[8,i,j]=f[6,i,j]

# right
	i=nx-1
	for j in range(ny):
		f[3,i,j]=f[1,i,j]
		f[6,i,j]=f[8,i,j]
		f[7,i,j]=f[5,i,j]

	

