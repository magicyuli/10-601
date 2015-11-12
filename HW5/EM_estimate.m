function [a,b,p] = EM_estimate(a, b, p, X, nIter)
  [K, M] = size(b);
  for i = 1:nIter
    [Gamma, Xi] = E_step(a, b, p, X);
    [a, b, p] = M_step(Gamma, Xi, X, M, K);
  end
end
