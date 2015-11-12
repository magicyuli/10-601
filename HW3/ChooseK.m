function [K] = ChooseK(X, restarts, maxK)
  bestBic = -inf;
  for k=2:maxK-1
    localBestBIC = 0;
    for i=1:restarts
      [idx, C] = kmeans(X, k);
      curBIC = BIC(X, C, idx, k);
      localBestBIC = max(curBIC, localBestBIC);
    end
    if localBestBIC > bestBic
      bestBic = localBestBIC;
      K = k;
    end
  end
