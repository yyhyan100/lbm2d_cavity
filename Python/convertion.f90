subroutine get_feq(ei,u,v,rho,feq,Q,nx,ny)
integer i,j,k,Q,nx,ny
real ei(Q,2), u(nx,ny), v(nx,ny), rho(nx,ny), feq(Q,nx,ny)
real uv,eu
!f2py intent (in) ei,u,v 
!f2py intent (in,out,overwrite) feq
do i=1,nx
do j=1,ny
	uv=u(i,j)**2+v(i,j)**2
	do k=1,Q
		eu=ei(k,1)*u(i,j)+ei(k,2)*v(i,j)
		feq(k,i,j)=wi(k)*rho(i,j)*(1+3*eu+4.5*eu*eu-1.5*uv)
	enddo
enddo
enddo
end subroutine

subroutine get_macro(ei,u,v,rho,f,Q,nx,ny) 
integer i,j,k,Q,nx,ny
real ei(Q,2), u(nx,ny), v(nx,ny), rho(nx,ny), f(Q,nx,ny)
!f2py intent (in) ei,f
!f2py intent (in,out,overwrite) u,v,rho
do i=1,nx
do j=1,ny-1
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
