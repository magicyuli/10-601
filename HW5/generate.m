function [x] = generate(a, b, p, T)
  [K, M] = size(b);
  sta = zeros(T, K);
  sta(1, :) = mnrnd(1, p');
  for i = 2:T
    sta(i, :) = mnrnd(1, sta(i - 1, :) * a);
  end
  [one, sta] = max(sta, [], 2);
  [one, x] = max(mnrnd(1, b(sta, :)), [], 2);
  x = x';
end
