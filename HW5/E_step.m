function [Gamma, Xi] = E_step(a, b, p, X)
  Alpha = Forward(a, b, p, X);
  Beta = Backward(a, b, p, X);
  [N, T] = size(X);
  [K, M] = size(b);
  Gamma = {};
  Xi = {};
  for i = 1:N
    al = cell2mat(Alpha(i, :));
    be = cell2mat(Beta(i, :));
    
    ga = al .* be;
    xi = zeros(T, K, K);
    for j = 1:T
      if j == 1
        %xi(1, :, :) = repmat(p' .* b(:, X(i, 1))' .* be(1, :), K, 1) / sum(ga(1, :)) / K;
      else
        xi(j, :, :) = (al(j - 1, :)' * be(j, :)) .* a .* repmat(b(:, X(i, j))', K, 1) / sum(ga(j, :));
      end
      ga(j, :) = ga(j, :) / sum(ga(j, :));
    end
    Gamma(i, :) = {ga};
    Xi(i, :) = {xi};
  end  
end
