#!/system/bin/sh

BLUETOOTH_SLEEP_PATH=/proc/bluetooth/sleep/proto
LOG_TAG="qcom-bluetooth"
LOG_NAME="${0}:"

hciattach_pid=""

loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

failed ()
{
  loge "$1: exit code $2"
  exit $2
}

start_hciattach ()
{
  echo 1 > $BLUETOOTH_SLEEP_PATH
  /system/bin/hciattach -n $QSOC_DEVICE $QSOC_TYPE $QSOC_BAUD flow &
  hciattach_pid=$!
  logi "start_hciattach: pid = $hciattach_pid"
}

kill_hciattach ()
{
  logi "kill_hciattach: pid = $hciattach_pid"
  ## careful not to kill zero or null!
  kill -TERM $hciattach_pid
  echo 0 > $BLUETOOTH_SLEEP_PATH
  # this shell doesn't exit now -- wait returns for normal exit
}

# mimic hciattach options parsing -- maybe a waste of effort
USAGE="hciattach [-n] [-p] [-b] [-t timeout] [-s initial_speed] <tty> <type | id> [speed] [flow|noflow] [bdaddr]"

while getopts "blnpt:s:" f
do
  case $f in
  b | l | n | p)  opt_flags="$opt_flags -$f" ;;
  t)      timeout=$OPTARG;;
  s)      initial_speed=$OPTARG;;
  \?)     echo $USAGE; exit 1;;
  esac
done
shift $(($OPTIND-1))

QSOC_DEVICE=${1:-"/dev/ttyHS1"}
QSOC_TYPE=${2:-"any"}
QSOC_BAUD=${3:-"3500000"}


# init does SIGTERM on ctl.stop for service
trap "kill_hciattach" TERM INT

start_hciattach

wait $hciattach_pid

logi "Bluetooth stopped"

exit 0
