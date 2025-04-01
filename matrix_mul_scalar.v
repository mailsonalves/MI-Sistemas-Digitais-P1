module matrix_mul_scalar (
    input [199:0] matrix_a,
    input [7:0] value_b,
    output [199:0] matrix_r
);

genvar i;
generate
    for (i = 0; i < 25; i = i + 1) begin : mul_scalar
        assign matrix_r[(i*8) +: 8]  = $signed(matrix_a[(i*8) +: 8]) * $signed(value_b);
    end
endgenerate
    
endmodule
