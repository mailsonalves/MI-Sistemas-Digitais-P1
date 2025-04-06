module control_unit(
    input clock,
    input [31:0] instruction,
    input [7:0] pc,
    input done_alu,
    output start_alu,
    output [3:0] op_code,
    output [5:0] reg_a,
    output [5:0] reg_b,
    output reg reg_write_enabled,
    output reg reg_read_enabled,
    output reg mem_write_enabled,
    output reg mem_read_enabled,
    output reg [7:0] mem_address
);

reg [2:0] state;

assign op_code = instruction[31-:5];

always @(posedge clock) begin
    case (state)
    3'd0: begin // FETCH
        mem_read_enabled <= 1;
        mem_address <= pc;
        state = state + 1;
    end 
/*     3'd1: begin // DECODE
        case (op_code) 
        4'h0: begin // ADD 
            
        end
        4'h1: // SUB 
        4'h2: // MUL 
        4'h3: // MUL SCALAR
        4'h4: // OPPOSITE
        4'h5: // TRANSPOSE
        4'h6: // DET2 
        4'h7: // DET3 
        4'h8: // DET4 
        4'ha: // DET5 
        4'hb: // LOAD 
        4'hc: // STORE
        endcase
    end */
	 
/*     3'd2: begin // EXECUTE 

    end */
//    3'd3: // MEMORY
	
    endcase
end
endmodule