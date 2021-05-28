abc            START	        0

repeat 	CLEAR		A		.Clear the accumulator value
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

		LDA		newline		.Update accumulator to newline character

td2		TD 		device
		JEQ	 	td2
		WD		device		.Writes newline to device 
			
		J 		repeat		.Jump to beginning
. constants	
device	BYTE	X'01'
newline	WORD	10
asciiA	WORD	65
count	WORD	26

. variables
offset	WORD	0	
one     WORD	1
		END		loop
