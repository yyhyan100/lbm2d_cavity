subroutine collision 
	use vars
	integer i,j,k
	do i=2,ied-1
	do j=2,jed-1
	do k=0,Q
		f(k,i,j)=(1.0-omg)*f(k,i,j)+omg*feq(k,i,j)
	enddo
	enddo
	enddo
end subroutine
