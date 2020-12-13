subroutine collision 
	use vars
	integer i,j,k
	do i=2,ied-1
	do j=2,jed-1
	do k=0,Q
		f(i,j,k)=(1.0-omg)*f(i,j,k)+omg*feq(i,j,k)
	enddo
	enddo
	enddo

end subroutine
