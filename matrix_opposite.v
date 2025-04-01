module matrix_opposite(
    input [199:0] matrix_a,
    output [199:0] matrix_r
);

matrix_mul_scalar helper (
    matrix_a,
    -8'd1,
    matrix_r
);

endmodule
