`timescale 100 ns/10 ps

module conv(clk, reset, image, filter, result);

parameter DATA_WIDTH = 16;
parameter D = 4;

input clk, reset;
input [0:DATA_WIDTH*D-1] image;
input [0:DATA_WIDTH-1] filter;
output [0:DATA_WIDTH-1] result;





reg [DATA_WIDTH-1:0] selectedInput1;

integer i;

processingElement16 PE(
    .clk(clk),
    .reset(reset),
    .floatA(selectedInput1),
    .floatB(filter),
    .result(result)
);

always @ (posedge clk, posedge reset) begin
    if (reset == 1'b1)begin
        i = 0;
        selectedInput1 = 0;
    end else if (i > D-1) begin
        selectedInput1 = 0;
    end else begin
        selectedInput1 = image[DATA_WIDTH*i+:DATA_WIDTH];
        i = i + 1;
    end
end

endmodule