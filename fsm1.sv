module fsm1(input logic clk, rst, input logic Ta, Tb, output logic [1:0] La, Lb);
	typedef enum logic [1:0] {S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11} statetype;
	statetype state, nextstate;
	
	always_ff @(posedge clk, posedge rst)
	begin
		if (rst) state <= S0;
		else state <= nextstate;
	end	

	always_comb
	begin
		case(state)
			S0: begin
				if (~Ta)
					nextstate <= S1;
				else  nextstate <= S0;

			end
			S1: nextstate<= S2;
			S2: begin
				if (~Tb)
					nextstate<= S3;
				else  nextstate<= S2;

			end
			S3: nextstate<= S0;
			default: nextstate<= S0;
		endcase
	end

  assign  La[1] = state[1];
  assign  La[0] = state[0]&(~state[1]);
  assign  Lb[1] = ~state[1];
  assign  Lb[0] = state[1]&state[0];
endmodule
