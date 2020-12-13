subroutine streaming 
	use vars
	integer i,j,k
	
! direction -> x+	
	do i=ied-1,2,-1
	do j=2,jed-1
		f(i,j,1)=f(i-1,j,1)
	enddo
	enddo
! direction -> y+
	do i=2,ied-1
	do j=jed-1,2,-1
		f(i,j,2)=f(i,j-1,2)
	enddo
	enddo
! direction -> x-
	do i=2,ied-1
	do j=2,jed-1
		f(i,j,3)=f(i+1,j,3)
	enddo
	enddo
! direction -> y-
	do i=2,ied-1
	do j=2,jed-1
		f(i,j,4)=f(i,j+1,4)
	enddo
	enddo
! direction -> x+,y+
	do i=ied-1,2,-1
	do j=jed-1,2,-1
		f(i,j,5)=f(i-1,j-1,5)
	enddo
	enddo
! direction -> x-,y+
	do i=2,ied-1
	do j=jed-1,2,-1
		f(i,j,6)=f(i+1,j-1,6)
	enddo
	enddo
! direction -> x-,y-
	do i=2,ied-1
	do j=2,jed-1
		f(i,j,7)=f(i+1,j+1,7)
	enddo
	enddo
! direction -> x+,y-
	do i=ied-1,2,-1
	do j=2,jed-1
		f(i,j,8)=f(i-1,j+1,8)
	enddo
	enddo
end subroutine
