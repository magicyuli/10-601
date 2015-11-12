function [Beta] = Backward(a, b, p, X)
  % Beta: N by T by K
  % a: K by K
  % b: K by M
  [N, T] = size(X);
  [K, M] = size(b);
  Beta = {};
  for i = 1:N
    be = zeros(T, K);
    be(T, :) = ones(1, K);
    for j = T - 1:-1:1
      be(j, :) = (be(j + 1, :) .* b(:, X(i, j + 1))') * a';
    end
    Beta(i, :) = {be};
  end
end
