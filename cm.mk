## Specify phone tech before including full_phone
#onder wel in org file.
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name. nakijken
PRODUCT_RELEASE_NAME := m805_892x

# Preload bootanimation. nog proberen.
TARGET_BOOTANIMATION_PRELOAD := true
#Hier onder nakijken..
#TARGET_SCREEN_HEIGHT := 480
#TARGET_SCREEN_WIDTH := 800
#TARGET_BOOTANIMATION_NAME := horizontal-1024x600
#TARGET_BOOTANIMATION_NAME := horizontal-1024x600
#Toevegen 2014?
#PRODUCT_COPY_FILES += \
#
#     vendor/cm/prebuilt/common/bootanimation/???240.zip:system/media/bootanimation.zip

#nieuw 28 jan
# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit some common CM stuff.
#$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/YG/m805_892x/full_m805_892x.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m805_892x
#PRODUCT_NAME := cm_m805_892x oude
PRODUCT_NAME :=  full_m805_892x
PRODUCT_BRAND := YG
PRODUCT_MODEL := m805_892x
PRODUCT_MANUFACTURER := YG
