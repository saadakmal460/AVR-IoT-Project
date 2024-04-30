INCLUDE Irvine32.inc
.data

	array1 db "Hello World",0
    array2 db "ABC GHI XYZ",0

.code
main PROC

	;EXCHANGING ARRAY
	mov esi, OFFSET array1   
    mov edi, OFFSET array2   
    mov ecx, LENGTHOF array1

	l1:
        mov al, [esi]        
        mov bl, [edi]        
        mov [esi], bl        
        mov [edi], al        
        inc esi              
        inc edi             
        loop l1
        
        
    ;PRINTING ARRAY2
    mov edi, OFFSET array2
    mov ecx , LENGTHOF array2
    print_loop:
    mov eax, [edi]            ; Load the current character
  
    call writechar           ; Print the character
    inc edi                  ; Move to the next character
    loop print_loop           ; Repeat for all characters



exit
main ENDP
END main