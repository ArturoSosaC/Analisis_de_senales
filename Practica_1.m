%%% Práctica 1
% 1, a)

figure(1)
ta = linspace(-3,3);
ya = 5*(t.^2) + 2*t;
plot(ta,ya)

xlabel('t')
ylabel('x(t)')
title('5t^2 + 2t')

%%% b)

figure(2)
f = input('Frecuencia: ');
a = input('Amplitud: ');
tb = linspace(-2*pi, 2*pi);
yb = a*sin(f*t);
plot(tb,yb)

xlabel('t')
ylabel('x(t)')
title([num2str(a),'sin(',num2str(f),'t)'])


