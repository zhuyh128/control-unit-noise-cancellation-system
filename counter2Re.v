module counter2Re(reset,clock,en, q,clear);
	input clock;
	input en;
	input   reset;
	input clear;
	output  q;
	
	reg [5:0]q_dat;
	
	assign q = (q_dat==6'd63)?1:0;
	always @(posedge clock)
	if (reset) q_dat <= 6'd0;
	else begin
		if(clear)q_dat<=0;
		else if(q_dat==6'd63)
			q_dat <= 6'd0;
		else if (en)
			q_dat <= q_dat+ 6'd1;
	end
endmodule
