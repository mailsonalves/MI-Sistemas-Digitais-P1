`define at(row, col) (8 * (col + 5*row))

module matrix_transpose (
    input [199:0] matrix_a,
    output [199:0] matrix_r
);

genvar i, j;
generate
    for (i = 0; i < 5; i = i + 1) begin : for_i
        for (j = 0; j < 5; j = j + 1) begin : for_j
            assign matrix_r[`at(i, j) +: 8] = matrix_a[`at(j, i) +: 8];
        end
    end
endgenerate

endmodule
