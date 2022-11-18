# hi guys

sys = [1 1;
       1 -1];
sysans = [2;0];
% sys/sysans

sys2 = [1 1 1;
        -1 -1 2;
        1 -1 -1];
sys2ans = [3;0;-1];

sys3 = [1 1 1;
        -1 -1 2;
        -10001.1 -1 1];
sys3ans = [3;0;-10001.1];



%scalars should be -1, 1, 1

test = [2 1 -1;
        -3 -1 2;
        -2 1 2];
testans = [8; -11; -3];

% A is a matrix, nxn.
% B is a matrix, 1xn.
function ans = Gaussian(A, B);
  n = length(A);
  for i = 2:n;
    for k = 1:i-1;
      if(A(k, k) == 0)
        temp = A(i, 1:end);
        temp2 = B(i, 1);
        A(i, 1:end) = A(k, 1:end);
        B(i, 1) = B(k, 1);
        A(k, 1:end) = temp;
        B(k, 1) = temp2;
      end
      scalar = -1 * A(i, k)/A(k, k);
      A(i,(1:end)) += A(k, (1:end)) * scalar;
      B(i, 1) += B(k, 1) * scalar;
    end
  end
  for i = 2:n;
    for k = 1:i-1;
      scalar = -1 * A(k, i)/A(i, i);
      A(k,(1:end)) += A(i, (1:end)) * scalar;
      B(k, 1) += B(i, 1) * scalar;
    end
  end
  for i = 1:n;
    scalar = 1/A(i, i);
    A(i, (1:end)) *= scalar;
    B(i, 1) *= scalar;
  end
  ans = B;
end

an = Gaussian(test, testans)



function ans = Crammar(A, B)

  Dx = A;
  for i = 1:length(A)
    Dx(i,1) = B(i,1);
  end

  Dy = A;
  for i = 1:length(A)
    Dx(i,2) = B(i,1);
  end

  Dz = A;
  for i = 1:length(A)
    Dx(i,3) = B(i,1);
  end

  disp(Dxres)
  disp(Dxres)
  
  Dxres = det(Dx);
  Dyres = det(Dy);
  Dzres = det(Dz);
  DA = det(A);

  x = Dxres/DA;
  y = Dyres/DA;
  z = Dzres/DA;
  ans = [x y z]
end

cramAns = Crammar(test, testans)
% need a function to swap rows of matrix, multiply two rows by a scalar, and add two rows to each other.


  