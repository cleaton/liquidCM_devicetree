# Inherit AOSP device configuration for liquid.
$(call inherit-product, device/acer/liquid/liquid.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff (not needed as custom Acer apns-list and Stk are used)
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#

TARGET_NO_KERNEL := true

PRODUCT_NAME := cyanogen_liquid  
PRODUCT_BRAND := acer
PRODUCT_DEVICE := liquid

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRG83 BUILD_DISPLAY_ID=FRG83 BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2.1/FRG83/60505:user/release-keys TARGET_BUILD_TYPE=user BUILD_VERSION_TAGS=release-keys PRIVATE_BUILD_DESC="passion-user 2.2.1 FRG83 60505 release-keys"

# CYANOGEN_WITH_GOOGLE := true

# Use a precompiled kernel until the merge with cm-kernel
# TARGET_PREBUILT_KERNEL = device/acer/liquid/kernel/prebuilt-zImage

# Set ro.modversion
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6-$(shell date +%m%d%Y)-NIGHTLY-Liquid
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7.0-KANG
endif

# Copy HDPI prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
