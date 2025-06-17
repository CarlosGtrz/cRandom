  MEMBER
  PRAGMA('link(bcryptrandom.lib)')
BCRYPT_USE_SYSTEM_PREFERRED_RNG EQUATE (2)
  MAP  
    MODULE('')
      BCryptGenRandom(UNSIGNED hAlgorithm,*STRING pbBuffer,UNSIGNED cbBuffer,UNSIGNED dwFlags),UNSIGNED,PROC,RAW,PASCAL,DLL(1)
    END    
cRandom PROCEDURE(LONG low, LONG high),LONG
  END

cRandom PROCEDURE(LONG low, LONG high)!,LONG
randomData STRING(4),AUTO
randomLong LONG,OVER(randomData)
range LONG,AUTO
  CODE
    BCryptGenRandom(0,randomData,4,BCRYPT_USE_SYSTEM_PREFERRED_RNG) !Get 4 random bytes
    range = high - low + 1
    randomLong %= range
    randomLong += low
    RETURN randomLong