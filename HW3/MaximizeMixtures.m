function [t] = MaximizeMixtures(k, w)
  Nk = sum(w)
  t = Nk' / size(w, 1);
