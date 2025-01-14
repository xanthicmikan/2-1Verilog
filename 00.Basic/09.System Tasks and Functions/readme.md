### 1. Syntax :
```verilog
$random([seed]);
  The seed argument controls :
    for example : val = $random(seed)
  Full Range :
    for example : val = $random % 2;
  Positive Range : 
    for example : val = {$random} % 2;
$stop([N]);//Pauses the simulation, allowing for inspection and debugging
  where N is
  0   :   Prints nothing
  1   :   Prints simulation time and location
  2   :   Prints simulation time, location, and statistics about the memory
            and central processing unit (CPU) time used in simulation
$finish([N]);//Ends the simulation completely
  where N is
  0   :   Prints nothing
  1   :   Prints simulation time and location
  2   :   Prints simulation time, location, and statistics about the memory
          and central processing unit (CPU) time used in simulation
  
$display(<list_of_arguments>);//append the newline character to the end of its string
  for example : $display ("Hello world");
$write(<list_of_arguments>);//does not append the newline character to the end of its string
  for example : $write ("Hello world");
$strobe(<list_of_arguments>);
$strobe will reflect changes made by nonblocking assignments that occur before its execution, 
  while $display will show values as they were at the moment it was called.
$monitor(<list_of_arguments>);
$monitor is like a task that run in the background of the main thread which monitors and 
  displays value changes of its argument variables.
$timeformat(<unit_number>, <precision>, <suffix_string>, <minimum field width>);
  for example : $timeformat(-9, 2, " ns");
$printtimescale
  for example : $printtimescale(tb);            
                $printtimescale(tb.m_alu);
                $printtimescale(tb.m_uut);
```	
### 2. Format Specifiers
```bash
---------------------------------------------------------
|Argument	|Description                             |
---------------------------------------------------------
|%h, %H 	|Display in hexadecimal format           |
---------------------------------------------------------
|%d, %D 	|Display in decimal format               |
---------------------------------------------------------
|%b, %B 	|Display in binary format                |
---------------------------------------------------------
|%m, %M 	|Display hierarchical name               |
---------------------------------------------------------
|%s, %S 	|Display as a string                     |
---------------------------------------------------------
|%t, %T 	|Display in time format                  |
---------------------------------------------------------
|%f, %F 	|Display 'real' in a decimal format      |
---------------------------------------------------------
|%e, %E 	|Display 'real' in an exponential format |
---------------------------------------------------------
```
### 3. conversion functions
```verilog
$rtoi //Converts a real number to an integer.
    for example : integer  $rtoi(real_val); 
$itor //Converts an integer to a real number. 
    for example : real     $itor(int_val); 
$realtobits //Converts a real number to its binary (bit) equivalent
    for example : [63:0]   $realtobits(real_val); 
$bitstoreal //Converts a bit pattern to a real number
    for example : real     $bitstoreal(bit_val); 
```
### 4. ASCII <-> Number Conversions  
In SystemVerilog, atoi(), itoa(), atohex(), hextoa().
	
### 5. Open & Close 
```verilog
  $fopen("my_file.txt", "w");
  $fclose(fd);
```
```bash  
 。Opening file modes
---------------------------------------------------------------------------
|Argument	        |Description                                       |
---------------------------------------------------------------------------
|"r" or "rb"	        |Open for reading                                  |
---------------------------------------------------------------------------
|"w" or "wb"	        |Create a new file for writing. If the file exists,|
|                       |truncate it to zero length and overwrite it       |
---------------------------------------------------------------------------
|"a" or "ab"	        |If file exists, append (open for writing at EOF), |
|                       |else create a new file                            |
---------------------------------------------------------------------------
|"r+", "r+b" or "rb+"	|Open for both reading and writing                 |
---------------------------------------------------------------------------
|"w+", "w+b" or "wb+"	|Truncate or create for update                     |
---------------------------------------------------------------------------
|"a+", "a+b", or "ab+"	|Append, or create new file for update at EOF      |
---------------------------------------------------------------------------
 。How to write file
---------------------------------------------------------------------------
|Function	|Description                                               |
---------------------------------------------------------------------------
|$fdisplay	|Similar to $display, writes out to file instead           |
---------------------------------------------------------------------------
|$fwrite	|Similar to $write, writes out to file instead             |
---------------------------------------------------------------------------
|$fstrobe	|Similar to $strobe, writes out to file instead            |
---------------------------------------------------------------------------
|$fmonitor	|Similar to $monitor, writes out to file instead           |
---------------------------------------------------------------------------
                                                                            
 。How to read file
---------------------------------------------------------------------------
|Function   |Description                                                   |
---------------------------------------------------------------------------
|$fgets     |Reading a line                                                |
---------------------------------------------------------------------------
|$feof      |Detecting EOF                                                 |
---------------------------------------------------------------------------
```
