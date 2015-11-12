function [w] = Expectation(X, K, t, mu, sigma)
  [n, f] = size(X);
  w = zeros(n, K);
  det_sigma = zeros(K, 1);
  inv_sigma = zeros(f, f, K);
  for k = 1:K
    det_sigma(k) = det(sigma(:,:,k));
    inv_sigma(:,:,k) = inv(sigma(:,:,k));
  end
  for i = 1:n
    for k = 1:k
      w(i, k) = 1 / sqrt((2 * pi)^f * det_sigma(k)) * exp(-0.5 * (X(i,:) - mu(k,:)) * inv_sigma(:,:,k) * (X(i,:) - mu(k,:))') * t(k);
    end
    w(i,:) = w(i,:) / sum(w(i,:));
  end
