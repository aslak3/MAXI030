module byte_select_generator
    (
        input a0, a1,
        input rn_w,
        input siz0, siz1,

        output upper, lower,
        output upper_upper, upper_mid, lower_mid, lower_lower
    );

    // Selects for 16 bit ports (writes)
    assign upper = (
            (a0 == 1'b0) || (rn_w == 1'b1)
        ) ? 1'b1 : 1'b0;
    assign lower = (
            (a0 == 1'b1 || siz0 == 1'b0 || siz1 == 1'b1) ||
            (rn_w == 1'b1)
        ) ? 1'b1 : 1'b0;

    // Selects for 32 bit ports (writes)
    assign upper_upper = (
            (a0 == 1'b0 && a1 == 1'b0) ||
            (rn_w == 1'b1)
        ) ? 1'b1 : 1'b0;
    assign upper_mid = (
            (a0 == 1'b1 && a1 == 1'b0) ||
            (a1 == 1'b0 && (siz0 == 1'b0 || siz1 == 1'b1)) ||
            (rn_w == 1'b1)
        ) ? 1'b1 : 1'b0;
    assign lower_mid = (
            (a0 == 1'b0 && a1 == 1'b1) ||
            (a1 == 1'b0 && siz0 == 1'b0 && siz1 == 1'b0) ||
            (a1 == 1'b0 && siz0 == 1'b1 && siz1 == 1'b1) ||
            (a1 == 1'b0 && a0 == 1'b1 && siz0 == 1'b0) ||
            (rn_w == 1'b1)
        ) ? 1'b1 : 1'b0;
    assign lower_lower = (
            (a0 == 1'b1 && a1 == 1'b1) ||
            (a0 == 1'b1 && siz0 == 1'b1 && siz1 == 1'b1) ||
            (siz0 == 1'b0 && siz1 == 1'b0) ||
            (a1 == 1'b1 && siz1 == 1'b1) ||
            (rn_w == 1'b1)
        ) ? 1'b1 : 1'b0;
endmodule
