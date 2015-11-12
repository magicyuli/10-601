function [score] = likelihood(a, b, p, Xtest)
  [N, T] = size(Xtest);
  Alpha = Forward(a, b, p, Xtest);
  score = zeros(N, 1);
  for i = 1:N
    al = cell2mat(Alpha(i, :));
    score(i) = log(sum(al(T, :)));
  end
end
