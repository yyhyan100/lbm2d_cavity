subroutine boundary 
	use vars
	integer i,j,k
	real g2(0:8)
! lower	
	j=1
	do i=2,ied-1
		call getFeqAt(i,j,rho(i,j+1),u(i,j),v(i,j))
		g2(:)=g(:)
		call getFeqAt(i,j,rho(i,j+1),u(i,j+1),v(i,j+1))
		f(i,j,:)=g2(:)+f(i,j+1,:)-g(:)
	enddo
! upper	
	j=jed
	do i=2,ied-1
		call getFeqAt(i,j,rho(i,j-1),u(i,j),v(i,j))
		g2(:)=g(:)
		call getFeqAt(i,j,rho(i,j-1),u(i,j-1),v(i,j-1))
		f(i,j,:)=g2(:)+f(i,j-1,:)-g(:)
	enddo
! left	
	i=1
	do j=1,jed
		call getFeqAt(i,j,rho(i+1,j),u(i,j),v(i,j))
		g2(:)=g(:)
		call getFeqAt(i,j,rho(i+1,j),u(i+1,j),v(i+1,j))
		f(i,j,:)=g2(:)+f(i+1,j,:)-g(:)
	enddo
! right
	i=ied
	do j=1,jed
		call getFeqAt(i,j,rho(i-1,j),u(i,j),v(i,j))
		g2(:)=g(:)
		call getFeqAt(i,j,rho(i-1,j),u(i-1,j),v(i-1,j))
		f(i,j,:)=g2(:)+f(i-1,j,:)-g(:)
	enddo
	
! corner points, bounce back -- test
	i=1;j=1
	f(i,j,5)=f(i+1,j+1,7)
	i=ied;j=1
	f(i,j,6)=f(i-1,j+1,8)
	
end subroutine

