  PROGRAM
  MAP
    INCLUDE('cRandom.inc'),ONCE
Debug   PROCEDURE(STRING pText)
    MODULE('')
OutputDebugStringA    PROCEDURE(*CSTRING cstr),PASCAL,RAW
    END
  END
  PRAGMA('define(asserts=>on)')  
tests               EQUATE(10000000)
low                 EQUATE(100000000)
high                EQUATE(999999999)
clk1                LONG
cnt1                LONG
clk2                LONG
cnt2                LONG

  CODE  
  !Test RANDOM
  clk1 = CLOCK()
  LOOP tests TIMES
    IF INRANGE(RANDOM(low,high),low,high)
      cnt1 += 1
    .
  .            
  clk1 = CLOCK() - clk1
  !Show sample
  LOOP 20 TIMES 
    Debug('RANDOM: '&RANDOM(low,high))
  .   

  !Test cRandom
  clk2 = CLOCK()
  LOOP tests TIMES
    IF INRANGE(cRandom(low,high),low,high)
      cnt2 += 1
    .
  .
  clk2 = CLOCK() - clk2
  !Show sample
  LOOP 20 TIMES 
    Debug('cRandom: '&cRandom(low,high))
  .   

  Debug('RANDOM: '&cnt1&' in  '&clk1/100&' seconds. cRandom: '&cnt2&' in  '&clk2/100&' seconds.')
  MESSAGE('RANDOM: '&cnt1&' in  '&clk1/100&' seconds. cRandom: '&cnt2&' in  '&clk2/100&' seconds.')
  
Debug               PROCEDURE(STRING pText)
cstr                  CSTRING(SIZE(pText)+1)
  CODE
  cstr = CLIP(pText)
  OutputDebugStringA(cstr)