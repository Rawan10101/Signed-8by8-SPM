//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 05/12/2025 05:11:56 PM
//// Design Name: 
//// Module Name: to_bcd
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 05/12/2025 05:11:56 PM
//// Design Name: 
//// Module Name: BCDConvert
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: Converts a 16-bit binary number to BCD using shift/add-3 algorithm
//// 
////////////////////////////////////////////////////////////////////////////////////

module to_bcd(
    input  [14:0] bin_d_in,    
    output [18:0] bcd_d_out
);

// Declare all necessary wires
wire [3:0] p1, o1, p2, o2, p3, o3, p4, o4, p5, o5, p6, o6, p7, o7, p8, o8;
wire [3:0] p9, o9, p10, o10, p11, o11, p12, o12, p13, o13, p14, o14;
wire [3:0] p15, o15, p16, o16, p17, o17, p18, o18, p19, o19, p20, o20;
wire [3:0] p21, o21, p22, o22, p23, o23, p24, o24, p25, o25, p26, o26;
wire [3:0] p27, o27, p28, o28, p29, o29, p30, o30;

assign p1  = {1'b0, bin_d_in[14], bin_d_in[13], bin_d_in[12]};
add_3 m1(p1, o1);

assign p2  = {o1[2:0], bin_d_in[11]};
add_3 m2(p2, o2);

assign p3  = {o2[2:0], bin_d_in[10]};
add_3 m3(p3, o3);

assign p4  = {1'b0, o1[3], o2[3], o3[3]};
add_3 m4(p4, o4);

assign p5  = {o3[2:0], bin_d_in[9]};
add_3 m5(p5, o5);

assign p6  = {o4[2:0], o5[3]};
add_3 m6(p6, o6);

assign p7  = {o5[2:0], bin_d_in[8]};
add_3 m7(p7, o7);

assign p8  = {o6[2:0], o7[3]};
add_3 m8(p8, o8);

assign p9  = {o7[2:0], bin_d_in[7]};
add_3 m9(p9, o9);

assign p10 = {1'b0, o4[3], o6[3], o8[3]};
add_3 m10(p10, o10);

assign p11 = {o8[2:0], o9[3]};
add_3 m11(p11, o11);

assign p12 = {o9[2:0], bin_d_in[6]};
add_3 m12(p12, o12);

assign p13 = {o10[2:0], o11[3]};
add_3 m13(p13, o13);

assign p14 = {o11[2:0], o12[3]};
add_3 m14(p14, o14);

assign p15 = {o12[2:0], bin_d_in[5]};
add_3 m15(p15, o15);

assign p16 = {o13[2:0], o14[3]};
add_3 m16(p16, o16);

assign p17 = {o14[2:0], o15[3]};
add_3 m17(p17, o17);

assign p18 = {o15[2:0], bin_d_in[4]};
add_3 m18(p18, o18);

assign p19 = {1'b0, o10[3], o13[3], o16[3]};
add_3 m19(p19, o19);

assign p20 = {o16[2:0], o17[3]};
add_3 m20(p20, o20);

assign p21 = {o17[2:0], o18[3]};
add_3 m21(p21, o21);

assign p22 = {o18[2:0], bin_d_in[3]};
add_3 m22(p22, o22);

assign p23 = {o19[2:0], o20[3]};
add_3 m23(p23, o23);

assign p24 = {o20[2:0], o21[3]};
add_3 m24(p24, o24);

assign p25 = {o21[2:0], o22[3]};
add_3 m25(p25, o25);

assign p26 = {o22[2:0], bin_d_in[2]};
add_3 m26(p26, o26);

assign p27 = {o23[2:0], o24[3]};
add_3 m27(p27, o27);

assign p28 = {o24[2:0], o25[3]};
add_3 m28(p28, o28);

assign p29 = {o25[2:0], o26[3]};
add_3 m29(p29, o29);

assign p30 = {o26[2:0], bin_d_in[1]};
add_3 m30(p30, o30);

// Final output assignment
assign bcd_d_out = {o19[3], o23[3], o27, o28, o29, o30, bin_d_in[0]};

endmodule



