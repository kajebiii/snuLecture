module pe_controller_tb ();

parameter ADDR_BW = 5;
parameter WORD_SIZE = 32;
parameter CLK_PERIOD = 10;
parameter TOTAL_TESTS = 5;

//for test
reg [2 : 0] test_no;
reg [3 : 0] test_phase;

reg [31 : 0] score;
reg failed;

//control signals
reg aclk;
reg aresetn;
reg start;
wire done;

//Data I/O
wire    [ADDR_BW - 1 : 0]   rdaddr;
reg     [WORD_SIZE - 1 : 0] din;
wire    [WORD_SIZE - 1 : 0] dout;

//input data
//final entry is for result storage(in input file)
reg [WORD_SIZE - 1 : 0] din_mem [0 : (1 << ADDR_BW)];

initial begin
    test_no <= 0;
    test_phase <= 0;
    aclk <= 0;
    score <= 0;
end

always @(posedge aclk)
begin
    din <= din_mem[rdaddr];
    
    if(test_phase == 4'b0000)
    begin
        $display("Test %d start", test_no);
        $display("Issueing reset signal to controller...(5 cycles)");
        case(test_no)
            3'b000 : $readmemh("/home/jeonghun/HSD/week4/inputs/input1_hex.txt", din_mem);
            3'b001 : $readmemh("/home/jeonghun/HSD/week4/inputs/input2_hex.txt", din_mem);
            3'b010 : $readmemh("/home/jeonghun/HSD/week4/inputs/input3_hex.txt", din_mem);
            3'b011 : $readmemh("/home/jeonghun/HSD/week4/inputs/input4_hex.txt", din_mem);
            3'b100 : $readmemh("/home/jeonghun/HSD/week4/inputs/input5_hex.txt", din_mem);
            default : $finish;
        endcase
        failed <= 0;
        test_phase <= 4'b0001;
        aresetn <= 0;
        start <= 0;
    end
    
    else if(test_phase < 4'b0101)
    begin
        test_phase <= test_phase + 1;
    end
    
    else if(test_phase == 4'b0101)
    begin
        aresetn <= 1;
        test_phase <= test_phase + 1;
    end
    
    else if(test_phase == 4'b0110)
    begin
        $display("Start command issued to PE controller");
        start <= 1;
        test_phase <= 4'b0111;
    end
    else if(test_phase == 4'b0111)
    begin
        start <= 0;

        if(done)
        begin
            if(dout == din_mem[(1 << ADDR_BW)])
            begin
                $display("Test %d's value comparison test passed", test_no);
                score <= score + 8;
            end
            else
            begin
                $display("Test %d value comparison test failed", test_no);
            end
            
            test_phase <= test_phase + 1;
        end
        
    end
    else if(test_phase < 4'b1100)
    begin
        if(done && !failed && dout == din_mem[(1 << ADDR_BW)])
        begin
            //result compare
            score <= score + 1;
        end
        else
        begin
            if(!done)
            begin
                $display("Test %d's 'done'bit turned off at cycle %d. failed", test_no, test_phase - 6);
                failed <= 1;
            end
            
            if(dout != din_mem[(1 << ADDR_BW)])
            begin
                $display("Test %d's result is incorrect at cycle %d. failed", test_no, test_phase - 6);
            end
            
            score <= score;
        end

    
        test_phase <= test_phase + 1;
    end
    else if(test_phase == 4'b1100)
    begin
        if(failed)
        begin
            $display("Test %d's display time check skipped due to previous error", test_no);
            score <= score;
        end
        else if(done || dout != 0)
        begin
            $display("Test %d's output shuold be displayed only for 5 cycles. failed(excessive output cycles)", test_no);
            score <= score;
        end
        else
        begin
            $display("Test %d's output display time check passed", test_no);
            score <= score + 8;
        end
        test_phase <= 4'b1111;
    end
    else
    begin
        if(test_no == TOTAL_TESTS - 1)
        begin
            $display("Test finished. Score : %d / %d", score, TOTAL_TESTS * 20);
            $finish;
        end
        
        test_no <= test_no + 1;
        test_phase <= 4'b0000;
    end
    
    
end

always #(CLK_PERIOD/2) aclk = ~aclk;


pe_controller #(WORD_SIZE, ADDR_BW)

UUT(
    .start(start),
    .clk(aclk),
    .reset(aresetn),
    .done(done),
    
    .rddata(din),
    .wrdata(dout),
    .rdaddr(rdaddr)
    );
    
endmodule
