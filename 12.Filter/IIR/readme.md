### 1. Reference   
https://en.wikipedia.org/wiki/Infinite_impulse_response 
### 2. Infinite  Impulse Response(IIR)  

* FIR Filter (Transition function):  
$$H(z) = \frac {\sum_{k=0}^K b_kz^{-k}}{\sum_{l=0}^L a_lz^{-l}}$$


* Z Domain :  
$$Y(z) = X(z)\frac {\sum_{k=0}^K b_kz^{-k}}{\sum_{l=0}^L a_lz^{-l}}$$  
* Time Domain :  
$$y(n) = \sum_{k=0}^K b_kx(n-k) - \sum_{l=0}^L a_ly(n-l)$$   

FIR filter only zeros not poles.

