subroutine output(kstep)
use io_parameters
integer kstep
if (mod(kstep,kstep_view)==0) then
	print *, "step=",kstep
endif
if (mod(kstep,kstep_save)==0) then
	if (file_format==1) then
		call output_tecplot(kstep)
	endif
endif
end subroutine

subroutine output_tecplot(kstep) ! 输出几何及物理量 （tecplot格式）
use vars
use io_parameters
character*50 num2char,filename
integer kstep
filename=trim(output_filename)
call NumToChar(kstep, num2char, len(num2char))
filename=trim(filename)//trim(num2char)//".dat"
print*, "write data file ...", filename
open(99,file=filename)
	write(99,*) "variables=x,y,rho,u,v"
	write(99,*)  "zone ", "i= ", ied, " j= ", jed
	do j=1,jed
		do i=1,ied
			write(99,*) x(i,j),y(i,j),rho(i,j),u(i,j),v(i,j)
        enddo
	enddo
close(99)
end subroutine output_tecplot

!----------------------------------------------------------------------------	  
subroutine NumToChar(ninput, name1, length)
      character(len=length) name1
	  character(len=128)::tmp
	  dimension ibit(12)
      logical highbit
    
	  n = ninput
      do ihigh = 8, 0, -1
	    if (n / 10**ihigh.ne.0) then
	      exit
	    endif
	  enddo

      do i = 1, ihigh
	    itmp = 10**(ihigh - i + 1)
        ibit(i) = n / itmp
	    n = n - ibit(i) * itmp
	  enddo
	  ibit(ihigh + 1) = n

      highbit=.false.
      do j=1, ihigh + 1
        if (highbit) then
          tmp=TRIM(name1)//char(48+ibit(j))
          name1=TRIM(tmp)
        else if (ibit(j).ne.0) then
          name1=char(48+ibit(j))
          highbit=.true.
        endif
      enddo
end subroutine

