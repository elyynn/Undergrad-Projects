// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Apr  3 19:14:38 2024
// Host        : LAPTOP-0PALS6FJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/72/ip_repo/hdmi_text_controller_1_0/src/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.698 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1200" *) 
  (* C_READ_DEPTH_B = "1200" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1200" *) 
  (* C_WRITE_DEPTH_B = "1200" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 47984)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
