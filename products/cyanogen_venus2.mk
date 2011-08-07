# Inherit AOSP device configuration for passion.
$(call inherit-product, device/motorola/venus2/venus2.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_venus2
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := venus2
PRODUCT_MODEL := DROID PRO
PRODUCT_MANUFACTURER := Motorola

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-venus2-KANG
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC1-venus2
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC1-venus2-KANG
    endif
endif

PRODUCT_BUILD_PROP_OVERRIDES := BUILD_ID=S273 BUILD_DISPLAY_ID=VZW PRODUCT_NAME=venus2_vzw TARGET_DEVICE=cdma_venus2 BUILD_FINGERPRINT=vverizon/venus2_vzw/cdma_venus2:2.3.3/4.5.1-110-VNS-11/110525:user/release-keys PRODUCT_BRAND=verizon PRIVATE_BUILD_DESC="ccdma_venus2-user 2.3.3 4.5.1-110-VNS-11 110525 release-keys" BUILD_NUMBER=2.3.5 BUILD_UTC_DATE=1287722464 TARGET_BUILD_TYPE=user BUILD_VERSION_TAGS=release-keys USER=xrpk47

PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += vendor/motorola/venus2

# Add the Torch app
PRODUCT_PACKAGES += Torch
