temp = 18050;
cooling_rate = 0.9;
temp_min = 1;

x1 = 20.*rand(1) - 10;
x2 = 20.*rand(1) - 10;

currentState=[x1,x2];
bestSoFar = (4-(2.1*(x1^2))+((x1^4)/3))*(x1^2)+(x1*x2)+(-4+(4*(x2^2)))*(x2^2);


while(temp > temp_min)
    i = 0;
    while (i<100)
    x1 = x1 + (20.*rand(1) - 10);
    x2 = x2 + (20.*rand(1) - 10);
    if(x1>10)
        x1 = 20.*rand(1) - 10;
    elseif(x1<-10)
        x1 = 20.*rand(1) - 10;
    end;
    if(x2>10)
        x2 = 20.*rand(1) - 10;
    elseif(x2<-10)
        x2 = 20.*rand(1) - 10;
    end;
    newState=[x1,x2];
    y = (4-(2.1*(x1^2))+((x1^4)/3))*(x1^2)+(x1*x2)+(-4+(4*(x2^2)))*(x2^2);
    delta = y - bestSoFar;
 
    if(y<bestSoFar)
        currentState = newState;
        bestSoFar = y;
    elseif(2.71828183^(-delta/temp))>(0 + (rand(1)*1));
        currentState = newState;
    end;
    i = i+1;
    end;
    temp = temp*cooling_rate;    
end;
disp(bestSoFar);