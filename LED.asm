 include <P16F877a.inc>
 processor 16f877
 
cte1 EQU 0x07 ;
cte2 EQU 0xFD ; Valores constantes
cte3 EQU 0xEA ;

valor1 EQU 0x21 ;
valor2 EQU 0x22 ; Localidades de memoria
valor3 EQU 0x23 ;

ESPA EQU 0x01
ESPB EQU 0x00

 ORG 0x00
 GOTO Inicio
 ORG 0x05

Inicio:
  ;---------Configuración de puertos---------
 BCF STATUS, RP1 ;0
 BSF STATUS, RP0 ;1 (Banco 1)

 
 MOVLW ESPB ;Configuramos las salidas para
 MOVWF 0X06 ;[TRISB] el puerto B
 
 BCF STATUS, RP1 ;0
 BCF STATUS, RP0 ;0 (Banco 0)

 MOVLW 0x80 ;Damos por hecho que empieza en cero
 MOVWF PORTB ;por lo tanto rota a la derecha
Rotacion:
 RLF PORTB, F ;Rota a la Izq PORTB
 GOTO Retardo ;vamos a la rutina Retardo
 
Retardo:
 MOVLW cte1 ;1 
 MOVWF valor1 ;1
Tres:
 MOVLW cte2 ;1
 MOVWF valor2 ;1
Dos:
 MOVLW cte3 ;1
 MOVWF valor3 ;1
Uno:
 DECFSZ valor3, 1 ;1*(cte3-1)+2
 GOTO Uno ;2*(cte3-1)
 
 DECFSZ valor2, 1 ;1*(cte2-1)+2
 GOTO Dos ;2*(cte2-1)
 
 DECFSZ valor1, 1 ;1*(cte1-1)+2
 GOTO Tres ;2*(cte1-1)
 GOTO Rotacion ;Volvemos a comprobar E/S en PORTA
 
Fin:
 GOTO Fin
 end
 
