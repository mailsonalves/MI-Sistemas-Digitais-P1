module mpu(
    input clock
);

reg [31:0] instruction;
wire [3:0] op_code;
wire [199:0] matrix_a, matrix_b, matrix_r, matrix_data_in;
wire [7:0] value_b, mem_address, pc_count;
wire [31:0] value_r;
wire [15:0] mem_data_in, mem_data_out; 
wire mem_read_enabled, mem_write_enabled, reg_data_in, reg_data_out;

/* counter(
    clock,
    pc_increment,
    ,
    pc_count
); */

control_unit(
    clock,
    instruction,
    op_code,
    pc_count,
    done_alu,
    start_alu,
    reg_a,
    reg_b,
    reg_write_enabled,
    reg_read_enabled,
    mem_write_enabled,
    mem_read_enabled,
    mem_address
);

register_file(
    clock,
    reg_a,
    reg_b,
    reg_data_in,
    reg_write_enabled,
    reg_read_enabled,
    reg_matrix_a,
    reg_matrix_b
);

alu(
    clock,
    start_alu,
    op_code,
    matrix_a,
    matrix_b,
    value_b,
    done_alu,
    matrix_r,
    value_r
);

memory(
	mem_address,
	clock,
	mem_data_in,
	mem_read_enabled,
	mem_write_enabled,
	mem_data_out
);

endmodule