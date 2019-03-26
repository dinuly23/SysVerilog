module divideby3fsm2(input logic clk, input logic rst, output logic y);
  typedef enum logic [1:0] {S0, S1, S2} statetype;
  statetype state, nextstate;

  // state register
  always_ff @(posedge clk, posedge rst)
    if (rst) state <= S0;
    else state <= nextstate;

  // next state logic
  always_comb
    case (state)
    S0: nextstate <= S1;
    S1: nextstate <= S2;
    S2: nextstate <= S0;
    default: nextstate <= S0;
  endcase

  // output logic
  assign y = (state == S0);
endmodule
