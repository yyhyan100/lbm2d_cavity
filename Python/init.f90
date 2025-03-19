subroutine init() 
	use vars
	use io_parameters
	integer i,j
	real uv,eu
	open(10,file="control.in")
	read(10,*) ied,jed,dx,dt
	read(10,*) t_end,kstep_save,kstep_view,file_format
	read(10,*) output_filename
	close(10)
	omg=0.9
	call allocateField()
	call gengrid()
	u(:,:)=0.0
	v(:,:)=0.0
	rho(:,:)=1.0
	u(2:ied-1,jed)=0.1
	ei(:,:)=0.0
	ei(1,1)=1.0
	ei(5,1)=1.0
	ei(8,1)=1.0
	ei(3,1)=-1.0
	ei(6,1)=-1.0
	ei(7,1)=-1.0
	ei(5,2)=1.0
	ei(2,2)=1.0
	ei(6,2)=1.0
	ei(4,2)=-1.0
	ei(7,2)=-1.0
	ei(8,2)=-1.0
	wi(0)=4.0/9
	wi(1:4)=1.0/9
	wi(5:8)=1.0/36

	do i=1,ied
	do j=1,jed
		uv=u(i,j)**2+v(i,j)**2
		do k=0,Q
			eu=ei(k,1)*u(i,j)+ei(k,2)*v(i,j)
			feq(k,i,j)=wi(k)*rho(i,j)*(1+3*eu+4.5*eu*eu-1.5*uv)
		enddo
	enddo
	enddo
	f(:,:,:)=feq(:,:,:)
end subroutine

!-----------------------------------------------
subroutine gengrid 
use vars
do i=1,ied
do j=1,jed
	x(i,j)=(i-1)*dx
	y(i,j)=(j-1)*dx
enddo
enddo
end subroutine
