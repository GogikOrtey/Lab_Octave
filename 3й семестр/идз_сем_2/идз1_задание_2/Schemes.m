#13. y(x) = cos(x) + x
#x = (0, 0.2*pi, 0.4*pi, 0.6*pi, 0.8*pi, pi) 
#center = 0.4*pi 

clear all
format long

y = (cos(0.6*pi) + 0.6*pi - (cos(0.4*pi) + 0.4*pi))/(0.2*pi) #f'(x) = (f(x+dx) - f(x))/dx + O(dx)

y = (cos(0.4*pi) + 0.4*pi - (cos(0.2*pi) + 0.2*pi))/(0.2*pi) #f'(x) = (f(x) - f(x-dx))/dx + O(dx)

y = (cos(0.6*pi) + 0.6*pi - (cos(0.2*pi) + 0.2*pi))/(2*0.2*pi) #f'(x) = (f(x+dx) - f(x-dx))/2dx + O(dx^2)

y = (cos(0.6*pi) + 0.6*pi - 2*(cos(0.4*pi) + 0.4*pi) + cos(0.2*pi) + 0.2*pi)/(0.2*pi)^2 # f''(x) = (f(x+dx) - 2f(x) + f(x-dx))/(dx)^2 + O(dx^2)
