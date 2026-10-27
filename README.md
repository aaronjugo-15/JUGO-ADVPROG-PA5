## EXPERIMENT 5: INTRODUCTION TO MATLAB PROGRAMMING
### Aaron Siegfreid R. Jugo
### 2ECE-A
### 10/27/2026
### Objectives:

At the end of this laboratory activity, the student should be able to:

1. create real and complex matrices in MATLAB;


2. distinguish transpose from complex-conjugate transpose operations;


3. express a simultaneous linear system in matrix form; and


4. solve and check a linear system using the inverse method and Cramer's Rule.


---

### A. TRANSPOSE OPERATIONS



Define the following matrices exactly as shown:

* `R = [5 -2 0 7; 1 3 -4 2; 6 0 8 -1]`


* `Z = [2 + 3i, -1 + 4i, 5 - 2i; -3 + i, 6, 2 + 5i]`



For each matrix, compute and display all three expressions:

* `transpose(A)`


* `A'`


* `A.'`
where `A` is replaced by `R` and then by `Z`.



Answer the following in MATLAB comments below your output:
a. Which operations give identical results for the real matrix `R`?
b. Which two operations give identical results for the complex matrix `Z`?
c. What additional operation is performed by the apostrophe operator when the matrix contains complex entries?

Code:

```matlab
%% A. Transpose Operators

disp("Problem A")
R = [5 -2 0 7; 1 3 -4 2; 6 0 8 -1];

Z = [2 + 3i, -1 + 4i, 5 - 2i; -3 + i, 6, 2 + 5i];

disp("R:")
disp(R)

disp("R Tranpose using 'transpose(R)' :")
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

```



Output:
The output aligned with the required result:

* Displayed the real matrix `R` and its three transpose operations (`transpose(R)`, `R'`, and `R.'`):

```text
Problem A
R:
     5    -2     0     7
     1     3    -4     2
     6     0     8    -1

R Transpose using 'transpose(R)' :
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

```

* Displayed the complex matrix `Z` and its three transpose operations (`transpose(Z)`, `Z'`, and `Z.'`):

```text
Z:
   2.0000 + 3.0000i  -1.0000 + 4.0000i   5.0000 - 2.0000i
  -3.0000 + 1.0000i   6.0000 + 0.0000i   2.0000 + 5.0000i

Z Transpose using 'transpose(Z)':
   2.0000 + 3.0000i  -3.0000 + 1.0000i
  -1.0000 + 4.0000i   6.0000 + 0.0000i
   5.0000 - 2.0000i   2.0000 + 5.0000i

Z Transpose using Z': 
   2.0000 - 3.0000i  -3.0000 - 1.0000i
  -1.0000 - 4.0000i   6.0000 + 0.0000i
   5.0000 + 2.0000i   2.0000 - 5.0000i

Z Transpose using Z.': 
   2.0000 + 3.0000i  -3.0000 + 1.0000i
  -1.0000 + 4.0000i   6.0000 + 0.0000i
   5.0000 - 2.0000i   2.0000 + 5.0000i

```

* Answered the conceptual questions in comments:


* **A.** All operations give identical results for the real matrix `R`.


* **B.** Only `transpose(Z)` and `Z.'` give the same result.


* **C.** When the matrix has complex entries, the apostrophe operator (`'`) also takes the complex conjugate, as it both transposes the matrix and changes the sign of the imaginary parts.





---

### B. TWO METHODS FOR A LINEAR SYSTEM



Solve the simultaneous system:

* `2x1 - x2 + 3x3 + 2x4 = 16`


* `x1 + 4x2 - 2x3 + x4 = -7`


* `3x1 + 2x2 + x3 - x4 = 6`


* `-2x1 + 3x2 + 4x3 + 2x4 = 7`



Create the coefficient matrix `A` and right-hand-side vector `b` (`B`). Then compute the solution in two ways:

1. **Inverse method:** compute `x_inv` using the inverse of `A`.


2. **Cramer's Rule:** replace one column of `A` at a time with `b` (`B`), use determinants, and store the result in `x_cramer`. A loop is optional.



Do not use MATLAB's left-division operator as either of the two required methods.
**Required checks:** Display both solution vectors and `det(A)`. Also display `norm(x_inv - x_cramer)` and `norm(A*x_inv - b)`. The determinant must be nonzero. Both norm checks should be approximately zero to numerical precision.

Code:

```matlab
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

```



Output:
The output aligned with the required result:

* Defined and displayed the coefficient matrix `A` and right-hand-side vector `B`:

```text
Problem B

A =
     2    -1     3     2
     1     4    -2     1
     3     2     1    -1
    -2     3     4     2

B =
    16
    -7
     6
     7

```

* Displayed both solution vectors (`x_inv` and `x_cramer`), `det(A)`, and the numerical precision checks (`norm(x_inv - x_cramer)` and `norm(A*x_inv - B)`):

```text
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
   280

Numerical Precision
norm(x_inv - x_cramer): 
   1.1102e-16

norm(A*x_inv - B):
   2.6645e-15
```
