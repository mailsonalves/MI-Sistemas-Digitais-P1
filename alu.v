module alu(
    input clock,
    input start,
    input [3:0] op_code,
    input [199:0] matrix_a, matrix_b,
    input [7:0] value_b,
    output done,
    output reg [199:0] matrix_r,
    output reg [31:0] value_r
);

    wire [199:0] m_add, m_sub, m_mul, m_opp, m_tra, m_muls;
    wire done_mul, done_det;

    // Module Instantiations
    matrix_add u_add (.matrix_a(matrix_a), .matrix_b(matrix_b), .matrix_r(m_add));
    matrix_mul u_mul (.start(start), .clock(clock), .matrix_a(matrix_a), .matrix_b(matrix_b), .matrix_r(m_mul), .done(done_mul));
    matrix_mul_scalar u_muls (.matrix_a(matrix_a), .value_b(value_b), .matrix_r(m_muls));
    matrix_sub u_sub (.matrix_a(matrix_a), .matrix_b(matrix_b), .matrix_r(m_sub));
    matrix_opposite u_opp (.matrix_a(matrix_a), .matrix_r(m_opp));
    matrix_transpose u_tra (.matrix_a(matrix_a), .matrix_r(m_tra));

    assign done = (op_code == 4'd2) ? done_mul : 
                  (op_code >= 4'd6) ? done_det : 
                  0;
                  
    always @(posedge clock) begin
        case (op_code)
            4'd0: matrix_r <= m_add;
            4'd1: matrix_r <= m_sub;
            4'd2: matrix_r <= m_mul;
            4'd3: matrix_r <= m_opp;
            4'd4: matrix_r <= m_tra;
            4'd5: matrix_r <= m_muls;
            default: matrix_r <= 200'd0;
        endcase
    end

endmodule