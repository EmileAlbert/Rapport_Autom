%Separate data from a OneShot experiment.
dicOfTry = containers.Map;
formatSpec = 'Optimisation du régulateur - essai n°%d';
changedIndexes = diff(setpoint)~=0;
index = find(changedIndexes == 1);
sizeindex = size(index)-1;
for i = 1:sizeindex(2)
    str = sprintf(formatSpec,i);
    essay.sp = setpoint(index(i)-10:index(i+1)-1);
    essay.out = output(index(i)-10:index(i+1)-1);
    essay.cons = consigne(index(i)-10:index(i+1)-1);
    essay.time = time(index(i)-10:index(i+1)-1);
    dicOfTry(str) = essay;
end