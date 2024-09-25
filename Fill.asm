// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(LOOP)
    @KBD
    D=M
    @ON
    D;JGT
    @OFF
    0;JMP
(ON)
    @R0
    M=-1
    @DRAW
    0;JMP
(OFF)
    @R0
    M=0
    @DRAW
    0;JMP

(DRAW)
    @8191
    D=A
    @R1
    M=D
    (NEXT)
        @R1
        D=M
        @pos
        M=D
        @SCREEN
        D=A
        @pos
        M=M+D
        @R0
        D=M
        @pos
        A=M
        M=D
        @R1
        D=M-1
        M=D
        @NEXT
        D;JGE
    @LOOP
    0;JMP
