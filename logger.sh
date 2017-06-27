LOG_SIZE="${LOG_SIZE:-10000000}"
NUM_SEGM="${NUM_SEGM=-2}"
while getopts "s:n:" opt; do
  case "$opt" in
    s)
      LOG_SIZE=$OPTARG
      ;;
    n)
      NUM_SEGM=$OPTARG
      ;;
  esac
done
shift $((OPTIND-1))
if [ $# == 0 -o -z "$1" ]; then
    echo "missing output file argument"
    exit 1
fi
OUT_FILE=$1
shift
NUM=1
while :; do
    dd bs=10 count=$(($LOG_SIZE/10)) >> $OUT_FILE 2>/dev/null
    SZ=`stat -c%s $OUT_FILE`
    if [ $SZ -eq 0 ]; then
        rm $OUT_FILE
        break
    fi
    echo -e "\nLog portion finished" >> $OUT_FILE
    mv $OUT_FILE $OUT_FILE.n$NUM
    NUM=$(($NUM + 1))
    [ $NUM -gt $NUM_SEGM ] && NUM=1
done
