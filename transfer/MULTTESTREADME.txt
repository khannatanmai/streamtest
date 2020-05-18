Tanmais-MacBook-Pro:transfer khannatanmai$ lt-proc -b ../../apertium-eng-spa/spa-eng.autobil.bin < spa-eng-mult-test.txt 
^momento# de genialidad<n><m>/stroke# of genius<n>$
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^momento# de genialidad<n><m>/stroke# of genius<n>$" | apertium-transfer -b apertium-eng-spa.spa-eng.t1x spa-eng.t1x.bin
Error: can't stat file 'spa-eng.t1x.bin'.
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^momento# de genialidad<n><m>/stroke# of genius<n>$" | apertium-transfer -b ../../apertium-eng-spa.spa-eng.t1x ../../spa-eng.t1x.bin
Error: can't stat file '../../spa-eng.t1x.bin'.
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^momento# de genialidad<n><m>/stroke# of genius<n>$" | apertium-transfer -b ../../apertium-eng-spa/apertium-eng-spa.spa-eng.t1x ../../apertium-eng-spa/spa-eng.t1x.bin
^Nom<SN><m>{^stroke<n># of genius$}$
Tanmais-MacBook-Pro:transfer khannatanmai$ vim MULT-test.txt
Tanmais-MacBook-Pro:transfer khannatanmai$ apertium-transfer -b ../../apertium-eng-spa/apertium-eng-spa.spa-eng.t1x ../../apertium-eng-spa/spa-eng.t1x.bin < MULT-test.txt 
^Nom<SN><m>{}$^default<default>{^stroke# of genius<n><sf:4#$}$
Tanmais-MacBook-Pro:transfer khannatanmai$ vim MULT-test.txt
Tanmais-MacBook-Pro:transfer khannatanmai$ vim MULT-test.txt
Tanmais-MacBook-Pro:transfer khannatanmai$ apertium-transfer -b ../../apertium-eng-spa/apertium-eng-spa.spa-eng.t1x ../../apertium-eng-spa/spa-eng.t1x.bin < MULT-test.txt 
^Nom<SN><m>{^stroke<n># of genius<sf:4#sabasa><id:2#:>$}$
Tanmais-MacBook-Pro:transfer khannatanmai$ apertium-transfer -b ../../apertium-eng-spa/apertium-eng-spa.spa-eng.t1x ../../apertium-eng-spa/spa-eng.t1x.bin < MULT-test.txt | apertium-interchunk ../../apertium-eng-spa/apertium-eng-spa.spa-eng.t2x ../../apertium-eng-spa/spa-eng.t2x.bin | apertium-postchunk ../../apertium-eng-spa/apertium-eng-spa.spa-eng.t3x ../../apertium-eng-spa/spa-eng.t3x.bin
^Stroke<n># of genius<sf:4#sabasa><id:2#:>$
Tanmais-MacBook-Pro:transfer khannatanmai$ 



lt-proc (no mod)
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg># of genius<sf:4#sabasa><id:2#:>$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
#Stroke
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg># of genius$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
Stroke of genius
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg><sf:4#sabasa><id:2#:># of genius$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
#Stroke
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg># of genius$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
Stroke of genius
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg><sf:4#sabasa><id:2#:># of genius$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
#Stroke
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg><sf:4#sabasa><id:2#:># of genius$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
#Stroke
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg># of genius<sf:4#sabasa><id:2#:>$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
#Stroke

lt-proc(after modification)-> #,$ needs to be escaped

Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg># of genius$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
Stroke of genius
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg># of genius<sf:4#sabasa><id:2#:>$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
#Stroke
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg><sf:4#sabasa><id:2#:># of genius$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
#Stroke
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg><sf:sabasa><id:2># of genius$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
Stroke of genius
Tanmais-MacBook-Pro:transfer khannatanmai$ echo "^Stroke<n><sg><sf:4\#sabasa><id:2\#:># of genius$" | lt-proc -g ../../apertium-eng-spa/spa-eng.autogen.bin
Stroke of genius
Tanmais-MacBook-Pro:transfer khannatanmai$ 


TODO
NEED to test case where variable has lemq, and its output in the LU
Also need to fix MLU sectags
