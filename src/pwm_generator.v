module pwm_generator (
	input clk,
	input rst,
	input [7:0] duty_cycle,
	output reg pwm_out

);

	reg [7:0] counter;
	reg [7:0] duty_cycle_sync;
	
	always @(posedge clk, posedge rst) begin
		if (rst) begin
			counter <= 1'b0;
			duty_cycle_sync <= 1'b0;
			pwm_out <= 1'b0;
		end 	
		else begin
			duty_cycle_sync <= duty_cycle;
			if (counter == 8'b11111111) begin
				counter <= 1'b0;
			end 
			else if (counter < duty_cycle_sync) begin
				pwm_out <= 1'b1;
			end 	
			else begin
				pwm_out <= 1'b0;
				counter <= counter + 1;
			end
			
		end	

	end
	

endmodule	
