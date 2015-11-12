function [bic] = BIC(X, C, idx, k)
  [R, M] = size(X);
  Ri = zeros(k, 1);
  var = sum(sum((X - C(idx,:)).^2, 2)) / M / (R - k);
  for i=1:k
    Ri(i) = sum(idx == i);
  end
  bic = sum(-0.5 * (log(2 * pi) * Ri + M * Ri * log(var) + (Ri - k)) + Ri .* log(Ri) - log(R) * Ri) - k * (M + 1) / 2 * log(R);
