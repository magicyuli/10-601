function [t, mu, sigma] = EM(X, k, t0, mu0, sigma0, nIter)
  t = t0;
  mu = mu0;
  sigma = sigma0;
  for i = 1:nIter
    w = Expectation(X, k, t, mu, sigma);
    t = MaximizeMixtures(k, w);
    mu = MaximizeMean(X, k, w);
    sigma = MaximizeCovariance(X, k, w, mu);
  end
