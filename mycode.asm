MOV SI, 1301H        ; set SI as Pointer for First input Matrix
MOV DI, 1401H        ;Set DI as Pointer for second input Matrix
MOV BP, 1501H        ;Set BP as Pointer for Product Matrix
MOV CL, 03H          ;set CL as count for element in a row
MOV CH, 03H          ;set CH as count for element in column
MOV DH, CH
REPEAT3:
MOV BL, DH           ;Copy the column count in BL register
REPEAT2:
MOV DL, 00H          ;Intialize sum as zero           
MOV CH,DH            ;Get the column count in DH
REPEAT1:
MOV AL,[SI]          ;Get one element of the row in al register
MUL [DI]             ;Get the Product of row and column element in AL
ADD DL,AL            ;ADD the Product to SUM
INC SI               ;Increment the first input matrix pointer
ADD DI, 03           ;let DI pointer to next element ofsame column of 2nd Matrix 
DEC CH               ;Decrement of column count
JNZ REPEAT1          ;Repeat multiplication and addition until DH count zero
MOV [BP],DL          ;Store an element of product matrix in memory
INC BP               ;Increment the product matrix pointer
SUB SI, 03H          ;Make SI to point to first element of the row
SUB DI, 09H          
INC DI
DEC BL               ;Decrement column count
JNZ REPEAT2          ;Repeat multiplication and addition of row in 1st matrix with next column of 2nd matrix
ADD SI, 03H          ;Let SI pointer first element of 2nd matrix
MOV DI, 1401H        ;Make DI to point to first element of 2nd matrix
DEC CL               ;Decrement of row Count 
JNZ REPEAT3          ;Repear multiplication and addition of next row in 1st matrix withh all column 2nd matrix
HLT                  ; halt and execution