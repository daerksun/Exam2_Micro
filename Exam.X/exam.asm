#include "p16F887.inc"   ; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

    BCF PORTC,0		;reset
    MOVLW 0x01
    MOVWF PORTD
    
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
  
    GOTO    START

MAIN_PROG CODE                      ; let linker place main program

START

i equ 0x30
j equ 0x31
k equ 0x32
c1 equ 0x33
c2 equ 0x34
c3 equ 0x35
c4 equ 0x36
c5 equ 0x37
c6 equ 0x38
c7 equ 0x39
c8 equ 0x40
d1 equ 0x41
d2 equ 0x42
d3 equ 0x43
d4 equ 0x44
d5 equ 0x45
d6 equ 0x46
d7 equ 0x47
d8 equ 0x48
aux equ 0x49

START

    BANKSEL PORTA ;
    CLRF PORTA ;Init PORTA
    BANKSEL ANSEL ;
    CLRF ANSEL ;digital I/O
    CLRF ANSELH
    BANKSEL TRISA ;
    MOVLW b'11110000'
    MOVWF TRISA 
    CLRF TRISB
    CLRF TRISC
    CLRF TRISD
    CLRF TRISE
    BCF STATUS,RP1
    BCF STATUS,RP0
    BCF PORTC,1
    BCF PORTC,0
    
    MOVLW '*'
    MOVWF d1
    MOVLW '*'
    MOVWF d2
    MOVLW '*'
    MOVWF d3
    MOVLW '*'
    MOVWF d4
    MOVLW '*'
    MOVWF d5
    MOVLW '*'
    MOVWF d6
    MOVLW '*'
    MOVWF d7
    MOVLW '*'
    MOVWF d8
    
    MOVLW '7'
    MOVWF c1
    MOVLW '0'
    MOVWF c2
    MOVLW '8'
    MOVWF c3
    MOVLW '7'
    MOVWF c4
    MOVLW '4'
    MOVWF c5
    MOVLW '7'
    MOVWF c6
    MOVLW '3'
    MOVWF c7
    MOVLW '4'
    MOVWF c8
    
INITLCD
    BCF PORTC,0		;reset
    MOVLW 0x01
    MOVWF PORTD
    
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTD
    
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTD
    
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
    
    MOVLW 0x41
    MOVWF FSR
    

INICIO
    
    CALL PANTIN
   
    MOVLW b'0'
    BSF PORTA, 3
    BTFSC PORTA, 4
    MOVLW '1'
    BTFSC PORTA, 5
    MOVLW '2'
    BTFSC PORTA, 6
    MOVLW '3'
    BCF PORTA, 3
    MOVWF aux
    BTFSC aux, 4
    CALL guarda
    
    MOVLW b'0'
    BSF PORTA, 2
    BTFSC PORTA, 4
    MOVLW '4'
    BTFSC PORTA, 5
    MOVLW '5'
    BTFSC PORTA, 6
    MOVLW '6'
    BCF PORTA, 2
    MOVWF aux
    BTFSC aux, 4
    CALL guarda
    
    MOVLW b'0'
    BSF PORTA, 1
    BTFSC PORTA, 4
    MOVLW '7'
    BTFSC PORTA, 5
    MOVLW '8'
    BTFSC PORTA, 6
    MOVLW '9'
    BCF PORTA, 1
    MOVWF aux
    BTFSC aux, 4
    CALL guarda
    
    MOVLW b'0'
    BSF PORTA, 0
    BTFSC PORTA, 4
    CALL REG
    BTFSC PORTA, 5
    MOVLW '0'
    BTFSC PORTA, 6
    CALL VALIDA
    BCF PORTA, 0
    MOVWF aux
    BTFSC aux, 4
    CALL guarda
   
    GOTO INICIO

REG
    DECF FSR
    MOVLW '*'
    MOVWF INDF
    RETURN
    
guarda
    MOVFW aux
    MOVWF INDF
    INCF FSR
    RETURN
    
VALIDA
    MOVFW c1
    XORWF d1, 1
    BTFSC d1, 0
    CALL FAIL
    BTFSC d1, 1
    CALL FAIL
    BTFSC d1, 2
    CALL FAIL
    BTFSC d1, 3
    CALL FAIL
    BTFSC d1, 4
    CALL FAIL
    BTFSC d1, 5
    CALL FAIL
    BTFSC d1, 6
    CALL FAIL
    BTFSC d1, 7
    CALL FAIL
    
    MOVFW c2
    XORWF d2, 1
    BTFSC d2, 0
    CALL FAIL
    BTFSC d2, 1
    CALL FAIL
    BTFSC d2, 2
    CALL FAIL
    BTFSC d2, 3
    CALL FAIL
    BTFSC d2, 4
    CALL FAIL
    BTFSC d2, 5
    CALL FAIL
    BTFSC d2, 6
    CALL FAIL
    BTFSC d2, 7
    CALL FAIL

    MOVFW c3
    XORWF d3, 1
    BTFSC d3, 0
    CALL FAIL
    BTFSC d3, 1
    CALL FAIL
    BTFSC d3, 2
    CALL FAIL
    BTFSC d3, 3
    CALL FAIL
    BTFSC d3, 4
    CALL FAIL
    BTFSC d3, 5
    CALL FAIL
    BTFSC d3, 6
    CALL FAIL
    BTFSC d3, 7
    CALL FAIL
    
    MOVFW c4
    XORWF d4, 1
    BTFSC d4, 0
    CALL FAIL
    BTFSC d4, 1
    CALL FAIL
    BTFSC d4, 2
    CALL FAIL
    BTFSC d4, 3
    CALL FAIL
    BTFSC d4, 4
    CALL FAIL
    BTFSC d4, 5
    CALL FAIL
    BTFSC d4, 6
    CALL FAIL
    BTFSC d4, 7
    CALL FAIL
   
    MOVFW c5
    XORWF d5, 1
    BTFSC d5, 0
    CALL FAIL
    BTFSC d5, 1
    CALL FAIL
    BTFSC d5, 2
    CALL FAIL
    BTFSC d5, 3
    CALL FAIL
    BTFSC d5, 4
    CALL FAIL
    BTFSC d5, 5
    CALL FAIL
    BTFSC d5, 6
    CALL FAIL
    BTFSC d5, 7
    CALL FAIL
    
    MOVFW c6
    XORWF d6, 1
    BTFSC d6, 0
    CALL FAIL
    BTFSC d6, 1
    CALL FAIL
    BTFSC d6, 2
    CALL FAIL
    BTFSC d6, 3
    CALL FAIL
    BTFSC d6, 4
    CALL FAIL
    BTFSC d6, 5
    CALL FAIL
    BTFSC d6, 6
    CALL FAIL
    BTFSC d6, 7
    CALL FAIL
    
    MOVFW c7
    XORWF d7, 1
    BTFSC d7, 0
    CALL FAIL
    BTFSC d7, 1
    CALL FAIL
    BTFSC d7, 2
    CALL FAIL
    BTFSC d7, 3
    CALL FAIL
    BTFSC d7, 4
    CALL FAIL
    BTFSC d7, 5
    CALL FAIL
    BTFSC d7, 6
    CALL FAIL
    BTFSC d7, 7
    CALL FAIL
   
    MOVFW c8
    XORWF d8, 1
    BTFSC d8, 0
    CALL FAIL
    BTFSC d8, 1
    CALL FAIL
    BTFSC d8, 2
    CALL FAIL
    BTFSC d8, 3
    CALL FAIL
    BTFSC d8, 4
    CALL FAIL
    BTFSC d8, 5
    CALL FAIL
    BTFSC d8, 6
    CALL FAIL
    BTFSC d8, 7
    CALL FAIL
    CALL EXIT
    
FAIL
    BCF PORTC,0		;reset
    MOVLW 0x01
    MOVWF PORTD
    
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
lf
    CALL PANTFAIL
    GOTO lf
EXIT
    BCF PORTC,0		;reset
    MOVLW 0x01
    MOVWF PORTD
    
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
le
    CALL PANTSUC
    GOTO le
    
PANTIN
    
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    
    MOVLW '|'
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x84		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOVFW c1
    MOVWF PORTD
    CALL exec
    MOVFW c2
    MOVWF PORTD
    CALL exec
    MOVFW c3
    MOVWF PORTD
    CALL exec
    MOVFW c4
    MOVWF PORTD
    CALL exec
    MOVFW c5
    MOVWF PORTD
    CALL exec
    MOVFW c6
    MOVWF PORTD
    CALL exec
    MOVFW c7
    MOVWF PORTD
    CALL exec
    MOVFW c8
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x8F		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOVLW '|'
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xC0		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW '|'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xC2		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW 'I'
    MOVWF PORTD
    CALL exec
    MOVLW 'n'
    MOVWF PORTD
    CALL exec
    MOVLW 't'
    MOVWF PORTD
    CALL exec
    MOVLW 'r'
    MOVWF PORTD
    CALL exec
    MOVLW '.'
    MOVWF PORTD
    CALL exec
    MOVLW ' '
    MOVWF PORTD
    CALL exec
    MOVLW 'c'
    MOVWF PORTD
    CALL exec
    MOVLW 'l'
    MOVWF PORTD
    CALL exec
    MOVLW 'a'
    MOVWF PORTD
    CALL exec
    MOVLW 'v'
    MOVWF PORTD
    CALL exec
    MOVLW 'e'
    MOVWF PORTD
    CALL exec
    MOVLW ':'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xCF		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW '|'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x90		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW '|'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x94		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVFW d1
    MOVWF PORTD
    CALL exec
    MOVFW d2
    MOVWF PORTD
    CALL exec
    MOVFW d3
    MOVWF PORTD
    CALL exec
    MOVFW d4
    MOVWF PORTD
    CALL exec
    MOVFW d5
    MOVWF PORTD
    CALL exec
    MOVFW d6
    MOVWF PORTD
    CALL exec
    MOVFW d7
    MOVWF PORTD
    CALL exec
    MOVFW d8
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x9F		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW '|'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xD0		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW '|'
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xD6		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW '0'
    MOVWF PORTD
    CALL exec
    MOVLW '_'
    MOVWF PORTD
    CALL exec
    MOVLW 'o'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xDF		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW '|'
    MOVWF PORTD
    CALL exec
    
    MOVLW d'0'
    MOVWF PORTE
        
    RETURN
    
PANTSUC
    
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    
    MOVLW b'11110011'
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x84		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW 'L'
    MOVWF PORTD
    CALL exec
    MOVLW 'a'
    MOVWF PORTD
    CALL exec
    MOVLW ' '
    MOVWF PORTD
    CALL exec
    MOVLW 'c'
    MOVWF PORTD
    CALL exec
    MOVLW 'l'
    MOVWF PORTD
    CALL exec
    MOVLW 'a'
    MOVWF PORTD
    CALL exec
    MOVLW 'v'
    MOVWF PORTD
    CALL exec
    MOVLW 'e'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x8F		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110011'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xC0		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110011'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xC3		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW 'e'
    MOVWF PORTD
    CALL exec
    MOVLW 's'
    MOVWF PORTD
    CALL exec
    MOVLW ' '
    MOVWF PORTD
    CALL exec
    MOVLW 'c'
    MOVWF PORTD
    CALL exec
    MOVLW 'o'
    MOVWF PORTD
    CALL exec
    MOVLW 'r'
    MOVWF PORTD
    CALL exec
    MOVLW 'r'
    MOVWF PORTD
    CALL exec
    MOVLW 'e'
    MOVWF PORTD
    CALL exec
    MOVLW 'c'
    MOVWF PORTD
    CALL exec
    MOVLW 't'
    MOVWF PORTD
    CALL exec
    MOVLW 'a'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xCF		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110011'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x90		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110011'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x96		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW '0'
    MOVWF PORTD
    CALL exec
    MOVLW ' '
    MOVWF PORTD
    CALL exec
    MOVLW 'o'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x9F		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110011'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xD0		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110011'
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xD6		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW '-'
    MOVWF PORTD
    CALL exec
    MOVLW 'U'
    MOVWF PORTD
    CALL exec
    MOVLW '-'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xDF		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110011'
    MOVWF PORTD
    CALL exec
    
    MOVLW b'00000001'
    MOVWF PORTE
        
    RETURN
    
PANTFAIL
    
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    
    MOVLW b'11110100'
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x84		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW 'L'
    MOVWF PORTD
    CALL exec
    MOVLW 'a'
    MOVWF PORTD
    CALL exec
    MOVLW ' '
    MOVWF PORTD
    CALL exec
    MOVLW 'c'
    MOVWF PORTD
    CALL exec
    MOVLW 'l'
    MOVWF PORTD
    CALL exec
    MOVLW 'a'
    MOVWF PORTD
    CALL exec
    MOVLW 'v'
    MOVWF PORTD
    CALL exec
    MOVLW 'e'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x8F		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110100'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xC0		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110100'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xC4		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW 'e'
    MOVWF PORTD
    CALL exec
    MOVLW 's'
    MOVWF PORTD
    CALL exec
    MOVLW 't'
    MOVWF PORTD
    CALL exec
    MOVLW 'a'
    MOVWF PORTD
    CALL exec
    MOVLW ' '
    MOVWF PORTD
    CALL exec
    MOVLW 'm'
    MOVWF PORTD
    CALL exec
    MOVLW 'a'
    MOVWF PORTD
    CALL exec
    MOVLW 'l'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xCF		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110100'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x90		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110100'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x96		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW '0'
    MOVWF PORTD
    CALL exec
    MOVLW ' '
    MOVWF PORTD
    CALL exec
    MOVLW 'o'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x9F		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110100'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xD0		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110100'
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xD6		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW '-'
    MOVWF PORTD
    CALL exec
    MOVLW b'11110100'
    MOVWF PORTD
    CALL exec
    MOVLW '-'
    MOVWF PORTD
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xDF		;LCD position 
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    MOVLW b'11110100'
    MOVWF PORTD
    CALL exec
    
    MOVLW b'00000010'
    MOVWF PORTE
        
    RETURN
    
exec

    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
    RETURN
    
time
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo    
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN
    
time2
    MOVLW d'10'
    MOVWF i
loopj:
    MOVLW d'80'
    MOVWF j
loopk:
    MOVLW d'250'
    MOVWF k
loopi:
    NOP
    NOP
    DECFSZ k, 1
    GOTO loopi
    DECFSZ j, 1
    GOTO loopk
    DECFSZ i, 1
    GOTO loopj
    RETURN
			
			
    END