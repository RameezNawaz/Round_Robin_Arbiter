
module RR_Arbiter(clk,rst,Req,Grant);
  
  input   clk,rst;
  input   [3:0] Req;
  output  reg [3:0] Grant;
  
  reg [2:0] cs,ns;
  
  always@(posedge clk) // FLIPFLOP 
     begin
	   if(rst)
		  cs<=0;
		 else 
		  cs<=ns;
		  end
		  
	always@(*)    //NEXTSTATE LOGIC
	   begin
		
		  case(cs)
		 3'b000:begin
		 
		        if(Req[0]) ns=3'b001;
			else if(Req[1]) ns=3'b010;
			else if(Req[2]) ns=3'b011;
			else if(Req[3]) ns=3'b100;
 			else            ns=3'b000;
			
			     end
			  
		 3'b001:begin
			  
			     if(Req[1]) ns=3'b010;
			else if(Req[2]) ns=3'b011;
			else if(Req[3]) ns=3'b100;
			else if(Req[0]) ns=3'b001;
			else            ns=3'b000;
			
			     end
			     
		 3'b010:begin
		 
			     if(Req[2]) ns=3'b011;
			else if(Req[3]) ns=3'b100;
			else if(Req[0]) ns=3'b001;
			else if(Req[1]) ns=3'b010;
			else            ns=3'b000;
			  
			     end
			  
		 3'b011:begin
		   
			     if(Req[3]) ns=3'b100;
		   else if(Req[0]) ns=3'b001;
			else if(Req[1]) ns=3'b010;
			else if(Req[2]) ns=3'b011;
			else            ns=3'b000;
			  
			     end
			  
		 3'b100:begin
				 
		        if(Req[0]) ns=3'b001;
			else if(Req[1]) ns=3'b010;
			else if(Req[2]) ns=3'b011;
			else if(Req[3]) ns=3'b100;
		   else            ns=3'b000;
			  
			     end
			  
		 default:begin
			
		         if(Req[0]) ns=3'b001;
			 else if(Req[1]) ns=3'b010;
		    else if(Req[2]) ns=3'b011;
			 else if(Req[3]) ns=3'b100;
			 else            ns=3'b000;
			  
			      end
			  
			  endcase
			  end
			  
	always@(*)  //OUTPUT LOGIC
	   begin
		   case(cs)
			   3'b001:begin Grant=4'b0001 ; end 
			   3'b010:begin Grant=4'b0010 ; end 
			   3'b011:begin Grant=4'b0100 ; end 
				3'b100:begin Grant=4'b1000 ; end 
			   3'b000:begin Grant=4'b0000 ; end 
			endcase
			
			end
 endmodule	

module RR_Arbiter_tb();  //TESTBENCH
  reg   clk,rst;
  reg   [3:0] Req;
  wire   [3:0] Grant;
  
  RR_Arbiter dut(clk,rst,Req,Grant);
  always
  begin
  #5 clk=!clk;
  end
  
  initial 
  begin
  clk=0;
  rst=1;
  Req=4'b1111;
  #4 rst=0; Req=4'b0001;  
  #10  Req=4'b0011; 
  #10  Req=4'b0101; 
  #10  Req=4'b1000; 
  #10  Req=4'b0011; 
  #10  Req=4'b0111; 
  #10  Req=4'b1111; 
  #10 $finish;
  end
  endmodule
  
  
 
			 
			  
			  
		  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  /*wire [3:0] Latch_grant;
  wire Bus_Signal;
  wire r1,r2;
  wire Exceed_en;
  reg [1:0] Req_addr;
  
  
 always@(posedge clk)
    begin
	    if(rst)
		   begin
			Latch_grant<=0;
			end
			
		 else 
		   begin
		    Latch_grant[0]<= (!Bus_Signal & !Req[3] & !Req[2] & !Req[1] & Req[0] & !Req_addr[0] & !Req_addr1[1])
			                  |(!Bus_Signal & !Req[3] & !Req[2] & Req[0] & Req_addr[0] & !Req_addr1[1])
									|(!Bus_Signal & !Req[3]  & Req[0] & !Req_addr[0] & Req_addr1[1])
									|(!Bus_Signal  & Req[0] & Req_addr[0] & Req_addr1[1])
									|(!Bus_Signal & Latch_grant[0]);*/
			 
			 
			 
			
			