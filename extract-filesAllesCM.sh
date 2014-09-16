#!/bin/sh
# like this one: https://github.com/Asure/android_device_telechips_tcc8902/blob/master/extract-files.sh
## This file will make 1 output files: device_$DEVICE-vendor-blobs.mk
# last it will start: ./setup-makefiles.sh
adb wait-for-devices
DEVICE=m805_892x
MANUFACTURER=YG

# mkdir -p ../../../device/$MANUFACTURER/$DEVICE/proprietary

BASE=../../../device/$MANUFACTURER/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' proprietary-filesAllesCM`; do
DIR=`dirname $FILE`
  if [ ! -d $BASE/$DIR ]; then
mkdir -p $BASE/$DIR
  fi
adb pull /system/$FILE $BASE/$FILE
done

# Note: akmd is needed for rotation/g-sensor, maybe needed for M701 later on
#adb pull /system/bin/akmd ../../../device/telechips/$DEVICE/proprietary/akmd
# Note: No working bluetooth found in any kernel so far. High hopes unfounded?
#adb pull /system/bin/bluetoothd ../../../device/telechips/$DEVICE/proprietary/bluetoothd
# adb pull /system/lib/libcamera.so ../../../device/telechips/$DEVICE/proprietary/libcamera.so

chmod 755 ../../../device/$MANUFACTURER/$DEVICE/proprietary/*

# What is listed ad PRODUCT_COPY_FILES := \\ those no need listing in: PRODUCT_COPY_FILES += \\
# werking uitzoeken.
(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../device/$MANUFACTURER/$DEVICE/device_$DEVICE-vendor-blobs.mk

PRODUCT_COPY_FILES := \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libril.so:obj/lib/libril.so
#$OUTDIR/proprietary/lib/libril.so:obj/lib/libril.so

PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/key_921600.psr:root/key_921600.psr \\
device/__MANUFACTURER__/__DEVICE__/proprietary/key_3000000.psr:root/key_3000000.psr \\
device/__MANUFACTURER__/__DEVICE__/proprietary/ts.conf:root/ts.conf

PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/app/A777_FactoryTest.apk:system/app/A777_FactoryTest.apk \\
device/__MANUFACTURER__/__DEVICE__/proprietary/app/Vending.apk:system/app/Vending.apk

#Executable files
#bin/
PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/bugmailer.sh:system/bin/bugmailer.sh \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/chkntfs:system/bin/chkntfs \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/flash_eraseall:system/bin/flash_eraseall \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/hostapd:system/bin/hostapd \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/hostapd_cli:system/bin/hostapd_cli \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/hostapd_wps:system/bin/hostapd_wps \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/iwconfig:system/bin/iwconfig \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/iwlist:system/bin/iwlist \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/make_ext4fs:system/bin/make_ext4fs \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/mem:system/bin/mem \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/mkntfs:system/bin/mkntfs \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/netd:system/bin/netd \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/rild:system/bin/rild \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/send_bug:system/bin/send_bug \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/setup_fs:system/bin/setup_fs \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/tc:system/bin/tc \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/vold:system/bin/vold \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/wpa_cli:system/bin/wpa_cli \\
device/__MANUFACTURER__/__DEVICE__/proprietary/bin/wpa_supplicant:system/bin/wpa_supplicant

PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/apns-conf.xml:system/etc/apns-conf.xml \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/dhcpcd.conf:system/etc/dhcpcd.conf \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/media_profiles.xml:system/etc/media_profiles.xml \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/vold.fstab:system/etc/vold.fstab \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf

# Pull permissions
#device/__MANUFACTURER__/__DEVICE__/proprietary/etc/permissions/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \\ vanuit CM
PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/permissions/features.xml:system/etc/permissions/features.xml \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/permissions/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/ppp/chap-secrets:system/etc/ppp/chap-secrets \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/ppp/gprs-connect-chat:system/etc/ppp/gprs-connect-chat \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/ppp/init.gprs-pppd:system/etc/ppp/init.gprs-pppd \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/ppp/ip-down:system/etc/ppp/ip-down \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/ppp/ip-up:system/etc/ppp/ip-up \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/ril/ril.xml:system/etc/ril/ril.xml

PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \\
device/__MANUFACTURER__/__DEVICE__/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

#fonts:
PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/fonts/DroidSansFallback_DxB.ttf:system/fonts/DroidSansFallback_DxB.ttf

#framework/
PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/framework/com.android.future.usb.accessory.jar:system/framework/com.android.future.usb.accessory.jar \\
device/__MANUFACTURER__/__DEVICE__/proprietary/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \\
device/__MANUFACTURER__/__DEVICE__/proprietary/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \\
device/__MANUFACTURER__/__DEVICE__/proprietary/framework/send_bug.jar:system/framework/send_bug.jar

#lib/
PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libandroid_runtime.so:system/bin/libandroid_runtime.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libandroid_servers.so:system/bin/libandroid_servers.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libaudioutils.so:system/bin/libaudioutils.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libc.so:system/bin/libc.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdvm.so:system/bin/libdvm.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextenddisplay.so:system/lib/libextenddisplay.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libhardware_legacy.so:system/lib/libhardware_legacy.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libhdmi.so:system/lib/libhdmi.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libhwui.so:system/lib/libhwui.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libjni_googlepinyinime_4.so:system/lib/libjni_googlepinyinime_4.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libjni_googlepinyinime_latinime_4.so:system/lib/libjni_googlepinyinime_latinime_4.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmedia.so:system/lib/libmedia.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmedia_jni.so:system/lib/libmedia_jni.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libext4_utils.so:system/lib/libext4_utils.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmediaplayerservice.so:system/lib/libmediaplayerservice.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libhardware.so:system/lib/libhardware.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtdutils1.so:system/lib/libmtdutils1.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libnvomxadaptor.so:system/lib/libnvomxadaptor.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.aacdec.so:system/lib/libOMX.TCC.aacdec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.aacenc.so:system/lib/libOMX.TCC.aacenc.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.apedec.so:system/lib/libOMX.TCC.apedec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.audio.so:system/lib/libOMX.TCC.audio.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.base.so:system/lib/libOMX.TCC.base.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.flacdec.so:system/lib/libOMX.TCC.flacdec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.Google.vpxdec.so:system/lib/libOMX.TCC.Google.vpxdec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.mp2dec.so:system/lib/libOMX.TCC.mp2dec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.mp3dec.so:system/lib/libOMX.TCC.mp3dec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.mp3enc.so:system/lib/libOMX.TCC.mp3enc.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.pcmdec.so:system/lib/libOMX.TCC.pcmdec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.radec.so:system/bin/libOMX.TCC.radec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.spdif.so:system/lib/libOMX.TCC.spdif.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.VideoDec.so:system/lib/libOMX.TCC.VideoDec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.VideoEnc.so:system/lib/libOMX.TCC.VideoEnc.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.vorbisdec.so:system/lib/libOMX.TCC.vorbisdec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.VPUDec.so:system/lib/libOMX.TCC.VPUDec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.VPUEnc.so:system/lib/libOMX.TCC.VPUEnc.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOMX.TCC.wmadec.so:system/lib/libOMX.TCC.wmadec.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libpmap.so:system/lib/libpmap.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libskia.so:system/lib/libskia.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libTCC_ASF_DMX.so:system/lib/libTCC_ASF_DMX.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libTCC_CDK_CONFIG.so:system/lib/libTCC_CDK_CONFIG.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libTCC_Decoder.so:system/lib/libTCC_Decoder.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libTCC_Encoder.so:system/lib/libTCC_Encoder.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libtcc-evdo-ril.so:system/lib/libtcc-evdo-ril.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libTCC_OMXCore.so:system/lib/libTCC_OMXCore.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libTCC_RM_DMX.so:system/lib/libTCC_RM_DMX.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libtcc-wcdma-ril.so:system/lib/libtcc-wcdma-ril.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libtinyalsa.so:system/lib/libtinyalsa.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libttspico.so:system/lib/libttspico.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libutils.so:system/lib/libutils.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libvideochat_jni.so:system/lib/libvideochat_jni.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libvideochat_stabilize.so:system/lib/libvideochat_stabilize.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libvideoeditor_jni.so:system/lib/libvideoeditor_jni.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libvideoeditorplayer.so:system/lib/libvideoeditorplayer.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libvoicesearch.so:system/lib/libvoicesearch.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libstagefright.so:system/lib/libstagefright.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libsurfaceflinger.so:system/lib/libsurfaceflinger.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libwebcore.so:system/lib/libwebcore.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/libwnndict.so:system/lib/libwnndict.so

#lib/egl/
PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg

#lib/hw/
PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/hw/audio.primary.tcc892x.so:system/lib/hw/audio.primary.tcc892x.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/hw/camera.tcc892x.so:system/lib/hw/camera.tcc892x.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/hw/gps.tcc892x.so:system/lib/hw/gps.tcc892x.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/hw/lights.tcc892x.so:system/lib/hw/lights.tcc892x.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/hw/sensors.tcc892x.so:system/lib/hw/sensors.tcc892x.so

#lib/modules/
PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/modules/vpu_decoder.ko:system/lib/modules/vpu_decoder.ko \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/modules/vpu_decoder_ext.ko:system/lib/modules/vpu_decoder_ext.ko \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/modules/vpu_encoder.ko:system/lib/modules/vpu_encoder.ko \\
device/__MANUFACTURER__/__DEVICE__/proprietary/lib/modules/vpu_manager.ko:system/lib/modules/vpu_manager.ko
PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/libMali.so:system/vendor/lib/libMali.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/libstagefrighthw.so:system/vendor/lib/libstagefrighthw.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/libTCC_CDK_AUDIO.so:system/vendor/lib/libTCC_CDK_AUDIO.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/libTCC_CDK_LIB.so:system/vendor/lib/libTCC_CDK_LIB.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/libTCC_CDK_WRAPPER.so:system/vendor/lib/libTCC_CDK_WRAPPER.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/libTCCInterSubtitle.so:system/vendor/lib/libTCCInterSubtitle.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/libTCCsubtitle.so:system/vendor/lib/libTCCsubtitle.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/libUMP.so:system/vendor/lib/libUMP.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/egl/libEGL_mali.so:system/vendor/lib/libEGL_mali.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/egl/libGLESv1_CM_mali.so:system/vendor/lib/egl/libGLESv1_CM_mali.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/egl/libGLESv2_mali.so:system/vendor/lib/egl/libGLESv2_mali.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/hw/gralloc.tcc892x.so:system/vendor/lib/hw/gralloc.tcc892x.so \\
device/__MANUFACTURER__/__DEVICE__/proprietary/vendor/lib/hw/hwcomposer.tcc892x.so:system/vendor/lib/hw/hwcomposer.tcc892x.so

#usr/idc/
PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/usr/idc/ak4187-TouchScreen.idc:system/usr/idc/ak4187-TouchScreen.idc \\
device/__MANUFACTURER__/__DEVICE__/proprietary/usr/idc/Goodix-TouchScreen.idc:system/usr/idc/Goodix-TouchScreen.idc \\
device/__MANUFACTURER__/__DEVICE__/proprietary/usr/idc/tcc-ts.idc:system/usr/idc/tcc-ts.idc \\
device/__MANUFACTURER__/__DEVICE__/proprietary/usr/idc/tcc-ts-goodix-cap.idc:system/usr/idc/tcc-ts-goodix-cap.idc \\
device/__MANUFACTURER__/__DEVICE__/proprietary/usr/idc/tcc-ts-sitronix.idc:system/usr/idc/tcc-ts-sitronix.idc

#wifi:
PRODUCT_COPY_FILES += \\
device/__MANUFACTURER__/__DEVICE__/proprietary/wifi/wlan.ko:system/wifi/wlan.ko
EOF

./setup-makefilesAllesCM.sh
