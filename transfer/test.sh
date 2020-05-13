#!/bin/sh

PREFIX=/Users/khannatanmai/Documents/GSoC/repo/main
language_pairs=(cat-ita)

#xxx-yyy-transfer_input_original.txt -> input to transfer without secondary tags
#xxx-yyy-transfer_input_new.txt -> input to transfer without secondary tags
#xxx-yyy-transfer_output_original.txt -> output of transfer without any modification and input is without secondary tags
#xxx-yyy-transfer_output_new.txt -> ideal output of transfer with secondary tags

echo "This test uses apertium-transfer output as of 13 May 2020\n"
echo "Transfer tests for language pairs: spa-eng "${language_pairs[@]}

apertium-preprocess-transfer $PREFIX/apertium-eng-spa/apertium-eng-spa.spa-eng.t1x $PREFIX/apertium-eng-spa/spa-eng.t1x.bin

apertium-transfer -b $PREFIX/apertium-eng-spa/apertium-eng-spa.spa-eng.t1x $PREFIX/apertium-eng-spa/spa-eng.t1x.bin < spa-eng-transfer_input_original.txt > spa-eng-original_test.txt

apertium-transfer -b $PREFIX/apertium-eng-spa/apertium-eng-spa.spa-eng.t1x $PREFIX/apertium-eng-spa/spa-eng.t1x.bin < spa-eng-transfer_input_new.txt > spa-eng-new_test.txt

echo "ORIGINAL DIFF SPA-ENG: \n"
diff spa-eng-transfer_output_original.txt spa-eng-original_test.txt
echo "\n********\n"

echo "NEW DIFF SPA-ENG: \n"
diff spa-eng-transfer_output_new.txt spa-eng-new_test.txt
echo "\n********\n"

for i in ${language_pairs[@]}
do
  apertium-preprocess-transfer $PREFIX/apertium-$i/apertium-$i.$i.t1x $PREFIX/apertium-$i/$i.t1x.bin
  
  apertium-transfer -b $PREFIX/apertium-$i/apertium-$i.$i.t1x $PREFIX/apertium-$i/$i.t1x.bin < $i-transfer_input_original.txt > $i-original_test.txt

  apertium-transfer -b $PREFIX/apertium-$i/apertium-$i.$i.t1x $PREFIX/apertium-$i/$i.t1x.bin < $i-transfer_input_new.txt > $i-new_test.txt
  
  echo "ORIGINAL DIFF "$i"\n"
  diff $i-transfer_output_original.txt $i-original_test.txt
  echo "\n********\n"

  echo "NEW DIFF "$i"\n"
  diff $i-transfer_output_new.txt $i-new_test.txt
  echo "\n********\n"
done

#cat-ita input:"Apertium és una plataforma de traducció automàtica lliure i oberta"
