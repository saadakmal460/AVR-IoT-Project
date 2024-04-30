INCLUDE Irvine32.inc


.386
.model flat,stdcall
.stack 4096


.code
main proc
	mov eax , 123
	shl eax , 6

	call Writeint
			

			

	invoke ExitProcess,0
main endp
end main