`timescale 1ns / 1ps

module my_pe #(parameter ADDR_BW = 4)
(
        input aclk,
        input areset,
        input [31:0] ain,
        input [31:0] din,
        input [ADDR_BW - 1:0] addr,
        input we,
        input valid,
        output dvalid,
        output [31:0] dout
);
    
    (* ram_sytle = "block" *) reg [31:0] peram[0:(1 << ADDR_BW) - 1];
    reg [31:0] bin; // 2nd input for MAC
    reg [31:0] cin; // 3rd input for MAC, sum of prev comp
    
    reg a_tvalid;
    reg b_tvalid;
    reg c_tvalid;
    reg [ADDR_BW - 1:0] temp_addr;
   
    always @ (posedge aclk or negedge areset) begin
        if(areset == 0) begin
            bin = 0;
            cin = 0;
            {a_tvalid, b_tvalid, c_tvalid} = 3'b000;
        end
            
        else
            if(dvalid)
                cin = dout;
            else
                cin = cin;

        if(we) begin
            peram[addr] = din;
        end
        else if(valid) begin
            bin = peram[addr];
            {a_tvalid, b_tvalid, c_tvalid} = 3'b111;
        end
        else begin
            {a_tvalid, b_tvalid, c_tvalid} = 3'b000;
        end
    end

    //Xilinx IP
    floating_point_0 FPU
    (
        .aclk(aclk),
        .aresetn(areset),
        .s_axis_a_tvalid(a_tvalid),
        .s_axis_a_tdata(ain),
        .s_axis_b_tvalid(b_tvalid),
        .s_axis_b_tdata(bin),
        .s_axis_c_tvalid(c_tvalid),
        .s_axis_c_tdata(cin),
        .m_axis_result_tvalid(dvalid),
        .m_axis_result_tdata(dout)
    );
    
endmodule