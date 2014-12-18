## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name. nakijken
PRODUCT_RELEASE_NAME := m805_892x

# Preload bootanimation. nog proberen.
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
#TARGET_BOOTANIMATION_NAME := horizontal-1024x600
#LANDSCAPE_RESOLUTION := 800x480?

#nieuw 28 jan
# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit some common CM stuff.
#$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration. uitzoeken welke meest voorkomt cm11. full_m805_892x.mk moet eerst! Die start device_m805_892x.mk
$(call inherit-product, device/YG/m805_892x/full_m805_892x.mk)
#$(call inherit-product, device/YG/m805_892x/device_m805_892x.mk)

#test 7dec werkt niet!
#PRODUCT_COPY_FILES += \
#device/YG/m805_892x/prebuild/bootanimation.zip:system/media/bootanimation.zip

## Device identifier. This must come after all inclusions
#PRODUCT_NAME := full_m805_892x
PRODUCT_NAME := full_m805_892x_evm
PRODUCT_DEVICE := m805_892x
#PRODUCT_NAME := cm_m805_892x
#PRODUCT_BRAND := YG
PRODUCT_BRAND := Android
PRODUCT_MODEL := A777
#PRODUCT_MODEL := m805_892x
PRODUCT_MANUFACTURER := YG
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=US_epad BUILD_FINGERPRINT=Android/full_m805_892x_evm/m805_892x:4.0.3/A777/eng.zxp.20120426.164102:userdebug/test-keys
# Release name and versioning
#PRODUCT_RELEASE_NAME := tf101
