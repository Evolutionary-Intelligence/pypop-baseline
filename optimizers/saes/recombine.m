% this performs intermediate (multi-) recombination: 
function r = recombine(pop);
 r.sigma = 0; r.y = 0; 
 for i=1:length(pop); 
  r.sigma = r.sigma + pop{i}.sigma; r.y = r.y + pop{i}.y; 
 end;
 r.sigma = r.sigma/length(pop); r.y = r.y/length(pop);
end