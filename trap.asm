 ; Makena Kong
 ; mkong02
 ; Asgn 4

 ; write a trap @ trapx26
 ; manually add routine to trap vector table at trap x26

 ; answers to questions???
 ; 2. yes the kbsr is in there
 ; 3. trap_out uses polling 
 ;      x555    saves r1
 ;      x556    checks kbsr
 ;      x557    waits/polls for data
 ;      x558    display contents in r0
 ;      x559    restores original r1
 ;      x55a    resets pc

        .ORIG   x3300

        ST      R0, SAVE_R0     ; save r0
        ST      R1, SAVE_R1     ; save r1
        ST      R2, SAVE_R2     ; save r2
        ;maybe store enter key stuff in r2 if you wnat to try

;keyboard echo routine
POLL1   LDI     R1, KBSR        
        BRzp    POLL1
        LDI     R1, KBDR  
;add check for enter key here
        ADD     R1, R1, x-A     ; check if its the enter key
        BRz     DONE
        ADD     R1, R1, xA

POLL2   LDI     R2, DSR           
        BRzp    POLL2               
        STI     R1, DDR         

;storing chars
        STR     R1, R0, #0      ; store char in correct mem
        ADD     R0, R0, #1      ; increment memory location
        BRnzp   POLL1

DONE    ;ADD     R0, R0, #1      ; increment memory location
        AND     R1, R1, #0
        STR     R1, R0, #0       ; add null char
        LD      R2, SAVE_R2     ; restore r2
        LD      R1, SAVE_R1     ; restore r1
        LD      R0, SAVE_R0     ; restore r0
        RET
       
SAVE_R0 .FILL   X00
SAVE_R1 .FILL   X00
SAVE_R2 .FILL   X00

NULL    .FILL   X00

KBSR    .FILL   xFE00
KBDR    .FILL   xFE02
DSR     .FILL   xFE04
DDR     .FILL   xFE06

        .END
