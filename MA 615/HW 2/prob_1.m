x = single(20);

x(1) = 1;
x(2) = 1/3;
for i=2:19
    x(i+1) = ((13/3) * x(i)) - ((4/3) * x(i-1));
end

disp(x');

y = single(20);
y(1) = 1;
for j=1:19
    y(j+1) = (1/3)^j;
end

disp(y');


n=1:1:20;
f1 = figure;
figure(f1);
plot(n,x)
f2 = figure;
figure(f2);
plot(n,y)