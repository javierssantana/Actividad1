;
; actividad1.asm
;
; Created: 14/02/2024 02:01:24 a. m.
; Author : JavierSantana
;


; Replace with your application code
		
			; Programa en ensamblador para el avr atmega 328p
; Mediante 4 entradas posibles encender y apagar un led a diferentes frecuencias


		.org 0
start:
	ldi r16,0x00
	out ddrd,r16 ;puerto D como entrada
	out portd,r16 ;activa el pull-up del puerto D

	ldi r17,0x20
	out ddrb,r17 ;puerto PB5-led como salida

loop:
	in	r16,pind
	cpi	r16,0x00
	breq case1
	cpi r16,0x01
	breq case2
	cpi r16,0x02
	breq case3
	cpi r16,0x03
	breq case4
	
defaut:
	cbi portb,5
	rjmp done
	
case1:
	sbi portb,5

	ldi  r18, 82
    ldi  r19, 43
    ldi  r20, 255
L1: dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1
	ret

case2:
	sbi portb,5

	ldi  r18, 33
    ldi  r19, 120
    ldi  r20, 151
L2: dec  r20
    brne L2
    dec  r19
    brne L2
    dec  r18
    brne L2
	ret

case3:
	sbi portb,5

	ldi  r18, 2
    ldi  r19, 160
    ldi  r20, 145
L3: dec  r20
    brne L3
    dec  r19
    brne L3
    dec  r18
    brne L3
	ret

case4:
	sbi portb,5

	
    ldi  r18, 3				
    ldi  r19, 16
L4: dec  r19
    brne L4
    dec  r18
    brne L4
    rjmp PC+1
	ret
	

done:		 
	rjmp loop		
		
		
;COMENTARIO DE PRUEBA DE ACTUALIZACIONES
;++++++++++++++						
								


