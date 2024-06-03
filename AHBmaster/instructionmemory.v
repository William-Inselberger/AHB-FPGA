module instructionmemory(
input [9:0]pc,
output reg [22:0]instruction
);


reg [22:0] memoria [0:1023];
integer i;
initial begin
	//	for(i = 0; i <= 1023; i = i+1) memoria[i] = 23'b0_0_00_0000_0000_0000_0000;
	// WRITE_BURST(XXX)_SEL_ADDR(XX_XXXX_XXXX)_DATA(XXXX_XXXX)
	// write : 2 clk
	//read: 5 clk
		memoria[0]=23'b1_011_0_00_0000_0001_0000_0010; 
	 	memoria[1]=23'b0_000_0_00_0000_0001_0000_0000;  
		memoria[2]=23'b0_000_0_00_0000_0001_0000_0000; 	//escreve 2 no addr 2 do slave 0
		memoria[3]=23'b0_000_0_00_0000_0001_0000_0000;	
		memoria[4]=23'b0_000_0_00_0000_0001_0000_0000;	//escreve 3 no addr 3 do slave 0
		memoria[5]=23'b1_000_0_00_0000_0001_0000_0000;  
		memoria[6]=23'b0_000_0_00_0000_0100_0000_0000;	//escreve 4 no addr 4 do slave 0
		memoria[7]=23'b0_000_0_00_0000_0100_0000_0000;  
		memoria[8]=23'b1_000_0_00_0000_0101_0000_0101;	//escreve 5 no addr 5 do slave 0
		memoria[9]=23'b0_000_0_00_0000_0101_0000_0000;	
		memoria[10]=23'b1_000_0_00_0000_0110_0000_0110;	//escreve 6 no addr 6 do slave 0
		memoria[11]=23'b0_000_0_00_0000_0110_0000_0000;	
		memoria[12]=23'b1_000_0_00_0000_0111_0000_0111;	
		memoria[13]=23'b0_000_0_00_0000_0111_0000_0000; 
		memoria[14]=23'b1_000_0_00_0000_1000_0000_1000;	
		memoria[15]=23'b0_000_0_00_0000_1000_0000_0000; 	
		memoria[16]=23'b1_000_0_00_0000_1001_0000_1001;	
		memoria[17]=23'b0_000_0_00_0000_1000_0000_0000;
		memoria[18]=23'b1_000_0_00_0000_1010_0000_1010;	
		memoria[19]=23'b0_000_0_00_0000_1000_0000_0000;
		
		
		
	
end


always @(pc) begin

instruction = memoria[pc];

end







endmodule

