% Practica 1
%%% Ejercicio 2, a)

% a)
figure(1)
t = linspace(-3,3);
x = @(t) 5*(t.^2) + 2*t;
plot(t,x(t))
xlabel('t')
ylabel('y(t)')

hold on
t = linspace(-3,3);
y = @(t) 5*x(t);
y2 = @(t) (1/5)*x(t);
plot(t,y(t),t,y2(t))

hold off

% b)
figure(2)
plot(t,x(t))
xlabel('t')
ylabel('x(t)')
title('p(t)')

hold on
t = linspace(-3,3);
g = @(t) x(-t);
plot(t,g(t))

hold off

% c)
figure(3)
plot(t,x(t))
xlabel('t')
ylabel('x(t)')
title('p(t)')

hold on
t = linspace(-3,3);
p = @(t) x(2*t);
plot(t,p(t))

hold off

% d)
figure(4)
plot(t,x(t))
xlabel('t')
ylabel('x(t)')
title('h(t)')

hold on
t = linspace(-3,3);
h = @(t) x(t+5);
plot(t,h(t))

hold off

figure(5)
plot(t,x(t))
xlabel('t')
ylabel('x(t)')
title('s(t)')

hold on
t = linspace(-3,3);
s = @(t) x(t-2);
plot(t,s(t))

hold off

% e)
figure(6)
plot(t,x(t))
xlabel('t')
ylabel('x(t)')
title('m(t)')

hold on
t = linspace(-3,3);
m = @(t) x(t/3);
plot(t,m(t))

hold off

% f)
figure(7)
plot(t,x(t))
xlabel('t')
ylabel('x(t)')
title('z(t)')

hold on
t = linspace(-3,3);
z = @(t) x(4-2*t);
plot(t,z(t))

hold off
