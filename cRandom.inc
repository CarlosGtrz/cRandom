  MODULE('cRandom.clw')
!!! <summary>
!!! Returns a random integer.
!!! </summary>
!!! <param name="low">A numeric constant, variable, or expression for the lower boundary of the range.</param>
!!! <param name="high">A numeric constant, variable, or expression for the upper boundary of the range</param>
!!! <returns>A random LONG integer between the low and high values, inclusively</returns>  
cRandom PROCEDURE(LONG low, LONG high),LONG,EXPORT
  END
  PRAGMA('compile(cRandom.clw)')
