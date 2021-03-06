# Check for target product
ifeq (pac_xt1032,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_nav_xhdpi

# PAC device overlay
#$(shell cp -f vendor/pac/prebuilt/common/bootanimation_framework/android-logo-mask_lg-xhdpi.png frameworks/base/core/res/assets/images/android-logo-mask.png)

# PAC boot logo
PRODUCT_COPY_FILES += \
    vendor/pac/prebuilt/common/bootlogo/pac_logo_720x1280.rle:root/logo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/pac/prebuilt/xhdpi/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/pac/config/pac_common.mk

# Inherit CM device configuration
$(call inherit-product, device/motorola/xt1032/cm.mk)

PRODUCT_NAME := pac_xt1032

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/pac/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/pac/tools/addprojects.py $(PRODUCT_NAME))

endif
