#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE=liquid

mkdir -p ../../../vendor/acer/$DEVICE/proprietary

adb pull /system/lib/egl/libEGL_adreno200.so ../../../vendor/acer/$DEVICE/proprietary/lib/egl/
adb pull /system/lib/egl/libGLESv1_CM_adreno200.so ../../../vendor/acer/$DEVICE/proprietary/lib/egl/
adb pull /system/lib/egl/libGLESv2_adreno200.so ../../../vendor/acer/$DEVICE/proprietary/lib/egl/
adb pull /system/lib/egl/libq3dtools_adreno200.so ../../../vendor/acer/$DEVICE/proprietary/lib/egl/
adb pull /system/lib/libgsl.so ../../../vendor/acer/$DEVICE/proprietary/lib/
adb pull /system/lib/libgps.so ../../../vendor/acer/$DEVICE/proprietary/lib/
adb pull /system/lib/libcamera.so ../../../vendor/acer/$DEVICE/proprietary/lib/
adb pull /system/lib/liboemcamera.so ../../../vendor/acer/$DEVICE/proprietary/lib/
adb pull /system/lib/libloc.so ../../../vendor/acer/$DEVICE/proprietary/lib/
adb pull /system/lib/libloc-rpc.so ../../../vendor/acer/$DEVICE/proprietary/lib/
adb pull /system/lib/libloc_api.so ../../../vendor/acer/$DEVICE/proprietary/lib/
adb pull /system/lib/libcommondefs.so ../../../vendor/acer/$DEVICE/proprietary/lib/
adb pull /system/lib/libril-acer-1.so ../../../vendor/acer/$DEVICE/proprietary/lib/
adb pull /system/lib/libril-acerril-hook-oem.so ../../../vendor/acer/$DEVICE/proprietary/lib/
adb pull /system/etc/firmware/BCM4325.hcd ../../../vendor/acer/$DEVICE/proprietary/etc/firmware/
adb pull /system/etc/firmware/BCM4325.bin ../../../vendor/acer/$DEVICE/proprietary/etc/firmware/
adb pull /system/etc/firmware/BCM4325_apsta.bin ../../../vendor/acer/$DEVICE/proprietary/etc/firmware/
adb pull /system/etc/wifi/nvram.txt ../../../vendor/acer/$DEVICE/proprietary/etc/firmware/
adb pull /system/etc/wifi/wpa_supplicant.conf ../../../vendor/acer/$DEVICE/proprietary/etc/firmware/
adb pull /system/lib/hw/sensors.salsa.so ../../../vendor/acer/$DEVICE/proprietary/lib/hw/
adb pull /system/bin/sensorcalibutil_yamaha ../../../vendor/acer/$DEVICE/proprietary/bin/
adb pull /system/bin/sensorserver_yamaha ../../../vendor/acer/$DEVICE/proprietary/bin/
adb pull /system/bin/sensorstatutil_yamaha ../../../vendor/acer/$DEVICE/proprietary/bin/
adb pull /system/bin/vold ../../../vendor/acer/$DEVICE/proprietary/bin/
adb pull /system/etc/vold.fstab ../../../vendor/acer/$DEVICE/proprietary/etc/
adb pull /system/bin/vold.conf ../../../vendor/acer/$DEVICE/proprietary/etc/
adb pull /data/system/ms3c_yamaha.cfg ../../../vendor/acer/$DEVICE/proprietary/data/system/

./setup-makefiles.sh
