module ahbmasterfpga(
inout hclk,
input hresetn,
input [7:0] hrdata_1,
input hreadyout_1,
input hresp_1,
input [7:0] hrdata_2,
input hreadyout_2,
input hresp_2,
output [7:0]hwdata,
output hsel_1,
output hsel_2,
output [9:0] addr,
output hwrite,
output [2:0] bursttype,
output [1:0]htrans,
output Am,
output Bm,
output Cm,
output Dm,
output Em,
output Fm,
output Gm
);


	







// multiplexor
wire [7:0] hrdata;
wire hreadyout;
wire hresp;

//--------------------------------------------------
// Connect wires
//--------------------------------------------------

// master
wire sel;
wire hwr;

assign addr=address;

wire [10:0]address;
idecoder U1(
.hclk(hready),
.resetn(hresetn),
.data(hwdata),
.address(address),
.bursttype(bursttype),
.wr(hwr)
);




  
ahbmaster master(
  .hclk(hclk),
  .hresetn(hresetn),
  .din(data),
  .wr(hwr),
  .hreadyout(hreadyout),
  .hresp(hresp),
  .hrdata(hrdata),
  .hsize(hsize),
  .hwrite(hwrite),
  .hprot(hprot),
  .hburst(bursttype),
  .htrans(htrans),
  .hmastlock(hmastlock),
  .hready(hready),
  .hwdata(data),
  .leitura(leitura)
);

// decoder
decoder deco(
  .sel(address[10]),
  .hsel_1(hsel_1),
  .hsel_2(hsel_2)
);






// multiplexor
multiplexor multip(
  .hrdata_1(hrdata_1),
  .hrdata_2(hrdata_2),
  .hreadyout_1(hreadyout_1),
  .hreadyout_2(hreadyout_2),
  .hresp_1(hresp_1),
  .hresp_2(hresp_2),
  .sel(address[10]),
  .hrdata(hrdata),
  .hreadyout(hreadyout),
  .hresp(hresp)
);


displaydecoder U6(
.n(leitura),
.A(Am),
.B(Bm),
.C(Cm),
.D(Dm),
.E(Em),
.F(Fm),
.G(Gm)
);




endmodule 