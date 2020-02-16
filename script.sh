#!bin/sh
for i in `seq -w 1 1 111`
do
  mkdir $i
  cd $i
  mv ../supercell-00$i.in .
  cp ../input .
  cat input supercell-00$i.in > Si.in
  rm input supercell-00$i.in
  cd ../
done
~         
