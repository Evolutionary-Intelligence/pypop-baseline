function [xopt,fopt] = r1nes(f,d,x,maxFuncEval) %*** Add maxFuncEvals - maximum function evaluations

% Written by Sun Yi (yi@idsia.ch).

% parameters
etax = 1;       % learning rate for the mean
etaa = 0.1;     % learning rate for the scale factor
etac = 0.1;     % primary representation is <a,c,v>

L = floor(8*log(d));                        % population size
shape = max(0.0, log(L/2+1.0)-log(1:L));    % fitness shaping
shape = shape / sum(shape);

% initialize
normalize = @(v) v/sqrt(v'*v);
xopt = x; fopt = f(x);
a = 0;                      % fixed diagonal strength
c = 0;
v = normalize(randn(d,1));
r = exp(c);
u = r*v;

weights = zeros(1,L);
fit = zeros(1,L);

%*** tm = cputime;
%*** while cputime - tm < timeout
nFuncEval = 0; %***
while nFuncEval < maxFuncEval %***

  % step 1: sampling
  W = randn(d,L) + u*randn(1,L);
  X = repmat(x,1,L) + exp(a)*W;
  for i = 1 : L, fit(i) = f(X(:,i)); end
  nFuncEval = nFuncEval + L; %***

  % step 2: fitness reshaping
  [~, idx] = sort(fit); weights(idx) = shape;
  if fit(idx(1)) < fopt
	xopt = X(:,idx(1)); fopt = fit(idx(1));
  end

  % step 3: compute the gradient
  dx = exp(a)*sum(repmat(weights,d,1).*W,2);
  v = u/r;    
  W = W(:,weights ~= 0);
  weights = weights(weights~=0);

  wws = sum(W.^2,1);
  wvs = v'*W;
  kp1 = ((r^2-d+2)*(wvs.^2) - (r^2+1)*wws)/(2*r*(d-1));
  kp2 = wvs/r;

  da = 1/(2*(d-1))*((wws-d) - (wvs.^2-1))*weights';
  du = (kp1*weights')*v + W*(kp2.*weights)';
  dc = (du'*v)/r;
  dv = du/r - dc*v;
  

  % step 4: compute the update  
  x = x + etax * dx;
  a = a + etaa * da;
  
  r = sqrt(u'*u);
  eps = min(etac,2*sqrt(r^2/(du'*du))); % prevent the update from getting crazy
  if dc > 0         % additive
      u = u + eps*du;
  else              % multiplicative
      r = r * exp(eps*dc);
      v = normalize(u/r + eps*dv);
      u = r*v;
  end
  
  if a < -10*log(10), break; end
end
