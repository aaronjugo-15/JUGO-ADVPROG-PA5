## EXPERIMENT 5: INTRODUCTION TO MATLAB PROGRAMMING
### Aaron Siegfreid R. Jugo
### 2ECE-A
### 10/27/2026

### Objectives:
At the end of this laboratory activity, the student should be able to:
1. Create real and complex matrices in MATLAB;
2. Distinguish transpose from complex-conjugate transpose operations;
3. Express a simultaneous linear system in matrix form; and
4. Solve and check a linear system using the inverse method and Cramer's Rule.

Write a MATLAB script containing clearly labeled sections for both problems. Display the requested matrices and numerical checks.
- Submit one MATLAB script named `Surname_PA5.m`.
- Use MATLAB matrix operations and built-in functions; do not type a computed answer directly into the output.
- Include your name and section in comments, clearly labeled Problem A and Problem B sections, all required displays, and the three short comments explaining the transpose behavior.
- The script must run from beginning to end without errors.
----------------------------------------------------------------------------------------------------
### A. TRANSPOSE OPERATIONS
Define the following matrices exactly as shown:

```math
R = \begin{bmatrix} 5 & -2 & 0 & 7 \\ 1 & 3 & -4 & 2 \\ 6 & 0 & 8 & -1 \end{bmatrix}
```

```math
Z = \begin{bmatrix} 2+3i & -1+4i & 5-2i \\ -3+i & 6 & 2+5i \end{bmatrix}
```

For each matrix, compute and display all three expressions: `transpose(A)`, `A'`, and `A.'` where `A` is replaced by `R` and then by `Z`.

Answer the following in MATLAB comments below your output:
a. Which operations give identical results for the real matrix $R$?
b. Which two operations give identical results for the complex matrix $Z$?
c. What additional operation is performed by the apostrophe operator when the matrix contains complex entries?


Code:

```
%% Jugo, Aaron Siegfreid R.
%% 2ECEA
%% EXPERIMENT 5: INTRODUCTION TO MATLAB PROGRAMMING

%% A. Transpose Operators

disp("Problem A")
R = [5 -2 0 7; 1 3 -4 2; 6 0 8 -1];

Z = [2 + 3i, -1 + 4i, 5 - 2i; -3 + i, 6, 2 + 5i]

disp(R)

disp("R Tranpose using 'transpose(R)' :")
disp(transpose(R))

disp("R Tranpose using R': ")
disp(R')

disp("R Tranpose using R.': ")
disp(R.')

disp(Z)

disp("Z Tranpose using 'transpose(Z)':")
disp(transpose(Z))

disp("Z Tranpose using Z': ")
disp(Z')

disp("Z Tranpose using Z.': ")
disp(Z.')

%% A. All operations give identical results for the real matrix R
%% B. Only transpose(Z) and Z.' give the same result
%% C. When the matrix has complex entries, the apostrophe operator also takes the complex conjugate, as it both transposes the matrix and changes the sign of the imaginary parts.
```

Output:
The output aligned with the required result:

- Defined and displayed matrices `R` and `Z`, along with their respective transpose operations (`transpose()`, `'`, and `.'`):
```text
Problem A

Z =

   2.0000 + 3.0000i  -1.0000 + 4.0000i   5.0000 - 2.0000i
  -3.0000 + 1.0000i   6.0000 + 0.0000i   2.0000 + 5.0000i

     5    -2     0     7
     1     3    -4     2
     6     0     8    -1

R Tranpose using 'transpose(R)' :
     5     1     6
    -2     3     0
     0    -4     8
     7     2    -1

R Transpose using R': 
     5     1     6
    -2     3     0
     0    -4     8
     7     2    -1

R Transpose using R.': 
     5     1     6
    -2     3     0
     0    -4     8
     7     2    -1

   2.0000 + 3.0000i  -1.0000 + 4.0000i   5.0000 - 2.0000i
  -3.0000 + 1.0000i   6.0000 + 0.0000i   2.0000 + 5.0000i

Z Tranpose using 'transpose(Z)':
   2.0000 + 3.0000i  -3.0000 + 1.0000i
  -1.0000 + 4.0000i   6.0000 + 0.0000i
   5.0000 - 2.0000i   2.0000 + 5.0000i

Z Tranpose using Z': 
   2.0000 - 3.0000i  -3.0000 - 1.0000i
  -1.0000 - 4.0000i   6.0000 + 0.0000i
   5.0000 + 2.0000i   2.0000 - 5.0000i

Z Tranpose using Z.': 
   2.0000 + 3.0000i  -3.0000 + 1.0000i
  -1.0000 + 4.0000i   6.0000 + 0.0000i
   5.0000 - 2.0000i   2.0000 + 5.0000i
```
*(Insert screenshot of Problem A output here if applicable)*


---------------------------------------------------------------------------------------
### B. TWO METHODS FOR A LINEAR SYSTEM
Solve the simultaneous system:

$$2x_1 - x_2 + 3x_3 + 2x_4 = 16$$
$$x_1 + 4x_2 - 2x_3 + x_4 = -7$$
$$3x_1 + 2x_2 + x_3 - x_4 = 6$$
$$-2x_1 + 3x_2 + 4x_3 + 2x_4 = 7$$

Create the coefficient matrix `A` and right-hand-side vector `b`. Then compute the solution in two ways:
1. Inverse method: compute `x_inv` using the inverse of `A`.
2. Cramer's Rule: replace one column of `A` at a time with `b`, use determinants, and store the result in `x_cramer`. A loop is optional.

Do not use MATLAB's left-division operator as either of the two required methods.

Required checks: Display both solution vectors and `det(A)`. Also display `norm(x_inv - x_cramer)` and `norm(A*x_inv - b)`. The determinant must be nonzero. Both norm checks should be approximately zero to numerical precision.

Code:
```matlab
disp("Problem B")

A = [2 -1 3 2; 
     1 4 -2 1;
     3 2 1 -1;
     -2 3 4 2]

b = [16; -7; 6; 7]

det_A = det(A);

x_inv = inv(A) * b;

n = length(b);
x_cramer = zeros(n,1);
for i = 1:n
    Ai = A;
    Ai(:,i) = b;
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
disp("norm(A*x_inv - b):")
disp(norm(A*x_inv - b))
```

Output:
The output aligned with the required result:
- Created coefficient matrix `A` and vector `b`, solved for `x_inv` and `x_cramer`, and computed `det(A)`:
```text
Problem B

A =

     2    -1     3     2
     1     4    -2     1
     3     2     1    -1
    -2     3     4     2

b =

    16
    -7
     6
     7

x_inv:
    2.0000
   -1.0000
    3.0000
    1.0000

x_cramer: 
    2.0000
   -1.0000
    3.0000
    1.0000

det(A): 
  157.0000
```

- Performed and displayed the numerical precision checks:
```
Numerical Precision
norm(x_inv - x_cramer): 
   8.0779e-16

norm(A*x_inv - b):
   3.5527e-15
