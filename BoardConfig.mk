# Product-specific compile-time definitions.
# BoardConfig.mk - This is the meat of it all, this is where compiler conditional flags are set, partition layouts, boot addresses, ramdisk size, and so on.
# Alsa
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
#ALSA_DEFAULT_SAMPLE_RATE := 44100

USE_CAMERA_STUB := true
BOARD_HAVE_FRONT_CAM := true
BOARD_HAVE_BACK_CAM := false

#nieuw 16 jan:
HOST_JDK_IS_64BIT_VERSION := true

# inherit from the proprietary version
-include device/YG/m805_892x/BoardConfigVendor.mk

#test 29jan
# Sensors
BOARD_USES_SENSOR_BMA250 :=true
BOARD_USES_LIGHT_SENSOR := false
BOARD_HAVE_COMPASS := false

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
#nieuw 16jan 29 jan
TARGET_SIMULATOR := false
BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_FAKE_GPS := true
# org: TARGET_BOARD_PLATFORM := unknown
TARGET_BOARD_PLATFORM := tcc892x
#Hier onder org:
#TARGET_CPU_ABI := armeabi
#Hier onder test.
#test 2014 voor cm11 Arch type;
TARGET_ARCH :=arm
TARGET_BOARD_PLATFORM_GPU := ARM-Mali
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
#nieuw hier onder:
#TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
#nieuw hier onder:
ARCH_ARM_HAVE_TLS_REGISTER := true
#nieuw 2 lines:
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
#TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
#TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_BOOTLOADER_BOARD_NAME := m805_892x
#nieuw:
TARGET_BOARD_INFO_FILE := device/YG/m805_892x/board-info.txt
#TARGET_USERIMAGES_USE_EXT4 := true
TARGET_PROVIDES_LIBRIL := device/YG/m805_892x/proprietary/lib/libril.so
#nieuw:
#BOARD_USES_OVERLAY := true

#nieuw:
USE_OPENGL_RENDERER := true

BOARD_EGL_CFG := device/YG/m805_892x/common/egl.cfg

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
#BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 314572800
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
# Here under is for tom-tec without using ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x12c00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x40000000
BOARD_FLASH_BLOCK_SIZE := 131072

WPA_SUPPLICANT_VERSION := VER_0_6_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_ARG := ""
WIFI_DRIVER_MODULE_NAME := "wlan"

TARGET_PREBUILT_KERNEL := device/YG/m805_892x/kernel
TARGET_KERNEL_CONFIG := Tom-Tec_defconfig
BOARD_KERNEL_CMDLINE := console=null
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096

TARGET_PROVIDES_INIT_RC := true
TARGET_RECOVERY_INITRC := device/YG/m805_892x/recovery/init.rc

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

#test 29 jan
BOARD_USES_SECURE_SERVICES := true

# Recovery
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/telechips/tcc8920st/recovery/recovery_keys.c
#BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
#BOARD_TOUCH_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

BOARD_HAS_NO_SELECT_BUTTON := false
#nieuw:
# Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
# Use this flag if the board has a ext4 partition larger than 2gb
#BOARD_HAS_LARGE_FILESYSTEM := true
