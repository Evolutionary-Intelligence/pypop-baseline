%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Copyright by Hans-Georg Beyer (HGB)
%% For teaching use only! It is not allowed to use 
%% this program without written permission by HGB 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function f = Elli(y)
  nm1 = length(y)-1;
  f = sum( 10.^(6/nm1*(0:nm1)') .* y.^2 );
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
