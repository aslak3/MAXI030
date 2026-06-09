module video_sync
    (
        input       clock,
        output reg  h_sync,
        output reg  v_sync,
        output      h_visible,
        output      v_visible,
        output      [9:0] h_count,
        output      [9:0] v_count,
        output      [9:0] frame_count
    );

    reg [9:0] h;
    reg [9:0] v;
    reg [9:0] frame;
    
	always @ (posedge clock) begin
		// Scanning beam path
		if (h < 800) begin
		    h <= h + 1;
        end else begin
			h <= 0;
			if (v < 525) begin
			    v <= v + 1;
            end else begin
				v <= 0;
			    frame <= frame + 1;
			end
		end

		// AKA H sync
		if (h > 640 + 16 + 16 && h <= 640 + 16 + 96 - 16) begin
			h_sync <= 0;
        end else begin
			h_sync <= 1;
        end

		// AKA V sync
		if (v >= 480 + 10 && v < 480 + 10 + 2) begin
			v_sync <= 0;
        end else begin
			v_sync <= 1;
		end
    end

    assign h_visible = h > 16 && h <= 640 + 16 ? 1 : 0;
    assign v_visible = v < 480 ? 1 : 0;

    assign h_count = h;
    assign v_count = v;
    assign frame_count = frame;
endmodule
