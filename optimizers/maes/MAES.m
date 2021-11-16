%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Copyright by Hans-Georg Beyer (HGB)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% simplified (mu/mu, lambda)-CMA-ES with path and rank-mu update and 
%% weighted recombination
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y_opt, f_dyn, sigma_dyn] = ...
  MAES( mu, lambda, goal_f_name, y_init, sigma_init, ...
        stepsize_stop, f_stop, g_stop, opt, max_function_evaluations) % ***

  dim = length(y_init);
  echi = sqrt(dim)*(1 - 1/dim/4 - 1/dim/dim/21);
  wi_raw = log(lambda/2 + 0.5) - log((1:mu));
  wi = wi_raw/sum(wi_raw);
  mu_eff = 1/sum(wi .^2);
  c_s = (mu_eff + 2)/(dim + mu_eff + 5);
  c_1 = 2/((dim+1.3)^2 + mu_eff);
  c_mu = min( 1-c_1, 2*(mu_eff - 2 + 1/mu_eff)/((dim + 2)^2 + mu_eff));
%  d_s = 1 + c_s + 2*max(0, sqrt((mu_eff-1)/(dim+1)));
% corrected:
  d_s = 1 + c_s + 2*max( 0, sqrt((mu_eff-1)/(dim+1)) - 1 );
  sqrt_s = sqrt(c_s*(2-c_s)*mu_eff);
  Parent.y = y_init;
  sigma = sigma_init;
  s = zeros(dim, 1);
  M = eye(dim);
  if strcmp(opt, 'maximization') % ***
    ordering = 'descend';
    maxi = 1;
    f_bsf = -1e300;
  else
    ordering = 'ascend';
    maxi = 0;
    f_bsf = 1e300;
  end
  f_dyn = [];
  sigma_dyn = [];
  g = 0;
  n_function_evaluations = 0; % ***
  while(n_function_evaluations < max_function_evaluations) % ***
    clear OffspringPop;
    for l=1:lambda
      Offspring.z = randn(dim, 1);
      Offspring.d = M*Offspring.z;
      Offspring.f = feval(goal_f_name, Parent.y + sigma*Offspring.d);
      OffspringPop(l) = Offspring;
    end
    n_function_evaluations = n_function_evaluations + lambda; % ***
    ranks = RankPop(OffspringPop, ordering);
    sum_z = zeros(dim, 1);
    sum_d = zeros(dim, 1);
    sum_zz = zeros(dim, dim);
    for m = 1:mu; 
      sum_z = sum_z + wi(m)*OffspringPop(ranks(m)).z;
      sum_d = sum_d + wi(m)*OffspringPop(ranks(m)).d;
      sum_zz = sum_zz  + wi(m)*OffspringPop(ranks(m)).z * OffspringPop(ranks(m)).z';
    end
    Parent.z = sum_z;
    Parent.d = sum_d;
    Parent.y = Parent.y + sigma*Parent.d;
    s = (1-c_s)*s + sqrt_s*Parent.z;
    Z = c_1*(s*s' - eye(dim)) + c_mu*(sum_zz - eye(dim));
    M = M + 0.5*M*Z;
    sigma = sigma*exp(c_s/d_s*(norm(s)/echi - 1));
    g = g+1;
% Statistics:
    Parent.f = feval(goal_f_name, Parent.y);
    f_dyn(g) = Parent.f; 
    sigma_dyn(g) = sigma;
% Termination conditions:
    if ( maxi )
      if (Parent.f > f_bsf)
        f_bsf = Parent.f;
        y_opt = Parent.y;
      end
      if ( Parent.f > f_stop ...
        || g > g_stop ...
        || norm(sigma*Parent.d) < stepsize_stop ...
        || ( (g > 10) && abs(f_dyn(g)-f_dyn(g-10)) <= 100*eps(abs(f_dyn(g))) ) )
        break;
      end
    else
      if (Parent.f < f_bsf)
        f_bsf = Parent.f;
        y_opt = Parent.y;
      end
      if (Parent.f < f_stop ...
        || g > g_stop ...
        || norm(sigma*Parent.d) < stepsize_stop ...
        || ( (g > 10) && abs(f_dyn(g)-f_dyn(g-10)) <= 100*eps(abs(f_dyn(g))) ) ) 
        break;
      end
    end
  end
 end
