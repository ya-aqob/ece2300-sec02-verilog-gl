//========================================================================
// PairTripleDetector_GL
//========================================================================

`ifndef PAIR_TRIPLE_DETECTOR_GL_V
`define PAIR_TRIPLE_DETECTOR_GL_V

`include "ece2300-misc.v"

module PairTripleDetector_GL
(
  input  wire in0,
  input  wire in1,
  input  wire in2,
  output wire out
);

  // NOT gates to create complement of each input

  wire not_in0, not_in1, not_in2;

  not( not_in0, in0 );
  not( not_in1, in1 );
  not( not_in2, in2 );

  // AND gates for each row in the truth table where output is one

  wire row3, row5, row6, row7;

  and( row3, not_in0, in1,     in2     );
  and( row5, in0,     not_in1, in2     );
  and( row6, in0,     in1,     not_in2 );
  and( row7, in0,     in1,     in2     );

  // OR together the outputs of the AND gates

  or( out, row3, row5, row6, row7 );

endmodule

`endif /* PAIR_TRIPLE_DETECTOR_GL_V */

