module ahbslavesfpga( 
	input hclk,
	input hresetn,
	input hsel_1,
	input hsel_2,
	input [9:0] addr,
	input hwrite,
	input [2:0] bursttype,
	input [1:0] htrans,
	input [7:0] hwdata,
	input s0,
	input s1,
	input s2,
	input s3,
	input s4,
	input s5,
	input s6,
	input s7,
	input s8,
	input s9,
	input confirm,
	output  hreadyout_1,
	output  hresp_1,
	output  [7:0] hrdata_1,
	output  hreadyout_2,
	output  hresp_2,
	output  [7:0] hrdata_2,
	output As1,
	output Bs1,
	output Cs1,
	output Ds1,
	output Es1,
	output Fs1,
	output Gs1,
	output As2,
	output Bs2,
	output Cs2,
	output Ds2,
	output Es2,
	output Fs2,
	output Gs2,
	output As3,
	output Bs3,
	output Cs3,
	output Ds3,
	output Es3,
	output Fs3,
	output Gs3,
	output As4,
	output Bs4,
	output Cs4,
	output Ds4,
	output Es4,
	output Fs4,
	output Gs4

);
wire [9:0]seldisplay;

assign seldisplay={s9,s8,s7,s6,s5,s4,s3,s2,s1,s0};
// slave 1/
ahbslave slave1(
  .hclk(hclk),
  .hresetn(hresetn),
  .hsel(hsel_1),
  .haddr(addr[9:0]),
  .hwrite(hwrite),
  .hsize(0),
  .hburst(bursttype),
  .hprot(0),
  .htrans(htrans),
  .hmastlock(0),
  .hready(1'b1),
  .hwdata(hwdata),
  .hreadyout(hreadyout_1),
  .hresp(hresp_1),
  .hrdata(hrdata_1),
  .memo(mem0),
  .displaysel(seldisplay)
  
);


ahbslave slave2(
  .hclk(hclk),
  .hresetn(hresetn),
  .hsel(hsel_2),
  .haddr(addr[9:0]),
  .hwrite(hwrite),
  .hsize(0),
  .hburst(bursttype),
  .hprot(0),
  .htrans(htrans),
  .hmastlock(0),
  .hready(1'b1),
  .hwdata(hwdata),
  .hreadyout(hreadyout_2),
  .hresp(hresp_2),
  .hrdata(hrdata_2),
  .memo(mem1),
  .displaysel(seldisplay)
);

wire [7:0]mem0,mem1,memos0,memos1;

ffd valor0(
.d(mem0),
.clk(confirm),
.q(memos0)

);

ffd valor1(
.d(mem1),
.clk(confirm),
.q(memos1)

);
assign memos00={memos0[3],memos0[2],memos0[1],memos0[0]};
assign memos01={memos0[7],memos0[6],memos0[5],memos0[4]};
assign memos10={memos1[3],memos1[2],memos1[1],memos1[0]};
assign memos11={memos1[7],memos1[6],memos1[5],memos1[4]};

displaydecoder display0(
.n(memos00),
.A(As1),
.B(Bs1),
.C(Cs1),
.D(Ds1),
.E(Es1),
.F(Fs1),
.G(Gs1)
);

displaydecoder display1(
.n(memos01),
.A(As2),
.B(Bs2),
.C(Cs2),
.D(Ds2),
.E(Es2),
.F(Fs2),
.G(Gs2)
);
displaydecoder display2(
.n(memos10),
.A(As3),
.B(Bs3),
.C(Cs3),
.D(Ds3),
.E(Es3),
.F(Fs3),
.G(Gs3)
);

displaydecoder display3(
.n(memos11),
.A(As4),
.B(Bs4),
.C(Cs4),
.D(Ds4),
.E(Es4),
.F(Fs4),
.G(Gs4)
);
displaydecoder display4(
.n(0),
.A(As5),
.B(Bs5),
.C(Cs5),
.D(Ds5),
.E(Es5),
.F(Fs5),
.G(Gs5)
);

displaydecoder display5(
.n(0),
.A(As6),
.B(Bs6),
.C(Cs6),
.D(Ds6),
.E(Es6),
.F(Fs6),
.G(Gs6)
);

endmodule
