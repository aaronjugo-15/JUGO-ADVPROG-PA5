
%% Jugo, Aaron Siegfreid R.
%% 2ECEA
%% EXPERIMENT 5: INTRODUCTION TO MATLAB PROGRAMMING


%% A. Transpose Operators

disp("Problem A")
R = [5 -2 0 7; 1 3 -4 2; 6 0 8 -1];

Z = [2 + 3i, -1 + 4i, 5 - 2i; -3 + i, 6, 2 + 5i];

disp("R:")
disp(R)

disp("R Transpose using 'transpose(R)' :")
disp(transpose(R))

disp("R Transpose using R': ")
disp(R')

disp("R Transpose using R.': ")
disp(R.')

disp("Z:")
disp(Z)

disp("Z Transpose using 'transpose(Z)':")
disp(transpose(Z))

disp("Z Transpose using Z': ")
disp(Z')

disp("Z Transpose using Z.': ")
disp(Z.')


%% A. All operations give identical results for the real matrix R
%% B. Only transpose(Z) and Z." give the same result
%% C. When the matrix has complex entries, the apostrophe operator also takes the complex conjugate, as it both transposes the matrix and changes the sign of the imaginary parts.



disp("Problem B")

A = [2 -1 3 2; 
     1 4 -2 1;
     3 2 1 -1;
     -2 3 4 2]

B = [16; -7; 6; 7]

det_A = det(A);

x_inv = inv(A) * B;

n = length(B);
x_cramer = zeros(n,1);
for i = 1:n
    Ai = A;
    Ai(:,i) = B;
    x_cramer(i) = det(Ai) / det_A;
end

disp("x_inv:")
disp(x_inv)
disp("x_cramer: ")
disp(x_cramer)
disp("det(A): ")
disp(det_A);

% Numerical Precision Check:

disp("Numerical Precision")

disp("norm(x_inv - x_cramer): ")
disp(norm(x_inv - x_cramer))
disp("norm(A*x_inv - B):")
disp(norm(A*x_inv - B))