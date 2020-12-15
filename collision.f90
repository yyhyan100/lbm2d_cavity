subroutine collision 
	use vars
	integer i,j,k
	do i=1,ied
	do j=1,jed
	do k=0,Q
		f(k,i,j)=(1.0-omg)*f(k,i,j)+omg*feq(k,i,j)
	enddo
	enddo
	enddo
end subroutine
