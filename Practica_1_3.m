% Practica 1
%%% Ejercicio 2, a)

figure(1)
t = linspace(-3,3);
x = @(t) 5*(t.^2) + 2*t;
plot(t,x(t))
xlabel('t')
ylabel('x(t)')

figure(2)
t = linspace(-3,3);
xe = @(t) 0.5*x(t) + 0.5*x(-t);
plot(t,xe(t))
xlabel('t')
ylabel('xe(t)')

figure(3)
t = linspace(-3,3);
xo = @(t) 0.5*x(t) - 0.5*x(-t);
plot(t,xo(t))
xlabel('t')
ylabel('xo(t)')

figure(4)
t = linspace(-3,3);
xf = @(t) xe(t) + xo(t);
plot(t,xf(t))
xlabel('t')
ylabel('x(t)')




