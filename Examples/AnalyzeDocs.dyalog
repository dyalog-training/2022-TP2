 r←AnalyzeDocs;z;docs;ai3;DS1;DS2;iss;each;eachX12;eachX24

 z←HttpCommand.Get'https://www.dyalog.com/documentation_182.htm'
 (⍕z)⎕SIGNAL(z.rc≠0)/11
 docs←∪6↓¨¯1↓¨('href=".+.pdf"'⎕S'\0')z.Data

 ai3←⎕AI[3]
 DS1←Analyze1Doc¨docs
 'Each:      '(each←0.001×⎕AI[3]-ai3)

 z←isolate.Config'processors' 12
 z←isolate.Reset 0

 iss←ø¨12⍴⊂''
 z←iss.{≢⎕FIX ⍵}⊂⎕SRC HttpCommand

 ai3←⎕AI[3]
 DS2←(Analyze1Doc ll.EachX iss)docs
 'EachX (12): '(eachX12←0.001×⎕AI[3]-ai3)

 z←isolate.Config'processors' 24
 z←isolate.Reset 0

 iss←ø¨24⍴⊂''
 z←iss.{≢⎕FIX ⍵}⊂⎕SRC HttpCommand

 ai3←⎕AI[3]
 DS2←(Analyze1Doc ll.EachX iss)docs
 'EachX (24): '(eachX24←0.001×⎕AI[3]-ai3)

 'Verify result: ',≡/{⍵[⍋⍵]}¨DS1 DS2

 'Speedups:'
 'EachX(12) ',7 1⍕each÷eachX12
 'EachX(24) ',7 1⍕each÷eachX24
⍝∇⍣§c:\devt\2022-SP2\Examples.dyalog§0§ 2022 10 12 12 31 2 463 §cOøYh§0
