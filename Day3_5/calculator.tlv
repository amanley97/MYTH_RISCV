\m4_TLV_version 1d: tl-x.org
\SV
   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/ecba3769fff373ef6b8f66b3347e8940c859792d/tlv_lib/calculator_shell_lib.tlv'])

\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   m4+cal_viz(@4)
   |calc
      @0
         $reset = *reset;
         
      @1
         $valid = $reset ? 0 : !(>>1$valid);
         $valid_or_reset = $valid || $reset;
         
      ?$valid_or_reset
         @1
            // CALCULATOR LOGIC
            $op[1:0] = $rand[1:0];
            $val1[31:0] = $reset ? 0 : >>2$out;
            $val2[31:0] = $reset ? 0 : $rand1[3:0];

            $sum[31:0] = $val1 + $val2;
            $diff[31:0] = $val1 - $val2;
            $prod[31:0] = $val1 * $val2;
            $quot[31:0] = $val1 / $val2;
            
         @2 
            $out[31:0] = ($op == 0) ?  $sum  :
                         ($op == 1) ?  $diff :
                         ($op == 2) ?  $prod :
                                       $quot ;
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule

