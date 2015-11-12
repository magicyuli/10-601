function [a, b, p] = M_step(Gamma, Xi, X, M, K)
  [N, T] = size(X);
  ga = cell2mat(Gamma);
  xi = cell2mat(Xi);
  a = zeros(K, K);
  b = zeros(K, M);
  p = zeros(K, 1);
  for i = 1:T * N
    n = ceil(i / T);
    t = mod(i, T);
    if t == 0
      t = 25;
    end
    if t == 1
      p += ga(i, :)';
    end
    a = a + reshape(xi(i, :, :), K, K);
    b(:, X(n, t)) += ga(i, :)';
  end
  for i = 1:K
    a(i, :) = a(i, :) / sum(a(i, :));
    b(i, :) = b(i, :) / sum(b(i, :));
  end
  p = p / N;
end
