# Alphabets
## Project statement
Printing English alphabets repeatedly using assembly language (SIC instructions) and simulating it using [SICtools](https://jurem.github.io/SicTools/).

## SIC Code
```
abc           	START      	0
repeat 	        CLEAR		A		
		STA 		offset	
loop		LDA		offset	 
		ADD		asciiA	
td1		TD		device	
		JEQ		td1		
		WD		device	 
		LDA		offset				
		ADD		one		
		STA		offset				
		COMP		count		
		JLT		loop		
		LDA		newline	
td2		TD 		device
		JEQ	 	td2
		WD		device	 
		J 		repeat	
. constants	
device		BYTE	X'01'
newline 	WORD	10
asciiA		WORD	65
count		WORD	26
. variables
offset		WORD	0	
one        	WORD	1
		END		loop
```
