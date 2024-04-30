INCLUDE Irvine32.inc

.data
    userString BYTE 100 DUP(?)
    character BYTE 'R', 0   

.code

ArrayFind PROC
    mov ecx, LENGTHOF userString
    mov esi, OFFSET userString
    mov al, character  
    l1:
        cmp [esi], al
        je found
        inc esi
        loop l1

    
    mov DL, 0
    ret

found:
    mov DL, al
    ret

ArrayFind ENDP


main PROC
    mov edx, OFFSET userString
    mov ecx, SIZEOF userString
    call ReadString

    call ArrayFind



    mov edx, OFFSET userString
    mov ecx, SIZEOF userString
    call ReadString

   

    mov ecx,LENGTHOF userString
    mov esi,OFFSET userString
    L1:
        and BYTE PTR [esi],11011111b ; clear bit 5
        inc esi
        loop L1

        mov EDX,OFFSET userString
        

    call ArrayFind

    ;add dl,dh
    movzx eax, DL 
    call WriteInt 


    exit
main ENDP

END main
