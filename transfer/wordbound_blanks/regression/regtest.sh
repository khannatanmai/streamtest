#!/bin/sh

PREFIX=/Users/khannatanmai/Documents/GSoC/repo/main
language_pairs_single=(spa-cat)
language_pairs_multi=(eng-spa)

#xxx-yyy-transfer_input_original.txt -> input to transfer without secondary tags
#xxx-yyy-transfer_input_new.txt -> input to transfer without secondary tags
#xxx-yyy-transfer_output_original.txt -> output of transfer without any modification and input is without secondary tags
#xxx-yyy-transfer_output_new.txt -> ideal output of transfer with secondary tags

echo "This test uses apertium-transfer output as of 4 July 2020\n"
echo "Regression transfer tests for language pairs: "${language_pairs_single[@]} ${language_pairs_multi[@]}

for i in ${language_pairs_single[@]}
do
  apertium-preprocess-transfer $PREFIX/apertium-$i/apertium-$i.$i.t1x $PREFIX/apertium-$i/$i.t1x.bin
  
  apertium -d $PREFIX/apertium-$i $i < donquixote_spa.txt > donquixote_modified_$i.txt
  apertium-deshtml < apertium_howto_spa.html |  apertium -f none -d $PREFIX/apertium-$i $i | apertium-retxt > apertium_howto_modified_$i.html
  
  echo "\n********\n"
  echo "DIFF WITH REFERENCE"$i"\n"
  diff donquixote_original_$i.txt donquixote_modified_$i.txt
  diff apertium_howto_original_$i.html apertium_howto_modified_$i.html
  echo "\n********\n"
done

for i in ${language_pairs_multi[@]}
do
  apertium-preprocess-transfer $PREFIX/apertium-$i/apertium-$i.$i.t1x $PREFIX/apertium-$i/$i.t1x.bin
  
  apertium -d $PREFIX/apertium-$i $i < mobydick_eng.txt > mobydick_modified_$i.txt
  apertium-deshtml < apertium_howto_eng.html |  apertium -f none -d $PREFIX/apertium-$i $i | apertium-retxt > apertium_howto_modified_$i.html
  
  echo "\n********\n"
  echo "DIFF WITH REFERENCE"$i"\n"
  diff mobydick_original_$i.txt mobydick_modified_$i.txt
  diff apertium_howto_original_$i.html apertium_howto_modified_$i.html
  echo "\n********\n"
done

#cat-ita input:"Apertium és una plataforma de traducció automàtica lliure i oberta"
