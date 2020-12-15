subroutine getFeq()
use vars
integer i,j,k
real uv,eu
do i=1,ied
do j=1,jed
	uv=u(i,j)**2+v(i,j)**2
	do k=0,Q
		eu=ei(k,1)*u(i,j)+ei(k,2)*v(i,j)
		feq(k,i,j)=wi(k)*rho(i,j)*(1+3*eu+4.5*eu*eu-1.5*uv)
	enddo
enddo
enddo
end subroutine

subroutine getFeqAt(i,j,rho2,u2,v2) 
use vars
integer i,j,k
real uv,eu
	uv=u2**2+v2**2
	do k=0,Q
		eu=ei(k,1)*u2+ei(k,2)*v2
		g(k)=wi(k)*rho2*(1+3*eu+4.5*eu*eu-1.5*uv)
	enddo
end subroutine
