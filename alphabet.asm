abc        	START      	0

repeat 		CLEAR		A		.Clear the accumulator value
		STA 		offset		.Stores accumulator into the offset

loop		LDA		offset		.Start of the loop 
		ADD		asciiA		.Update accumulator for next alphabet

td1		TD		device		.Tests the device to update the equality flag
		JEQ		td1		.Wait until the device is ready
		WD		device		.Writes accumulator to device 

		LDA		offset				
		ADD		one		.Increase the offset by 1
		STA		offset				
		COMP		count		
		JLT		loop		.Jumps to the loop if offset < count(26)
		JEQ		loop1		.Jumps to loop1 after printing all the upper case alphabets
		COMP		count1		
		JLT		loop		.Temination occurs after printing all the alphabets in a line
		LDA		newline 	.Update accumulator to newline character

td2		TD 		device
		JEQ	 	td2
		WD		device		.Writes newline to device 
			
		J 		repeat		.Jump to beginning
loop1		TD 		device		.Tests the device 
		JEQ		loop1		.Wait until the device is ready
		ADD 		six		.To neglect characters between 'Z' & 'a'
		STA 		offset		.Stores accumulator into the offset
		WD 		device		.Writes accumulator to device 
		J 		loop		.Jumps to the loop

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
six 		WORD	6
		END		loop
