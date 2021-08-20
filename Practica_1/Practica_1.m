%%% Práctica 1
% 1, a)

figure(1)
t = linspace(-3,3);
x = @(t) 5*(t.^2) + 2*t;
plot(t,x(t))

xlabel('t')
ylabel('x(t)')
title('5t^2 + 2t')

%%% b)

figure(2)
f = input('Frecuencia: ');
a = input('Amplitud: ');
t = linspace(-2*pi, 2*pi);
y = @(t) a*sin(f*t);
plot(t,y(t))

xlabel('t')
ylabel('x(t)')
title([num2str(a),'sin(',num2str(f),'t)'])


