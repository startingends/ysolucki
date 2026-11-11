#!/bin/bash
cd /home/user/ysolucki/rh/specialists/operator/two_zero
M=/home/user/ysolucki/tools/memcap.py
export OMP_NUM_THREADS=2
for spec in "9/25 40" "19/50 40" "2/5 40" "9/20 40" "14/25 44" "29/50 44" "3/5 44" "13/20 50" "7/10 56" "81/100 64" "83/100 64" "17/20 66" "9/10 70"; do
  set -- $spec; timeout 900 python3 $M 1 python3 dumpQDmp.py.txt zeta $1 $2 40 400 > /dev/null 2>&1; echo "dumped $1"
done
