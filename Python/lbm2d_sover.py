import numpy as np
import convertion as cvt
import streaming as st
import d2q9
import tecwriter as tw
import bc
class lattice():
    def __init__(self, pm):
        self.nx = pm["nx"]
        self.ny = pm["ny"]
        nx,ny = self.nx,self.ny
        self.n = nx * ny
        self.tau=pm["tau"]
        self.omega=1.0/self.tau
        self.Q = d2q9.Q
        self.ei = d2q9.ei
        self.wi = d2q9.wi
        Q=self.Q
        self.f=np.zeros((Q,nx,ny),dtype=np.double,order='F')
        self.feq=np.zeros((Q,nx,ny),dtype=np.double,order='F')
        self.u=np.zeros((nx,ny),dtype=np.double,order='F') 
        self.v=np.zeros((nx,ny),dtype=np.double,order='F') 
        self.rho=np.ones((nx,ny),dtype=np.double,order='F')
        self.ksave=pm["kstep_save"]
        self.kview=pm["kstep_view"]
        self.filename=pm["filename"]
    def equilibrium(self):
        cvt.get_feq(self.ei,self.wi, self.u,self.v,self.rho,self.feq)
      
    def collision(self):
        self.f[:,:,:] += - self.omega * (self.f - self.feq)

    def streaming(self):
        st.streaming(self.f)
    
    def macroscopic(self):
        cvt.get_macro(self.ei,self.u,self.v,self.rho,self.f)

    def run1(self):
        self.equilibrium()
        self.collision()
        self.streaming()
        self.macroscopic()
        bc.bc(self)

    def run(self, n_steps):
        for i in range(n_steps):
            self.run1()
            if i % self.kview == 0:
                print("time steps:", i)
            if i % self.ksave == 0:
                tw.tecplot_writer(self.filename+"_"+str(i), {'u':self.u, 'v':self.v, 'rho':self.rho}, np.arange(self.nx), np.arange(self.ny))