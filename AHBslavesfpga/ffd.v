module ffd(
input [7:0]d,
input [9:0]a,
input clk,
output reg [7:0]qd,
output reg [9:0]qa
);

always @(posedge clk) begin
qd<=d;
qa<=a;
end

endmodule 