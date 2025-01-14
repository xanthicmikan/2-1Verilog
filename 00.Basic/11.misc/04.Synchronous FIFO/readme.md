### 1. What is synchronous FIFO?
A Synchronous FIFO is a First-In-First-Out queue in which there is a single clock pulse for both data write and data read. In Synchronous FIFO the read and write operations are performed at the same rate. 

### 2. Operations in the synchronous FIFO:
Write Operation & Read Operation

### 3. Depth = (Writing Rate - Reading Rate)/Clock Frequency


### 4.
```BASH
               |clk
               |
               ↓
wr_en     ˍˍˍˍˍˍˍˍˍˍˍ  rd_en
-------->|           |<--------
wr_data  |           | rd_data
-------->|   FIFO    |-------->
fifo_full|           | fifo_empty
<--------|ˍˍˍˍˍˍˍˍˍˍˍ|-------->
               ↑
               |rstn
```
