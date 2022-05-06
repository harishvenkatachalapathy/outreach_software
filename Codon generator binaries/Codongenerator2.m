%% Script for generating the dictionary

input = readtable('Codontable2.xlsx');


keySet = table2cell(input(:,1));
valueSet = table2cell(input(:,2));

keySet(end) = {' '};
valueSet(end) = {' '};

keySet(end+1) = {''};
valueSet(end+1) = {''};

M = containers.Map(keySet,valueSet);

save('codondict_rev.mat','M')

%% Matlab script for creating a codon output from protein input

load('codondict_rev.mat')
% This should load a dictionary map called M

input = 'CAT GCA AGA ATC AGC CAC';

upperinput = upper(input);

inputsplit = strsplit(upperinput);

output = cell(1, length(inputsplit));

for k = 1:length(inputsplit)
   output{k} = M(inputsplit{k});
end

codonout = strjoin(string(output));