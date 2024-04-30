Include Irvine32.inc

.data
	var1 DWORD 123


.code
main proc
	mov eax , var1
	shl eax , 6

	call writeint

	

invoke ExitProcess,0
main endp
end main