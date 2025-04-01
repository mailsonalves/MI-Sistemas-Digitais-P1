module matrix_sub(
    input clock,
    input [199:0] matrix_a,
    input [199:0] matrix_b,
    output reg [199:0] matrix_r
);

genvar i;
generate
  for (i = 0; i < 25; i = i + 1) begin : subtraction
    always @(posedge clock) begin
      matrix_r[i*8 +: 8] <= $signed(matrix_a[i*8 +: 8]) - $signed(matrix_b[i*8 +: 8]);
    end
  end
endgenerate

endmodule
