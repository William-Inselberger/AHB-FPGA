module memorialeitura(
input hrestn,
input [9:0]displaysel,
input [7:0]valorleitura,
output [7:0] memoria
);

reg [7:0] mem [511:0];
integer i;
assign memo=mem[displaysel];

always @(valorleitura)begin

mem[i]<=valorleitura;
i<=i+1;


end
always @(negedge hrestn) if(!hrestn) i<=0;
endmodule
