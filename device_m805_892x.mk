# edit 1maart:
# Inherit device configuration for TCC892x.
#$(call inherit-product, device/YG/m805_892x/full_m805_892x.mk)

# device_xxxxx.mk - specifies the properties and extras to copy over into the final output, in this case, it could be for example, device_m805_892x.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, device/YG/m805_892x/m805_892x-vendor.mk)

#DEVICE_PACKAGE_OVERLAYS += device/YG/m805_892x/overlay

#bijna
# This device is xhdpi. However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
# testen met diverse layout?
#PRODUCT_AAPT_CONFIG := normal mdpi hdpi
#PRODUCT_AAPT_PREF_CONFIG := mdpi

#werkte niet
#PRODUCT_AAPT_CONFIG := normal mdpi mdpi
#PRODUCT_AAPT_PREF_CONFIG := mdpi

#werkte niet.
# This device is hdpi is test.
#PRODUCT_AAPT_CONFIG := normal hdpi
#PRODUCT_AAPT_PREF_CONFIG := hdpi
#PRODUCT_LOCALES += hdpi

#werkte niet
# use high-density artwork where available
#PRODUCT_LOCALES += hdpi

#werkte niet 31 dec4:
#PRODUCT_AAPT_CONFIG := normal mdpi hdpi
#PRODUCT_AAPT_PREF_CONFIG := mdpi
#PRODUCT_LOCALES += hdpi

# bijna perfect over een.
# make fallback to mdpi possible
# e.g. for maintaining crisp assets on 160dpi
#PRODUCT_AAPT_CONFIG := normal hdpi mdpi
#PRODUCT_AAPT_PREF_CONFIG := hdpi mdpi

#test 2jan: zo goed als goed. Bijna perfect!
#PRODUCT_AAPT_CONFIG := large hdpi mdpi
#PRODUCT_AAPT_PREF_CONFIG := hdpi mdpi

#gaf de juiste samen stelling. werkte nog niet op tablet.
#PRODUCT_LOCALES += hdpi mdpi

#10jan
# uses high-density artwork where available
#PRODUCT_AAPT_CONFIG := large hdpi mdpi
#PRODUCT_AAPT_PREF_CONFIG := hdpi mdpi
#PRODUCT_LOCALES += hdpi mdpi

#12jan
# Galaxy Tab uses high-density artwork where available
#PRODUCT_LOCALES += hdpi

#12jan
# Screen size is "large" 7'tablet, density is "hdpi"
#PRODUCT_AAPT_CONFIG := large hdpi

#13jan werkt?
# Screen size is "large" 7'tablet, density is "hdpi"
#PRODUCT_AAPT_CONFIG := large hdpi
#PRODUCT_AAPT_PREF_CONFIG := hdpi

# This device is hdpi 16 jan
#PRODUCT_AAPT_CONFIG := normal hdpi
#PRODUCT_AAPT_PREF_CONFIG := hdpi
#PRODUCT_LOCALES += hdpi

# Test 16jan2.. niet helemaal goed nog. xlage etc. missen.
#PRODUCT_AAPT_CONFIG := normal mdpi hdpi
#PRODUCT_AAPT_PREF_CONFIG := hdpi

# Test 18jan2.. Gaf precies juiste aantal mappen. Bijna goed.
# bleek overlay te gebruiken helaas.
#PRODUCT_AAPT_CONFIG :=  mdpi hdpi xhdpi
#PRODUCT_AAPT_PREF_CONFIG := hdpi

# Test 20jan.. Gaf precies juiste aantal mappen. Bijna goed.
#PRODUCT_AAPT_CONFIG :=  normal mdpi hdpi xhdpi
#PRODUCT_AAPT_PREF_CONFIG := mdpi hdpi
#PRODUCT_LOCALES += nl_NL

#test 23 jan?
#PRODUCT_AAPT_CONFIG :=  normal mdpi hdpi xhdpi
#PRODUCT_AAPT_PREF_CONFIG := mdpi hdpi xhdpi
#PRODUCT_LOCALES += nl_NL

#PRODUCT_AAPT_CONFIG :=  normal large mdpi hdpi xhdpi
#PRODUCT_AAPT_PREF_CONFIG := mdpi hdpi xhdpi
#PRODUCT_LOCALES += nl_NL

#test 29jan
PRODUCT_AAPT_CONFIG :=  normal mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi xhdpi
PRODUCT_LOCALES += nl_NL

#nieuw:
# Include extra dictionaries for LatinIME
#PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/dictionaries

PRODUCT_COPY_FILES += \
device/YG/m805_892x/recovery/init.m805_892x.rc:root/init.m805_892x.rc \
device/YG/m805_892x/recovery/init:root/init

PRODUCT_COPY_FILES += \
device/YG/m805_892x/lib/modules/ehci-hcd.ko:recovery/root/lib/modules/ehci-hcd.ko \
device/YG/m805_892x/lib/modules/ohci-hcd.ko:recovery/root/lib/modules/ohci-hcd.ko \
device/YG/m805_892x/lib/modules/tcc_mtd.ko:recovery/root/lib/modules/tcc_mtd.ko \
device/YG/m805_892x/lib/modules/tcc_nand.ko:recovery/root/lib/modules/tcc_nand.ko \
device/YG/m805_892x/lib/modules/tcc_ndd.ko:recovery/root/lib/modules/tcc_ndd.ko \
device/YG/m805_892x/lib/modules/ufsd.ko:recovery/root/lib/modules/ufsd.ko \
device/YG/m805_892x/recovery/init.m805_892x.rc:recovery/root/init.m805_892x.rc \
device/YG/m805_892x/recovery/ueventd.m805_892x.rc:recovery/root/ueventd.m805_892x.rc

PRODUCT_COPY_FILES += \
device/YG/m805_892x/prebuild/su:system/bin/su

PRODUCT_COPY_FILES += \
frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
frameworks/native/data/etc/platform.xml:system/etc/permissions/platform.xml \
packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_CHARACTERISTICS := tablet,sdcard

#nieuw hier onder:
PRODUCT_PROPERTY_OVERRIDES += \
ro.product.locale.language=nl \
ro.product.locale.region=NL \
ro.system.hdmi_max_resolution=fullhd \
ro.system.hdmi_active=true \
ro.system.composite_active=true \
persist.sys.composite_resize=3 \
ro.system.component_active=false \
tcc.output.component_mode=0 \
ro.system.hdmi_portable=true \
ro.opengles.version=131072 \
persist.sys.timezone=Europe/Amsterdam \
tcc.hdmi.720p.fixed=0 \
tcc.video.call.enable=0 \
tcc.only.play.mode=1 \
tcc.show.video.fps=0 \
tcc.hwc.disable=0 \
dalvik.vm.dexopt-flags=m=y \
dalvik.vm.dexopt-data-only=1 \
ro.sf.lcd_density=240
#sensor.accelerometer.flip_xy=1 \
#sensor.accelerometer.invert_x=1
#sensor.accelerometer.invert_x=1
##sensor.accelerometer.invert_y=1
#sensor.accelerometer.invert_z=1
#input.hwrotation=90

# Accelerometer hacks werkte niet
#PRODUCT_PROPERTY_OVERRIDES += \
#accelerometer.flip_xy=1 \
#accelerometer.invert_x=1 \
#accelerometer.invert_z=1

# Accelerometer hacks
#PRODUCT_PROPERTY_OVERRIDES += \
#sensor.accelerometer.flip_xy=1 \
#sensor.accelerometer.invert_x=1 \
#sensor.accelerometer.invert_z=1 \
#input.hwrotation=90

# Accelerometer hacks
PRODUCT_PROPERTY_OVERRIDES += \
    accelerometer.flip_xy=1 \
    accelerometer.invert_x=1

#Nieuw for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
system/extras/bugmailer/send_bug:system/bin/send_bug
endif

LOCAL_PATH := device/YG/m805_892x
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

#hier onder al in ander bestand. Weg halen?
-include vendor/cm/config/common_full_tablet_wifionly.mk

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_m805_892x
PRODUCT_DEVICE := m805_892x
#PRODUCT_MANUFACTURER := YG
