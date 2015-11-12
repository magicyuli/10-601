function [Alpha] = Forward(a, b, p, X)
  % Alpha: N by T by K
  % a: K by K
  % b: K by M
  [N, T] = size(X);
  [K, M] = size(b);
  Alpha = {};
  for i = 1:N
    al = zeros(T, K);
    al(1, :) = (p .* b(:, X(i, 1)))';
    for j = 2:T
      al(j, :) = (al(j - 1, :) * a) .* b(:, X(i, j))';
    end
    Alpha(i, :) = {al};
  end
end
