import numpy as np
import conversion as cvt
import streaming as st
import bc
class lattice():
    def __init__(self, nx, ny):
        self.nx = nx
        self.ny = ny
        self.n = nx * ny
        self.Q = 9
        nx,ny = self.nx,self.ny
        Q=self.Q
        self.f=np.zeros(Q,nx,ny,dtype=np.double,order='F')
        self.feq=np.zeros(Q,nx,ny,dtype=np.double,order='F')
        self.u=np.zeros(nx,ny,dtype=np.double,order='F') 
        self.v=np.zeros(nx,ny,dtype=np.double,order='F') 
        self.rho=np.ones(nx,ny,dtype=np.double,order='F')
    
    def equilibrium(self):
        cvt.getfeq(self.ei,self.u,self.v,self.rho,self.feq)
      
    def collision(self, omega):
        self.f[:,:,:] += - omega * (self.f - self.feq)

    def streaming(self):
        st.streaming(self.f)
    
    def macroscopic(self):
        cvt.getmacro(self.ei,self.u,self.v,self.rho,self.f)

    def run1(self, omega):
        self.equilibrium()
        self.collision(omega)
        self.streaming()
        self.macroscopic()
        bc.boundary(self.f,self.u,self.rho,self.nx,self.ny)

    def run(self, n_steps, omega):
        for i in range(n_steps):
            self.run1(omega)
    