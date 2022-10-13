 r←AnalyzeDocs;z;docs;ai3;iss;each;eachX12;eachX24;DSeach;DSthreads;DSeachX

 z←HttpCommand.Get'https://www.dyalog.com/documentation_182.htm'
 (⍕z)⎕SIGNAL(z.rc≠0)/11
 docs←∪6↓¨¯1↓¨('href=".+.pdf"'⎕S'\0')z.Data

 ai3←⎕AI[3]
 DSeach←Analyze1Doc¨docs
 'Each:      '(each←0.001×⎕AI[3]-ai3)

 ai3←⎕AI[3]
 DSthreads←⎕TSYNC Analyze1Doc&¨docs
 'Threads:   '(each←0.001×⎕AI[3]-ai3)

 z←isolate.Config'processors' 12
 z←isolate.Reset 0

 iss←ø¨12⍴⊂''
 z←iss.{≢⎕FIX ⍵}⊂⎕SRC HttpCommand

 ai3←⎕AI[3]
 DSeachX←(Analyze1Doc ll.EachX iss)docs
 'EachX (12): '(eachX12←0.001×⎕AI[3]-ai3)

 z←isolate.Config'processors' 24
 z←isolate.Reset 0

 iss←ø¨24⍴⊂''
 z←iss.{≢⎕FIX ⍵}⊂⎕SRC HttpCommand

 ai3←⎕AI[3]
 DS2←(Analyze1Doc ll.EachX iss)docs
 'EachX (24): '(eachX24←0.001×⎕AI[3]-ai3)

 'Verify result: ',2≡/{⍵[⍋⍵]}¨DSeach DSthreads DSeachX

 'Speedups:'
 'EachX(12) ',7 1⍕each÷eachX12
 'EachX(24) ',7 1⍕each÷eachX24
