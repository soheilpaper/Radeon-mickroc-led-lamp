/*********************************************
Project : 
Version : 
Date    : 2008-11-08
Author  : Caijianqiang                    
Company :                                 
Comments: 


Chip type           : ATmega8
Program type        : Application
Clock frequency     : 8.000000 MHz
Memory model        : Small
External SRAM size  : 0
Data Stack size     : 256
*********************************************/

#include <mega8.h>
#include <delay.h>
#include <math.h>

#define ADC_VREF_TYPE 0x00

/*----------------------------*/
/*    define PORT variable    */
/*----------------------------*/
#define SDATA PORTD.5
#define SCLK  PORTD.6
#define LOAD  PORTD.7

/*------------------------*/
/*    define code data    */
/*------------------------*/
flash  char led[20]={0xc0,0xf9,0xa4,0xb0,0x99,	/* 0 1 2 3 4 */
                     0x92,0x82,0xf8,0x80,0x90,	/* 5 6 7 8 9 */
                     0x88,0x83,0xc6,0xa1,0x86,	/* A B C D E */
                     0x8e,0x89,0x8c,0xbf,0xff};	/* F H P -   */

/*----------------------------*/
/*    define data variable    */
/*----------------------------*/

// Declare your global variables here
unsigned char ds[4];
unsigned int  adc0,adc1,adc2;
unsigned char Ms1000;

/*-----------------*/
/*    Functions    */
/*-----------------*/

// Timer 1 overflow interrupt service routine
interrupt [TIM1_OVF] void timer1_ovf_isr(void)
{
 // Reinitialize Timer 1 value
 TCNT1H=0x85;
 TCNT1L=0xEE;
 // Place your code here
 Ms1000=1;
}

/*--------------------------------------*/
void put_led(void)
{
 unsigned char i,j,ch;
 
 for(i=4;i>0;i--)
 {
  ch=led[ds[i-1]];
  for(j=0;j<8;j++)
  {
   if(ch&0x80) SDATA=1; else SDATA=0;
   SCLK=0;
   ch=ch<<1;
   SCLK=1;
  } 
 }
}

/*--------------------------------------*/
void DispTemp(unsigned int val)
{
 float temp;
 unsigned int k;
 
 temp=val;
 temp=(temp-96)/7.6273;
 if(temp<0)
 {
  k=0-(temp*10-0.5);
  ds[0]=18;				// -符号
  ds[1]=k/100;
  k=k%100;
  ds[2]=k/10;
  ds[3]=k%10;
 }
 else
 {
  k=temp*10+0.5;
  ds[0]=k/1000;
  k=k%1000;
  ds[1]=k/100;
  k=k%100;
  ds[2]=k/10;
  ds[3]=k%10; 
 }
  
 put_led();
 LOAD=1;
 LOAD=0;
}

/*--------------------------------------*/
// Read the AD conversion result
unsigned int read_adc(unsigned char adc_input)
{
 ADMUX=adc_input|ADC_VREF_TYPE;
 // Start the AD conversion
 ADCSRA|=0x40;
 // Wait for the AD conversion to complete
 while ((ADCSRA & 0x10)==0);
 ADCSRA|=0x10;
 return ADCW;
}

/*--------------------------------------*/
void main(void)
{
 // Declare your local variables here

 // Input/Output Ports initialization
 // Port B initialization
 // Func0=In Func1=In Func2=In Func3=In Func4=In Func5=In Func6=In Func7=In 
 // State0=T State1=T State2=T State3=T State4=T State5=T State6=T State7=T 
 PORTB=0x00;
 DDRB=0x00;

 // Port C initialization
 // Func0=In Func1=In Func2=In Func3=In Func4=In Func5=In Func6=In 
 // State0=T State1=T State2=T State3=T State4=T State5=T State6=T 
 PORTC=0x00;
 DDRC=0x00; 

 // Port D initialization
 // Func0=In Func1=In Func2=In Func3=In Func4=In Func5=In Func6=In Func7=In 
 // State0=T State1=T State2=T State3=T State4=T State5=T State6=T State7=T 
 PORTD=0x7f;
 DDRD=0xff; 

 // Timer/Counter 0 initialization
 // Clock source: System Clock
 // Clock value: Timer 0 Stopped
 TCCR0=0x00;
 TCNT0=0x00;

 // Timer/Counter 1 initialization
 // Clock source: System Clock
 // Clock value: 31.250 kHz
 // Mode: Normal top=FFFFh
 // OC1A output: Discon.
 // OC1B output: Discon.
 // Noise Canceler: Off
 // Input Capture on Falling Edge
 // Timer 1 Overflow Interrupt: On
 // Input Capture Interrupt: Off
 // Compare A Match Interrupt: Off
 // Compare B Match Interrupt: Off
 TCCR1A=0x00;
 TCCR1B=0x04;
 TCNT1H=0x85;
 TCNT1L=0xEE;
 ICR1H=0x00;
 ICR1L=0x00;
 OCR1AH=0x00;
 OCR1AL=0x00;
 OCR1BH=0x00;
 OCR1BL=0x00;

 // Timer/Counter 2 initialization
 // Clock source: System Clock
 // Clock value: Timer 2 Stopped
 // Mode: Normal top=FFh
 // OC2 output: Disconnected
 ASSR=0x00;
 TCCR2=0x00;
 TCNT2=0x00;
 OCR2=0x00; 

 // External Interrupt(s) initialization
 // INT0: Off
 // INT1: Off
 MCUCR=0x00; 

 // Timer(s)/Counter(s) Interrupt(s) initialization
 TIMSK=0x04;

 // Analog Comparator initialization
 // Analog Comparator: Off
 // Analog Comparator Input Capture by Timer/Counter 1: Off
 // Analog Comparator Output: Off
 ACSR=0x80;
 SFIOR=0x00;

 // ADC initialization
 // ADC Clock frequency: 125.000 kHz
 // ADC Voltage Reference: AREF pin
 // ADC High Speed Mode: Off
 // ADC Auto Trigger Source: None
 ADMUX=ADC_VREF_TYPE;
 ADCSRA=0x86;
 SFIOR&=0xEF; 

 // Global enable interrupts
 #asm("sei")

 while (1)
 {
  // Place your code here
 
  if(Ms1000)
  {
   Ms1000=0;
   adc1=read_adc(1);		// 采集通道1数据
   DispTemp(adc1);			// 显示温度
  }
 };
}
