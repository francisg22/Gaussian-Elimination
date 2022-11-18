A = [1 1 1;
    -1 -1 2;
  -10001.1 -1 1];
b = [3;0;-10001.1];
A\b
# hi guys

sys = [1 1;
       1 -1];
sysans = [2;0];
% sys/sysans

sys2 = [1 1 1;
        -1 -1 2;
        1 -1 -1];
sys2ans = [3;0;-1];

%scalars should be -1, 1, 1

test = [2 1 -1;
        -3 -1 2;
        -2 1 2];
testans = [8, -11, -3];

% A is a matrix, nxn.
% B is a matrix, 1xn.
function ans = Gaussian(A, B)
  n = length(A);
  
  for i = 2:n;
    for k = 1:i-1;
      scalar = -1 * A(i, k)/A(k, k);
      
      A(i,(1:end)) += A(k, (1:end)) * scalar;
      B(1, i) += B(1, k) * scalar;
    end
  end
  for i = 1:n-1;
    for k = 2:i;
      A(i, k) = 999
      % scalar = -1 * A(i, k)/A(k, k);
      
      % A(i,(1:end)) -= A(k, (1:end)) * scalar;
      % B(1, i) -= B(1, k) * scalar;
    end
  end
  ans = A;
end

an = Gaussian(test, testans)

% need a function to swap rows of matrix, multiply two rows by a scalar, and add two rows to each other.


  