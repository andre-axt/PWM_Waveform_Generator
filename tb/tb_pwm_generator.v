`timescale 1ns/1ns

module tb_pwm_generator ();
	reg clk;
	reg rst;
	reg [7:0]duty_cycle;
	wire pwm_out;
	
	pwm_generator uut (
		.clk(clk),
		.rst(rst),
		.duty_cycle(duty_cycle),
		.pwm_out(pwm_out)
	
	);

	initial begin
		clk = 1'b0;
		forever #1 clk = ~clk;
	end
	
	initial begin
		$monitor("Time= %0t | clk=%b | rst=%b | duty_cycle=%0d | pwm=%b", $time, clk, rst, duty_cycle, pwm_out);
	end

	initial begin 
		$dumpfile("../sim/dump.vcd");
		$dumpvars(0, tb_pwm_generator);
		rst = 1'b1;
		#10
		rst = 1'b0;
	       	#20
		duty_cycle = 8'b01000000;
		#510
		duty_cycle = 8'b10000000;
		#510
		rst = 1'b1;
		#20
		rst = 1'b0;
		$finish;
	end

endmodule
		

