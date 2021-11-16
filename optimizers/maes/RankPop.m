%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Copyright by Hans-Georg Beyer (HGB)
%% For teaching use only! It is not allowed to use 
%% this program without written permission by HGB 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ranking = RankPop(pop, key)
  for l=1:length(pop);
    fs(l) = pop(l).f;
  end;
  [sfs, ranking] = sort(fs, key);
end
