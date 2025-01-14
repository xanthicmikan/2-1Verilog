### 1. What is LIFO?
LIFO, which stands for Last In, First Out  
* New elements are added to the top (push operation)
* Elements are removed from the top (pop operation)
* The most recently added element is always at the top

2.  
```bash             
          ˍˍˍˍˍˍˍˍˍˍˍ 
         |     7     |
          –––––––––––
         |     6     | 
   push   –––––––––––  pop
-------->|     5     |<--------
          –––––––––––
         |     4     |
    din   –––––––––––  dout
-------->|     3     |-------->		 
          –––––––––––		
         |     2     |	 
          –––––––––––		  
     full|     1     | empty
<-------- ––––––––––– -------->
         |ˍˍˍˍˍ0ˍˍˍˍˍ|
             ↑  ↑
         clk |  |rstn
```
