module counter(
    input clock,
    input increment,
    input reset,
    output reg [7:0] q
);

always @(posedge clock) begin
    if (reset) begin
        q <= 0;
    end else begin
        q <= q + increment;
    end
end 

endmodule