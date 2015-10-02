module newbcdHex (

		input 		 clk,
		input 		 reset,
		input  [7:0] writedata,
		input 		 write,
		output [6:0] seven_seg
);


	reg [3:0] fsm;
	reg [6:0] display;
	
	//assign display = seven_seg;

	always @(*) 
		begin
		
			if (write) 
				begin
					fsm <= writedata;
				end
				
			case(fsm)
				4'b0000: display = 'b1000000; //'0'
				4'b0001: display = 'b1111001; //'1'
				4'b0010: display = 'b0100100; //'2'
				4'b0011: display = 'b0110000; //'3'
				4'b0100: display = 'b0011001; //'4'
				4'b0101: display = 'b0010010; //'5'
				4'b0110: display = 'b0000010; //'6'
				4'b0111: display = 'b1111000; //'7'
				4'b1000: display = 'b0000000; //'8'
				4'b1001: display = 'b0011000; //'9'
			endcase
		end
		
		assign seven_seg = display;
		
endmodule
