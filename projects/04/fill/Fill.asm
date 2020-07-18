// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
    @SCREEN
    D=A
    @addr   // every loop, reset addr to screen memory map start
    M=D

    @KBD    // check if user is pressing any key
    D=M
    @CLEAR  // no press = 0, jump to CLEAR
    D;JEQ
    @DARK   // otherwise, jump to DARK
    0;JMP

(CLEAR)
    @addr   
    A=M     // set Areg to M[addr]
    M=0     // set M[ M[addr] ] = 0 [WHITE]
    @addr   
    MD=M+1  // set Dreg and M[addr] to M + 1
    @24576      
    D=D-A   // test if past the screen memory map
    @LOOP   // if true, jump to LOOP
    D;JEQ
    @CLEAR  // else jump to CLEAR again
    0;JMP

(DARK)
    @addr   
    A=M     // set Areg to M[addr]
    M=-1     // set M[ M[addr] ] = -1 [BLACK]
    @addr   
    MD=M+1  // set Dreg and M[addr] to M + 1
    @24576      
    D=D-A   // test if past the screen memory map
    @LOOP   // if true, jump to LOOP
    D;JEQ
    @DARK  // else jump to DARK again
    0;JMP
    





    


