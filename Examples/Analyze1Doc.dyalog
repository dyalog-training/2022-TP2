 r←Analyze1Doc x;z
 HttpCommand.LDRC←#.DRC ⍝ Conga already loaded and initialised
 z←HttpCommand.Get x
 (⍕z)⎕SIGNAL(z.rc≠0)/11
 r←x({⍵[⍒⍵[;2];]}{⍺,≢⍵}⌸⎕A∩⍨1 ⎕C z.Data)
