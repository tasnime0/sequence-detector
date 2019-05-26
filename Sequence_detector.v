module sequence_detector (DATA_IN,SEQ_FOUND,clk,rst);
  input clk,DATA_IN,rst;
  output reg SEQ_FOUND;
  parameter [2:0]s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110;
  reg [2:0]state;
  always@(posedge clk) 
  begin
  case (rst)
    1'b1: begin
          state<=s0;
          SEQ_FOUND<=1'b0;
          end
    1'b0:begin      
         case (state)
         s0:if (DATA_IN)
              begin
              state<=s1;
              SEQ_FOUND<=1'b0;
              end
            else 
            begin
            state<=s0;
            SEQ_FOUND<=1'b0;
            end
          s1: if (DATA_IN)
                begin
                state<=s2;
                SEQ_FOUND<=1'b0;
                end
              else
              begin
              state<=s0;
              SEQ_FOUND<=1'b0;
              end
          s2: if (DATA_IN)
                begin
                state<=s2;
                SEQ_FOUND<=1'b0;
                end
              else
              begin
              state<=s3;
              SEQ_FOUND<=1'b0;
              end
          s3: if (DATA_IN)
                begin
                state<=s4;
                SEQ_FOUND<=1'b0;
                end
              else
              begin
              state<=s0;
              SEQ_FOUND<=1'b0;
              end
          s4: if (DATA_IN)
                begin
                state<=s2;
                SEQ_FOUND<=1'b0;
                end
              else
              begin
              state<=s5;
              SEQ_FOUND<=1'b0;
              end
          s5: if (DATA_IN)
                begin
                state<=s1;
                SEQ_FOUND<=1'b0;
                end
              else
              begin
              state<=s6;
              SEQ_FOUND<=1'b1;
              end
          s6: if (DATA_IN)
                begin
                state<=s1;
                SEQ_FOUND<=1'b0;
                end
              else
              begin
              state<=s0;
              SEQ_FOUND<=1'b0;
              end
          default: begin
                   state<=s0;
                   SEQ_FOUND<=1'b0;    
                   end
          endcase
          end
  endcase
  end
endmodule     

