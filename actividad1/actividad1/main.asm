;
; actividad1.asm
;
; Created: 14/02/2024 02:01:24 a. m.
; Author : JavierSantana
;


; Replace with your application code
		
			; Programa en ensamblador para el avr atmega 328p
; Mediante 4 entradas posibles encender y apagar un led a diferentes frecuencias



.def tmp = r16 ; Definir un registro temporal
.def cnt = r17 ; Definir un registro contador
.def inp = r18 ; Definir un registro para la entrada
.def outl = r19 ; Definir un registro para la salida

.equ led = 0 ; Definir el pin del led
.equ btn = 0 ; Definir el pin del botón

ldi tmp, 0xff ; Cargar el valor 0xff en el registro temporal
out ddrb, tmp ; Configurar el puerto B como salida
out portb, tmp ; Encender el led

ldi tmp, 0x00 ; Cargar el valor 0x00 en el registro temporal
out ddrc, tmp ; Configurar el puerto C como entrada
out portc, tmp ; Habilitar el pull-up 

loop: ; Etiqueta del bucle principal
in inp, pinc ; Leer el valor del puerto C en el registro de entrada
andi inp, 0x03 ; Aplicar una máscara para quedarse solo con los bits 0 y 1
cpi inp, 0x00 ; Comparar el registro de entrada con el valor 0x00
breq freq1 ; Si son iguales, saltar a la etiqueta freq1
cpi inp, 0x01 ; Comparar el registro de entrada con el valor 0x01
breq freq2 ; Si son iguales, saltar a la etiqueta freq2
cpi inp, 0x02 ; Comparar el registro de entrada con el valor 0x02
breq freq3 ; Si son iguales, saltar a la etiqueta freq3
cpi inp, 0x03 ; Comparar el registro de entrada con el valor 0x03
breq freq4 ; Si son iguales, saltar a la etiqueta freq4
rjmp loop ; Si no, volver al bucle principal

freq1: ; Etiqueta para la frecuencia de 1 Hz
ldi cnt, 10 ; Cargar el valor 10 en el registro contador
delay1: ; Etiqueta para el retardo
ldi tmp, 0xff ; Cargar el valor 0xff en el registro temporal
out portb, tmp ; Encender el led
call wait_50ms ; Llamar a la subrutina wait_50ms
ldi tmp, 0x00 ; Cargar el valor 0x00 en el registro temporal
out portb, tmp ; Apagar el led
call wait_50ms ; Llamar a la subrutina wait_50ms
dec cnt ; Decrementar el registro contador
brne delay1 ; Si no es cero, volver a la etiqueta delay1
rjmp loop ; Volver al bucle principal

freq2: ; Etiqueta para la frecuencia de 2 Hz
ldi cnt, 10 ; Cargar el valor 10 en el registro contador
delay2: ; Etiqueta para el retardo
ldi tmp, 0xff ; Cargar el valor 0xff en el registro temporal
out portb, tmp ; Encender el led
call wait_25ms ; Llamar a la subrutina wait_25ms
ldi tmp, 0x00 ; Cargar el valor 0x00 en el registro temporal
out portb, tmp ; Apagar el led
call wait_25ms ; Llamar a la subrutina wait_25ms
dec cnt ; Decrementar el registro contador
brne delay2 ; Si no es cero, volver a la etiqueta delay2
rjmp loop ; Volver al bucle principal

freq3: ; Etiqueta para la frecuencia de 4 Hz
ldi cnt, 10 ; Cargar el valor 10 en el registro contador
delay3: ; Etiqueta para el retardo
ldi tmp, 0xff ; Cargar el valor 0xff en el registro temporal
out portb, tmp ; Encender el led
call wait_12ms ; Llamar a la subrutina wait_12ms
ldi tmp, 0x00 ; Cargar el valor 0x00 en el registro temporal
out portb, tmp ; Apagar el led
call wait_12ms ; Llamar a la subrutina wait_12ms
dec cnt ; Decrementar el registro contador
brne delay3 ; Si no es cero, volver a la etiqueta delay3
rjmp loop ; Volver al bucle principal

freq4: ; Etiqueta para la frecuencia de 8 Hz
ldi cnt, 10 ; Cargar el valor 10 en el registro contador
delay4: ; Etiqueta para el retardo
ldi tmp, 0xff ; Cargar el valor 0xff en el registro temporal
out portb, tmp ; Encender el led
call wait_50ms ; Llamar a la subrutina wait_50ms
ldi tmp, 0x00 ; Cargar el valor 0x00 en el registro temporal
out portb, tmp ; Apagar el led
call wait_50ms ; Llamar a la subrutina wait_50ms
dec cnt ; Decrementar el registro contador
brne delay4 ; Si no es cero, volver a la etiqueta delay4
rjmp loop ; Volver al bucle principal

wait_50ms: ; Subrutina para esperar 50 milisegundos
; Se asume que el reloj del microcontrolador es de 16 MHz
ldi tmp, 6 ; Cargar el valor 6 en el registro temporal
loop1: ; Etiqueta del primer bucle
ldi cnt, 250 ; Cargar el valor 250 en el registro contador
loop2: ; Etiqueta del segundo bucle
nop ; No hacer nada
dec cnt ; Decrementar el registro contador
brne loop2 ; Si no es cero, volver al segundo bucle
dec tmp ; Decrementar el registro temporal
brne loop1 ; Si no es cero, volver al primer bucle
ret ; Retornar al punto de llamada

wait_25ms: ; Subrutina para esperar 25 milisegundos
; Se asume que el reloj del microcontrolador es de 16 MHz
ldi tmp, 3 ; Cargar el valor 3 en el registro temporal
loop3: ; Etiqueta del primer bucle
ldi cnt, 250 ; Cargar el valor 250 en el registro contador
loop4: ; Etiqueta del segundo bucle
nop ; No hacer nada
dec cnt ; Decrementar el registro contador
brne loop4 ; Si no es cero, volver al segundo bucle
dec tmp ; Decrementar el registro temporal
brne loop3 ; Si no es cero, volver al primer bucle
ret ; Retornar al punto de llamada

wait_12ms: ; Subrutina para esperar 12 milisegundos
; Se asume que el reloj del microcontrolador es de 16 MHz
ldi tmp, 1 ; Cargar el valor 1 en el registro temporal
loop5: ; Etiqueta del primer bucle
ldi cnt, 250 ; Cargar el valor 250 en el registro contador
loop6: ; Etiqueta del segundo bucle
nop ; No hacer nada
dec cnt ; Decrementar el registro contador
brne loop6 ; Si no es cero, volver al segundo bucle
dec tmp ; Decrementar el registro temporal
brne loop5 ; Si no es cero, volver al primer bucle
ret ; Retornar al punto de	llamada

;COMENTARIO DE PRUEBA DE ACTUALIZACIONES
;++++++++++++++						
								


