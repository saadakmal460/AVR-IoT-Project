Include Irvine32.inc

.data
    
    int1 BYTE ?
    int2 BYTE ?


.code

getRandom PROC
    
        mov ecx , eax
        l1:
            mov edx , eax
            loop l1


ret
getRandom ENDP

main PROC

    mov eax ,0
    mov esi ,OFFSET int1
    call Readint
    
    call getRandom
    
    mov eax , edx
    call writeint

   
   
    INVOKE ExitProcess, 0
main ENDP
END main
