#!/system/bin/sh

value=`getprop persist.maxcpukhz`
case "$value" in
    *)
        echo $value > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        ;;
esac

echo 90 > /sys/devices/system/cpu/cpu0/cpufreq/ondemand/up_threshold
echo 30 > /sys/devices/system/cpu/cpu0/cpufreq/ondemand/down_differential
echo 500000 > /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate

insmod /system/lib/modules/tun.ko
