#include <xc.h>
#include "lcd.h"
#include "config.h"

#define _XTAL_FREQ 4000000

void main (void){
	PORTD = 0x00;
    PORTE = 0x00;
    TRISD = 0b00000000;		// Configura direção dos pinos da PORTA D
    TRISE = 0b11111100;

	Inicializa_LCD();
	Comando_LCD (01);       // limpa a tela do display
	Posiciona_LCD(1,6);     // Posiciona cursor na linha 1 e coluna 1
	Escreve_LCD("Antonio");
	Posiciona_LCD(2,7);      // Posiciona cursor na linha 2 e coluna 3
	Escreve_LCD("Nunes");
	__delay_ms (1000);
	Comando_LCD (01);       // limpa a tela do display
	__delay_ms(0);
     // FIM DE PROGRAMA
}