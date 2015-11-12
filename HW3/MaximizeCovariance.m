function [sigma] = MaximizeCovariance(X, K, w, mu)
  [n, f] = size(X);
  Nk = sum(w)
  sigma = zeros(f, f, K);
  for k = 1:K
    sigma(:,:,k) = 1 / Nk(k) * (repmat(w(:,k), 1, f) .* (X - mu(k,:)))' * (X - mu(k,:));
  end
