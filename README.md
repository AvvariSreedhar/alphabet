# Alphabets
## Project statement
Printing English alphabets repeatedly using assembly language (SIC instructions) and simulating it using [SICtools](https://jurem.github.io/SicTools/).

## SIC Code
```
abc        	START      	0

repeat 		CLEAR		A
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
		JEQ		loop1
		COMP		count1		
		JLT		loop
		LDA		newline

td2		TD 		device
		JEQ	 	td2
		WD		device
			
		J 		repeat
loop1		TD 		device
		JEQ		loop1
		ADD 		six
		STA 		offset
		WD 		device
		J 		loop

. constants	
device		BYTE	X'01'
newline 	WORD	10
asciiA		WORD	65
asciia		WORD	97
count		WORD	26
count1		WORD	58

. variables
offset		WORD	0	
one        	WORD	1
six	 	WORD	6
		END		loop
```
