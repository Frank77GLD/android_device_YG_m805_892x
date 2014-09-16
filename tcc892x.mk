#DEVICE_PACKAGE_OVERLAYS += device/YG/m805_892x/overlay


LOCAL_PATH := device/YG/m805_892x
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#Nog over nemen van device.*.mk
#PRODUCT_COPY_FILES += \
#    device/telechips/tcc8902/init.rc:root/init.rc

#PRODUCT_COPY_FILES += \
#    device/telechips/tcc8902/etc/vold.fstab:system/etc/vold.fstab \
#    device/telechips/tcc8902/modules/mali.ko:system/lib/modules/mali.ko

#PRODUCT_COPY_FILES += \
#    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.sys.use_dithering=0 \
#    persist.sys.use_16bpp_alpha=1
