# Release name
PRODUCT_RELEASE_NAME := MK802

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Enhanced NFC
#$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/rikomagic/mk802/full_mk802.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mk802
PRODUCT_NAME := cm_mk802
PRODUCT_BRAND := Rikomagic
PRODUCT_MODEL := MK802
PRODUCT_MANUFACTURER := rikomagic

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mantaray BUILD_FINGERPRINT=google/mantaray/manta:4.2.1/JOP40D/533553:user/release-keys PRIVATE_BUILD_DESC="mantaray-user 4.2.1 JOP40D 533553 release-keys"
