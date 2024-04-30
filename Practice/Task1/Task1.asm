Include Irvine32.inc

.data
var1 BYTE 0F5h     ; Change F5h to 0F5h to represent a positive value
var2 sWORD -35
var3 sWORD -515

.code
main PROC
    
   
   
    INVOKE ExitProcess, 0
main ENDP
END main
