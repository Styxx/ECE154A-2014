Method for isolating most significnant one: http://imgur.com/7sj4HUz
Original method for ummu: http://imgur.com/a/oHbLk


Project 2.1.s is the most recent update of part d
  It runs, but it seems to get stuck in an infinite loop somewhere within ummu.
  It does not output. Nor does it put the correct value in register meant to return the value ($t6) unless it is in the trivial case of the exponent being 0.
  It does not go through all test cases. It currently only samples one test case before "ending."

Other ummu.s is the part c code that has been adapted by Mason Levy from internet slides.
  It is fully functional and works. However, it may not be according to the specs given in the project description, since it was not adapted from shamu (Ex. 11.4 in the Textbook). It also is not in MicroMIPS.

ummu.s is the part c code that has said to work by some, but not by others.
  It is adapted from shamu; however its functionality is questionable.
  
  
