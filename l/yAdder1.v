module yAdder1(z, cout, a, b, cin);
output z, cout;
input a, b, cin;


xor (p1, a, b);
xor (z, p1, cin);
and (p2, a, b);
and (p3, cin, p1);
or (cout, p3, p2);

endmodule
