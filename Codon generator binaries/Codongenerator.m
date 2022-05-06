%% Script for generating the dictionary

input = readtable('Codontable.xlsx');


keySet = table2cell(input(:,2));
valueSet = table2cell(input(:,3));

keySet(end) = {' '};
valueSet(end) = {' '};

M = containers.Map(keySet,valueSet);

save('codondict.mat','M')

%% Matlab script for creating a codon output from protein input

load('codondict.mat')
% This should load a dictionary map called M

input = 'test NAME';

upperinput = upper(input);

output = cell(1,length(upperinput)+1);


for k = 1:length(upperinput)
   codons = split(M(upperinput(k)),", ");
   output{k} = codons{randi(length(codons))};
end
stopcodon = split(M('Stop'),", ");
output{end} = stopcodon{randi(length(stopcodon))};

codonout = strjoin(string(output));