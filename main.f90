program main
use vars

call init()
tt=0.0
kstep=1
do while (tt<=t_end)
	call streaming()
	call getMacro()
	call getFeq()
	call collision()
	call bc()
	call output(kstep)
	kstep=kstep+1
	tt=tt+dt
enddo
call deallocateField()
print *, "done!"
end program
!----------------------------------------------------------------------------
subroutine getMacro() 
use vars
integer i,j,k

do i=2,ied-1
do j=2,jed-1
	rho(i,j)=0.0
	u(i,j)=0.0
	v(i,j)=0.0
	do k=0,Q
		rho(i,j)=rho(i,j)+f(k,i,j)
		u(i,j)=u(i,j)+ei(k,1)*f(k,i,j)
		v(i,j)=v(i,j)+ei(k,2)*f(k,i,j)
	enddo
	u(i,j)=u(i,j)/rho(i,j)
	v(i,j)=v(i,j)/rho(i,j)
enddo
enddo
end subroutine
