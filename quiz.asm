;makena kong
;mkong02
;lab4 - quiz

 ; registers used
 ; r0: store current answer
 ; r1: store answer memory locations
 ; r2: total 


        .ORIG   x3000

START   AND     R2, R2, #0      ; clear r2

        LD      R0, Q1          ; load q1            
        PUTS                    ; print question
        JSR     GETA            ; jump to answer subroutine
        LD      R1, Q1Answ      ; load q1 answers
        JSR     POINTS          ; jump to scoring subroutine
        ADD     R2, R2, R0      ; add point to total
        
        LD      R0, Q2          ; repeat for q2
        PUTS
        JSR     GETA
        LD      R1, Q2Answ
        JSR     POINTS
        ADD     R2, R2, R0 

        LD      R0, Q3          ; repeat for q3
        PUTS
        JSR     GETA
        LD      R1, Q3Answ
        JSR     POINTS
        ADD     R2, R2, R0 

END     ADD     R3, R2, #-8     ; 0-8: result 1
        BRnz    RESULT1         
        ADD     R3, R2, #-16    ; 9-16: result 2
        BRnz    RESULT2
        LD      R3, NUM_3       ; 17-24: result 3
        ADD     R3, R3, R2
        BRnz    RESULT3
        LD      R3, NUM_4       ; 25-30: result 4
        ADD     R3, R3, R2
        BRnz    RESULT4

RESULT1 LD      R0, RES1        ; load result 1
        PUTS                    ; print
        BRnzp   START           ; loop to start
RESULT2 LD      R0, RES2        
        PUTS    
        BRnzp   START
RESULT3 LD      R0, RES3        
        PUTS
        BRnzp   START
RESULT4 LD      R0, RES4
        PUTS
        BRnzp   START
        
;SUBROUTINE - GET ANSWER
GETA    ST      R7, SAVE_R7     ; save r7
        LEA     R0, ANSWER      ; load answer prompt
        PUTS                    ; print 
        GETC                    ; get answer
        OUT                     ; echo
        LD      R7, ASCII_INVERSE ; load ascii decimal converter
        ADD     R0, R0, R7      ; convert to ascii
        LD      R7, SAVE_R7     ; restore r7
        RET                     ; return to loop


; SUBROUTINE - TALLY POINTS
POINTS  ADD     R0, R0, #-1
        ADD     R1, R1, R0      ; increment mem address
        LDR     R0, R1, #0      ; load value into r0
        RET

SAVE_R7 .FILL   x00
ANSWER  .STRINGZ   "Answer: "
ASCII_INVERSE  .FILL   #-48
NUM_3   .FILL   #-24
NUM_4   .FILL   #-30

Q1      .FILL   x3300
Q2      .FILL   x336D
Q3      .FILL   x33DB

Q1Answ  .FILL   x3369
Q2Answ  .FILL   x33D7
Q3Answ  .FILL   x3482

RES1    .FILL   x3486
RES2    .FILL   x3498 
RES3    .FILL   x34C3 
RES4    .FILL   x34D8 
       
         .END
