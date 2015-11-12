function [mu] = MaximizeMean(X, K, w)
  Nk = sum(w);
  mu = w' * X;
  for k = 1:K
    mu(k,:) = mu(k,:) / Nk(k);
  end
