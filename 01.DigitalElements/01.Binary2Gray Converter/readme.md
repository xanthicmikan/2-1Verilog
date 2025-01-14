### 1.Gray to Binary
```bash
formula : 
the Most Significant Bit : bin = gray;
the second bit : bin = gray ^ (bin+1)

if 4bit Gray
.bin[3] = gray[3];
.bin[2] = gray[2] ^ bin[3];
.bin[1] = gray[1] ^ bin[2];
.bin[0] = gray[0] ^ bin[1];
````
### 2.Binary to Gray
```bash 
formula : gray = (bin >> 1) ^ bin

if 4bit Binary
.gray[3] = 0 ^ bin[3];
.gray[2] = bin[3] ^ bin[2];
.gray[1] = bin[2] ^ bin[1];
.gray[0] = bin[1] ^ bin[0];
```