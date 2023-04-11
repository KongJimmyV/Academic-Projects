#include <stdio.h>
#include <altera_avalon_pio_regs.h>
#include <system.h>

#include <math.h>

// ********** TABLE OF MIDI NOTES *********:
/*
Note	MIDI	Hz	    	Note	MIDI	Hz	    	Note	MIDI	Hz	    	Note	MIDI	Hz
C -		0		8.176	   	G# 1	32		51.913	   	E 4		64		329.63	   	C 7		96		2093.0
C# -	1		8.662	   	A 1		33		55.000	   	F 4		65		349.23	   	C# 7	97		2217.5
D -		2		9.177	   	A# 1	34		58.270	   	F# 4	66		369.99	   	D 7		98		2349.3
D# -	3		9.723	   	B 1		35		61.735	   	G 4		67		391.99	   	D# 7	99		2489.0
E -		4		10.301 	   	C 2		36		65.406	   	G# 4	68		415.31	   	E 7		100		2637.0
F -		5		10.913	   	C# 2	37		69.295	   	A 4		69		440.00	   	F 7		101		2793.8
F# -	6		11.562	   	D 2		38		73.416	   	A# 4	70		466.16	   	F# 7	102		2960.0
G -		7		12.250	   	D# 2	39		77.781	   	B 4		71		493.88	   	G 7		103		3136.0
G# -	8		12.978	   	E 2		40		82.406	   	C 5		72		523.25	   	G# 7	104		3322.4
A -		9		13.750	   	F 2		41		87.307	   	C# 5	73		554.37	   	A 7		105		3520.0
A# -	10		14.568	   	F# 2	42		92.499	   	D 5		74		587.33	   	A# 7	106		3729.3
B -		11		15.434	   	G 2		43		97.998	   	D# 5	75		622.25	   	B 7		107		3951.1
C 0		12		16.352	   	G# 2	44		103.82	   	E 5		76		659.26	   	C 8		108		4186.0
C# 0	13		17.324	   	A 2		45		110.00	   	F 5		77		698.46	   	C# 8	109		4434.9
D 0		14		18.354	   	A# 2	46		116.54	   	F# 5	78		739.99	   	D 8		110		4698.6
D# 0	15		19.445	   	B 2		47		123.47	   	G 5		79		783.99	   	D# 8	111		4978.0
E 0		16		20.601	   	C 3		48		130.81	   	G# 5	80		830.61	   	E 8		112		5274.0
F 0		17		21.826	   	C# 3	49		138.59	   	A 5		81		880.00	   	F 8		113		5587.7
F# 0	18		23.124	   	D 3		50		146.83	   	A# 5	82		932.32	   	F# 8	114		5919.9
G 0		19		24.499	   	D# 3	51		155.56	   	B 5		83		987.77	   	G 8		115		6271.9
G# 0	20		25.956	   	E 3		52		164.81	   	C 6		84		1046.5	   	G# 8	116		6644.9
A 0		21		27.50	   	F 3		53		174.61	   	C# 6	85		1108.7	   	A 8		117		7040.0
A# 0	22		29.135	   	F# 3	54		184.99	   	D 6		86		1174.7	   	A# 8	118		7458.6
B 0		23		30.867	   	G 3		55		195.99	   	D# 6	87		1244.5	   	B 8		119		7902.1
C 1		24		32.703	   	G# 3	56		207.65	   	E 6		88		1318.5	   	C 9		120		8372.0
C# 1	25		34.648	   	A 3		57		220.00	   	F 6		89		1396.9	   	C# 9	121		8869.8
D 1		26		36.708	   	A# 3	58		233.08	   	F# 6	90		1480.0	   	D 9		122		9397.3
D# 1	27		38.890	   	B 3		59		246.94	   	G 6		91		1568.0	   	D# 9	123		9956.1
E 1		28		41.203	   	C 4		60		261.63	   	G# 6	92		1661.2	   	E 9		124		10548.1
F 1		29		43.653	   	C# 4	61		277.18	   	A 6		93		1760.0	   	F 9		125		11175.3
F# 1	30		46.249	   	D 4		62		293.66	   	A# 6	94		1864.7	   	F# 9	126		11839.8
G 1		31		48.999	   	D# 4	63		311.13	   	B 6		95		1975.5	   	G 9		127		12543.9

OTHER NOTES: (60,000 ms (1 minute) / Tempo (BPM) = Delay Time in ms for quarter-note beats)
*/

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// GLOBAL INITIALIZATION

// Global Constants
#define AMOUNT_OF_NOTES 128 // DEFINE ALL THE NOTES ON A MIDI PIANO
#define AMOUNT_OF_PWM 2		// DEFINE ALL PWMs

// Global Loop Variables
int n = 0;

// Global Music Variables
double tempo = 120.0;	//tempo BPM

// MIDI note numbers
int noteFreq[AMOUNT_OF_NOTES];
char noteLetter[AMOUNT_OF_NOTES][4] =
	{
	"C-","C#-","D-","D#-","E-","F-","F#-","G-","G#-","A-","A#-","B-"
	"C0","C#0","D0","D#0","E0","F0","F#0","G0","G#0","A0","A#0","B0"
	"C1","C#1","D1","D#1","E1","F1","F#1","G1","G#1","A1","A#1","B1"
	"C2","C#2","D2","D#2","E2","F2","F#2","G2","G#2","A2","A#2","B2"
	"C3","C#3","D3","D#3","E3","F3","F#3","G3","G#3","A3","A#3","B3"
	"C4","C#4","D4","D#4","E4","F4","F#4","G4","G#4","A4","A#4","B4"
	"C5","C#5","D5","D#5","E5","F5","F#5","G5","G#5","A5","A#5","B5"
	"C6","C#6","D6","D#6","E6","F6","F#6","G6","G#6","A6","A#6","B6"
	"C7","C#7","D7","D#7","E7","F7","F#7","G7","G#7","A7","A#7","B7"
	"C8","C#8","D8","D#8","E8","F8","F#8","G8","G#8","A8","A#8","B8"
	"C9","C#9","D9","D#9","E9","F9","F#9","G9","G#9","A9","A#9","B9"
	};

// DEFINE FUNCTIONS
void play_music();
void play_note(int midiNumber, double noteLength, double restLength);
void play_note(char *midiLetter, double noteLength, double restLength);
void init_pwm0();
void set_pwm0_freq(int hz);
void set_pwm0_on();
void set_pwm0_off();
void init_pwm1();
void set_pwm1_freq(int hz);
void set_pwm1_on();
void set_pwm1_off();
void delay_ms(int time);
void init_note_frequencies();

int main()
{
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Initialization
	init_note_frequencies();
	for(n = 0; n < AMOUNT_OF_NOTES; n++) {
		printf("%d\n", (int)(((int)noteLetter[n]/4)-16097));
	}

	// Initialize PWM
	init_pwm0(); // init PWM
	init_pwm1(); // init PWM

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Super Mario Bros. Overworld Theme
	
	/* Notes Used:
	 * 64	E4
	 * 65	F4
	 * 67	G4
	 * 69	A4
	 * 70	A4# or B4f
	 * 71	B4
	 * 72	C5
	 * 74	D5
	 * 76	E5
	 * 77	F5
	 * 79	G5
	 */
	tempo = 300.0;	//tempo BPM
	/*
	double marioBrosNoteMIDI[] =
	{	76,		76,		0,		76,
		0,		72,		76,		0,
		79,		0,		0,
		67,		0,		0,

		72,		0,		0,		67,
		0,		64,		0,
		0,		69,		0,		71,
		0,		70,		69,		0,

		67,		76,		79,
		0,		64,		0,		0,
		0,		69,		0,		71,
		0,		70,		69,		0,
	};
	*/
	char marioBrosNoteLetter[][4] =
	{	"A4","A4","","A4",			"","C5","E5","",			"G5","","",					"G4","","",
		"C5","","","G4",			"","E4","",					"","A4","","B4",			"","A4#","A4","",
		"G4","E5","G5",				"","E4","","",				"","A4","","B4",			"","A4#","A4","",
	};

	double marioBrosNoteLength[] =
	{	1/8.0,1/8.0,0,1/8.0,		0,1/8.0,1/8.0,0,			1/8.0,0,0,					1/8.0,0,0,
		1/8.0,0,0,1/8.0,			0,1/8.0,0,					0,1/8.0,0,1/8.0,			0,1/8.0,1/8.0,0,
		0,0,0						0,0,0,0						0,0,0,0						0,0,0,0
	};
	double marioBrosRestLength[] =
	{	1/8.0,1/8.0,1/4.0,1/8.0,	1/4.0,1/8.0,1/8.0,1/4.0,	1/8.0,1/4.0,1/2.0,			1/8.0,1/4.0,1/2.0,
		1/8.0,1/4.0,1/4.0,1/8.0,	1/2.0,1/8.0,1/4.0,			1/4.0,1/8.0,1/4.0,1/8.0,	1/4.0,1/8.0,1/8.0,1/4.0,
		0,0,0						0,0,0,0						0,0,0,0						0,0,0,0
	};

	play_music();	//play the music sheet

	//for(;;)
	//{
		//set_pwm0_freq(6000); // set PWM0 output to 6khz
		//delay_ms(100); // wait 100 milliseconds
		//set_pwm0_freq(2000); // set PWM0 output to 2khz
		//delay_ms(200); // wait 200 milliseconds
		//set_pwm0_off(); // set PWM0 off
		//delay_ms(50); // wait 50 milliseconds
	//}

	return(0);
}

///////////////
// Functions
void play_music()
{
	for(n = 0; n < 4*8; n++)
	{
		/*play_note(
				marioBrosNoteMIDI[n],
				marioBrosNoteLength[n],
				marioBrosRestLength[n]
				);*/
		play_note(
				marioBrosNoteLetter[n],
				marioBrosNoteLength[n],
				marioBrosRestLength[n]
				);
	}
}

void play_note(int midiNumber, double noteLength, double restLength)
{
	// set frequency of note
	int hz = noteFreq[midiNumber];
	int clk_div = (50000000 / hz);
	int duty_cycle = (clk_div) / 2;

	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE + 4,0); // 0 duty_cycle = off
	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE, clk_div); // set clk_div
	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE + 4, duty_cycle); // 50% duty cycle

	// Play note.
	if (hz != noteFreq[0])
	{
	set_pwm0_on(); // set PWM0 on
	delay_ms((60000.0/tempo)*noteLength/((double)1/4));
	}

	// Play rest.
	set_pwm0_off(); // set PWM0 off
	delay_ms((60000.0/tempo)*restLength/((double)1/4));

}

void play_note(char *midiLetter, double noteLength, double restLength)
{
	// set frequency of note
	int hz = noteFreq[(int)(((int)midiLetter[n]/4)-16097)];
	int clk_div = (50000000 / hz);
	int duty_cycle = (clk_div) / 2;

	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE + 4,0); // 0 duty_cycle = off
	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE, clk_div); // set clk_div
	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE + 4, duty_cycle); // 50% duty cycle

	// Play note.
	if (hz != noteFreq[0])
	{
	set_pwm0_on(); // set PWM0 on
	delay_ms((60000.0/tempo)*noteLength/((double)1/4));
	}

	// Play rest.
	set_pwm0_off(); // set PWM0 off
	delay_ms((60000.0/tempo)*restLength/((double)1/4));

}

////////////////////
// PWM0 functions
void init_pwm0()
{
	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE + 4,0); // 0 duty_cycle = off
	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE + 8,1); // enable
}

void set_pwm0_freq(int hz)
{
	int clk_div = (50000000 / hz);
	int duty_cycle = (clk_div) / 2;
	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE + 4,0); // 0 duty_cycle = off
	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE, clk_div); // set clk_div
	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE + 4, duty_cycle); // 50% duty cycle
}

void set_pwm0_on()
{
	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE + 8,1); // enable
}

void set_pwm0_off()
{
	IOWR_ALTERA_AVALON_PIO_DATA(PWM0_BASE + 4,0); // 0 duty_cycle = off
}

////////////////////
// PWM1 functions
void init_pwm1()
{
	IOWR_ALTERA_AVALON_PIO_DATA(PWM1_BASE + 4,0); // 0 duty_cycle = off
	IOWR_ALTERA_AVALON_PIO_DATA(PWM1_BASE + 8,1); // enable
}

void set_pwm1_freq(int hz)
{
	int clk_div = (50000000 / hz);
	int duty_cycle = (clk_div ) / 2;
	IOWR_ALTERA_AVALON_PIO_DATA(PWM1_BASE + 4,0); // 0 duty_cycle = off
	IOWR_ALTERA_AVALON_PIO_DATA(PWM1_BASE, clk_div); // set clk_div
	IOWR_ALTERA_AVALON_PIO_DATA(PWM1_BASE + 4, duty_cycle); // 50% duty cycle
}

void set_pwm1_on()
{
	IOWR_ALTERA_AVALON_PIO_DATA(PWM1_BASE + 8,1); // enable
}

void set_pwm1_off()
{
	IOWR_ALTERA_AVALON_PIO_DATA(PWM1_BASE + 4,0); // 0 duty_cycle = off
}

/////////////////////
// Other functions
void delay_ms(int time)
{
	int i;
	int delay = time * 447;
	int dummy;
	for(i = 0; i < delay; i++)
		dummy++;
}

void init_note_frequencies()
{
	// MIDI note frequencies
	for(n = 0; n < AMOUNT_OF_NOTES; n++)
	{
		// frequency = 440 × 2^((note number − 69) / 12)
		noteFreq[n] = round(440.0 * pow(2.0, ((double)(n) - 69.0) / 12.0 ));
		//noteFreq[n] = n*2;
	}
}
