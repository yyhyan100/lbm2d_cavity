subroutine streaming(f,Q,nx,ny)
	integer i,j,k,nx,ny,Q
	real f(Q,nx,ny)
!f2py intent (in,out, overwrite) f
	
! direction -> x+	
	do i=nx,2,-1
	do j=1,ny
		f(1,i,j)=f(1,i-1,j)
	enddo
	enddo
! direction -> y+
	do i=1,nx
	do j=ny,2,-1
		f(2,i,j)=f(2,i,j-1)
	enddo
	enddo
! direction -> x-
	do i=1,nx-1
	do j=1,ny
		f(3,i,j)=f(3,i+1,j)
	enddo
	enddo
! direction -> y-
	do i=1,nx
	do j=1,ny-1
		f(4,i,j)=f(4,i,j+1)
	enddo
	enddo
! direction -> x+,y+
	do i=nx,2,-1
	do j=ny,2,-1
		f(5,i,j)=f(5,i-1,j-1)
	enddo
	enddo
! direction -> x-,y+
	do i=1,nx-1
	do j=ny,2,-1
		f(6,i,j)=f(6,i+1,j-1)
	enddo
	enddo
! direction -> x-,y-
	do i=1,nx-1
	do j=1,ny-1
		f(7,i,j)=f(7,i+1,j+1)
	enddo
	enddo
! direction -> x+,y-
	do i=nx,2,-1
	do j=1,ny-1
		f(8,i,j)=f(8,i-1,j+1)
	enddo
	enddo
end subroutine
