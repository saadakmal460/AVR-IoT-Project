INCLUDE Irvine32.inc

.data
    dataArray DWORD 5 DUP(?)
    msg BYTE "Enter number: ", 0
    msg1 BYTE "Sum is greater than EAX" , 0
    msg2 BYTE "Sum is less than EAX" , 0
    sum DWORD 0
    
.code

meassage1 proc
    mov edx , OFFSET msg1
    call MsgBox
ret
meassage1 ENDP


meassage2 proc
    mov edx , OFFSET msg2
    call MsgBox
ret
meassage2 ENDP


main PROC
    mov ecx, LENGTHOF dataArray
    mov esi , OFFSET dataArray 

    l1:
        mov edx, OFFSET msg
        call WriteString
        call ReadInt
        mov [esi], eax 
        add esi , TYPE dataArray
        loop l1


        mov ecx, LENGTHOF dataArray
        mov esi , OFFSET dataArray  

    l2:
        mov eax , [esi]
        add sum , eax
		add esi , TYPE dataArray
        loop l2
        
        mov eax , sum
        call Writeint

        call Readint

        cmp sum , eax
        jg m1
        jl m2

        m1 :
        call meassage1
        exit

        m2:
         call meassage2
         exit
    
    exit
main ENDP

END main
