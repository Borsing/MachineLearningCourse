function [theta1,theta0]=gradient_descent()
  #initialisation
  theta0=0;
  theta1=0;
  alpha = 0.1 ;
  dataset = [1,2,4,0;0.5,1,2,0];
  epsilon = 100 ; 
  
  m = size(dataset)(1,2);

  

  #graph 
  hold on
  plot(dataset(1,:),dataset(2,:),'x');
 
  
  for j = 1:1000
    
    sum0 = 0;
    sum1 = 0;
    
    for i = 1:m
      xi = dataset(1,i) ;
      yi = dataset(2,i) ;
      sum0 += (theta1 * xi + theta0) - yi ;
      sum1 += ((theta1 * xi + theta0) - yi) * xi ;
    endfor
    
    theta0_t = theta0 - alpha * (1/m) * sum0 ;
    theta1_t = theta1 - alpha * (1/m) * sum1 ;
    
    #epsilon = abs(costfunction(theta0,theta1,dataset) - costfunction(theta0_t,theta1_t,dataset))
        
    theta0   = theta0_t ;
    theta1   = theta1_t ;
  endfor
  
  disp("t0"),disp(theta0),disp(",t1"),disp(theta1);

  #graph 
  fplot(@(x) theta1 * x + theta0,[0,4]) ;
  hold off
  
endfunction

function j=costfunction(theta0, theta1, dataset)
  j = 0 ;
  m = size(dataset)(1,2);
  
  for i = 1:m
    xi = dataset(1,i) ;
    yi = dataset(2,i) ;
    j += (yi - (theta1 * xi + theta0))**2  ;
  endfor
  
endfunction