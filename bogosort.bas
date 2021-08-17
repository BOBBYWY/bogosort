REM bogosort written in Decimal Basic
LET arraysize = 10
LET status$ = "false"
LET trial = 1
DIM originalarray(arraysize)
DIM shufflearray(arraysize)
FOR count = 1 TO arraysize !initialize original array
   LET originalarray(count)=count
   LET shufflearray(count) = originalarray(count)
   PRINT count;
NEXT COUNT
PRINT

SUB shuffle
   RANDOMIZE
   LET msize = arraysize
   FOR count = msize TO 1 STEP -1
      LET randomnumber = 1+INT(count*RND)
      LET preshuffle = shufflearray(count)      
      LET shufflearray(count) = shufflearray(randomnumber)
      LET shufflearray(randomnumber) = preshuffle
   NEXT count
   FOR count = 1 TO arraysize
      PRINT shufflearray(count);
   NEXT count
   PRINT
END SUB 

SUB compare
   LET status$ = "true"
   FOR count = 1 TO arraysize
      IF originalarray(count)<> shufflearray(count) THEN
         LET status$ = "false"
         EXIT FOR
      END IF
   NEXT count
END SUB

DO WHILE status$ = "false" 
   CALL shuffle
   CALL compare
   PRINT "Trial"; trial
   LET trial = trial +1
LOOP

END
