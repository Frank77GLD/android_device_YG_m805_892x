# Product-specific compile-time definitions.
# BoardConfig.mk - This is the meat of it all, this is where compiler conditional flags are set, partition layouts, boot addresses, ramdisk size, and so on.

USE_CAMERA_STUB := true
BOARD_HAVE_FRONT_CAM := true
BOARD_HAVE_BACK_CAM := false
# Disable PIE since it breaks ICS camera blobs
#TARGET_DISABLE_ARM_PIE := true

# Use screencap to capture frame buffer for ddms
#BOARD_USE_SCREENCAP := true
# Include an expanded selection of fonts
#EXTENDED_FONT_FOOTPRINT := true
# Use a smaller subset of system fonts to keep image size lower
#SMALLER_FONT_FOOTPRINT := true
# Skip droiddoc build to save build time
#BOARD_SKIP_ANDROID_DOC_BUILD := true

#nieuw 16 jan:
HOST_JDK_IS_64BIT_VERSION := true

# inherit from the proprietary version
-include device/YG/m805_892x/BoardConfigVendor.mk

#test 29jan
# Sensors
#BOARD_USES_SENSOR_BMA220 :=true
#Zie Kernel config CONFIG_SENSOR_BMA
BOARD_USES_SENSOR_BMA250 :=true
BOARD_USES_LIGHT_SENSOR := false
#BOARD_HAVE_COMPASS := false

#toegevoegt 2014
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_SIMULATOR := false
BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_FAKE_GPS := true
# org: TARGET_BOARD_PLATFORM := unknown
TARGET_BOARD_PLATFORM := tcc892x
TARGET_BOARD_PLATFORM_GPU := ARM-Mali
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
#nieuw hier onder:
TARGET_ARCH_VARIANT_CPU := cortex-a8
#Enable QC's libm optimizations
#TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
#TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
#TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
#TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
#TARGET_BOOTLOADER_BOARD_NAME := m805_892x
#TARGET_BOOTLOADER_BOARD_NAME := m805_892x_evm
#nieuw:
TARGET_BOARD_INFO_FILE := device/YG/m805_892x/board-info.txt
#TARGET_USERIMAGES_USE_EXT4 := true
TARGET_PROVIDES_LIBRIL := device/YG/m805_892x/proprietary/lib/libril.so
#nieuw:
#BOARD_USES_OVERLAY := true

USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/YG/m805_892x/common/egl.cfg
# Support WebGL in WebKit 2014
#ENABLE_WEBGL := true

#fix this up by examining /proc/mtd on a running device
#sample. Place the 0x in front of the ¨size¨
#Tom-Tec 7 excellent.:
#dev: size:    erasersize: name:
#mtd0 00a00000 00100000 ¨boot¨
#mtd1 00500000 00100000 ¨kpanic¨
#mtd2 12c00000 00100000 ¨system¨
#mtd3 00400000 00100000 ¨plash¨
#mtd4 09600000 00100000 ¨cache¨
#mtd5 40000000 00100000 ¨userdata¨
#mtd6 00a00000 00100000 ¨recovery¨
#mtd7 00100000 00100000 ¨misc¨
#mtd8 00100000 00100000 ¨tcc¨
# Here onder in bytes size for use with ext4 partition:
# RECOVERY_FSTAB_VERSION := 2
#TARGET_USERIMAGES_USE_EXT4 := true
#BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 314572800
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
#BOARD_CACHEIMAGE_PARTITION_SIZE := 0x09600000 = bytes?
#BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
# Here under is for tom-tec without using ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x12c00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x40000000
BOARD_FLASH_BLOCK_SIZE := 4096
# Generate descriptive build.id. Als test for now..
#DISPLAY_BUILD_NUMBER := true
#BOARD_VOLD_MAX_PARTITIONS := 16? of 8? cat /proc/emmc
# hier onder is?
#BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
#BOARD_USES_MMCUTILS := true

#test7dec maakt geen verschil.
BOARD_HAVE_WIFI := true
BOARD_USE_WIFI := true

#test zonder 3 dec
#links:https://github.com/naobsd/cm_device_telechips_tcc8902rt/blob/master/BoardConfig.mk
# info in init.m805_892x.rc en?
#WPA_SUPPLICANT_VERSION := VER_0_8_X
#BOARD_WPA_SUPPLICANT_DRIVER := WEXT
#WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
#WIFI_DRIVER_MODULE_PATH := "/system/wifi/wlan.ko"
#WIFI_DRIVER_MODULE_ARG := ""
#WIFI_DRIVER_MODULE_NAME := "wlan"

#Add for wifi
BOARD_WIFI_VENDOR := realtek
#ifeq ($(BOARD_WIFI_VENDOR), realtek)
#WPA_SUPPLICANT_VERSION := VER_0_8_X
#BOARD_WPA_SUPPLICANT_DRIVER := WEXT
#BOARD_WPA_SUPPLICANT_DRIVER := NL80211
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
#BOARD_HOSTAPD_DRIVER := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_rtl
#>BOARD_WLAN_DEVICE := rtl8192cu
#BOARD_WLAN_DEVICE := rtl8192du
#BOARD_WLAN_DEVICE := rtl8192ce
#BOARD_WLAN_DEVICE := rtl8192de
#BOARD_WLAN_DEVICE := rtl8723as
#BOARD_WLAN_DEVICE := rtl8723au
BOARD_WLAN_DEVICE :=rtl871x
#BOARD_WLAN_DEVICE := rtl8188es
#WIFI_DRIVER_MODULE_NAME := wlan
#WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
#WIFI_DRIVER_MODULE_PATH := "/system/wifi/wlan.ko"
#WIFI_DRIVER_MODULE_ARG := ""
#WIFI_FIRMWARE_LOADER := ""
#WIFI_DRIVER_FW_PATH_STA := ""
#WIFI_DRIVER_FW_PATH_AP := ""
#WIFI_DRIVER_FW_PATH_P2P := ""
#WIFI_DRIVER_FW_PATH_PARAM := ""
#endif

WITH_JIT := true
TARGET_HAVE_TSLIB:=true
JS_ENGINE:=v8
ENABLE_JSC_JIT:=true
BUILD_WITH_FULL_STAGEFRIGHT:=true

TARGET_PREBUILT_KERNEL := device/YG/m805_892x/kernel
#TARGET_KERNEL_CONFIG := Tom-Tec_defconfig
#TARGET_KERNEL_CONFIG := m805_892x_defconfig
#TARGET_KERNEL_CONFIG := tcc892x_defconfig
#KERNEL_EXTERNAL_MODULES:
BOARD_KERNEL_CMDLINE := console=vmalloc=256M
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096

# uitzoeken waar het voor is..
# Framebuffer fixes
#BOARD_USE_GR_FLIP_32 := true
#BOARD_FB_FORCE_24_BPP := true
#BOARD_FB_SINGLE_BUFFERED := true
#BOARD_HAS_JANKY_BACKBUFFER := true

#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/YG/m805_892x/common/recovery_ui.c
TARGET_PROVIDES_INIT_RC := true
TARGET_RECOVERY_INITRC := device/YG/m805_892x/recovery/init.rc
#juiste versie hier boven?

# audio stuff
#BOARD_USES_AUDIO_LEGACY := true
#HARDWARE_OMX := true

#TEST
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
#TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/dwc_otg/gadget/lun1/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/dwc_otg/gadget/lun0/file"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

#TESTEN:
#ifndef BOARD_UMS_LUNFILE
#define BOARD_UMS_LUNFILE "/sys/devices/platform/usb_mass_storage/lun0/file"
#endif

#should be

#ifndef BOARD_UMS_LUNFILE
#define BOARD_UMS_LUNFILE "/sys/devices/platform/dwc_otg/gadget/lun1/file"
#endif

#nieuw 13 jan
#BOARD_USES_HDMI := true
TARGET_USE_HWDECODING_TVOUT := true

# Storage Internal sd aka emmc
# Internal SD card for recovery and such
BOARD_HAS_SDCARD_INTERNAL := true
#BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk0p1
#BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/ndda1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/ndda
#BOARD_SDEXT_DEVICE := /dev/block/platform/tcc-sdhc0.0/mmcblk0
#BOARD_SDEXT_DEVICE := /dev/block/platform/tcc-sdhc0.0
BOARD_SDEXT_DEVICE := /dev/block/mmcblk0
#BOARD_VOLD_MAX_PARTITIONS := 8
#BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
#Iets aanpassen. Zie recovery *.log

BOARD_USES_SECURE_SERVICES := true

#adb has root new 2014 testen.
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.allow.mock.location=1 \
ro.debuggable=1 \
persist.sys.usb.config=mass_storage,adb

# Recovery
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/telechips/tcc8920st/recovery/recovery_keys.c
#BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
#RECOVERY_FSTAB_VERSION := 2
#BOARD_TOUCH_RECOVERY := true
#TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#BOARD_USES_MMCUTILS := true

BOARD_HAS_NO_SELECT_BUTTON := false
#nieuw:
#Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
#Use this flag if the board has a ext4 partition larger than 2gb
#BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_RECOVERY_IGNORE_BOOTABLES := true
#TARGET_RECOVERY_PRE_COMMAND := "dd if=/dev/zero of=/rom/bcb bs=64 count=1 > /dev/null 2>&1 ; echo 'recovery' >> /rom/bcb ; sync"
#TARGET_RECOVERY_FSTAB := device/bn/encore/fstab.encore
