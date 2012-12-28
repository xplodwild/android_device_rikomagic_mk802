#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/rikomagic/mk802/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
    device/rikomagic/mk802/init.sun4i.rc:root/init.sun4i.rc \
    device/rikomagic/mk802/init.sun4i.usb.rc:root/init.sun4i.usb.rc \
    device/rikomagic/mk802/init.recovery.sun4i.rc:root/init.recovery.sun4i.rc \
    device/rikomagic/mk802/fstab.sun4i:root/fstab.sun4i \
    device/rikomagic/mk802/ueventd.sun4i.rc:root/ueventd.sun4i.rc \
    device/rikomagic/mk802/vold.fstab:system/etc/vold.fstab

# Input device files for mk802
#PRODUCT_COPY_FILES += \
#    device/samsung/manta/Atmel_maXTouch_Touchscreen.idc:system/usr/idc/Atmel_maXTouch_Touchscreen.idc \
#    device/samsung/manta/manta-keypad.kl:system/usr/keylayout/manta-keypad.kl \
#    device/samsung/manta/manta-keypad.kcm:system/usr/keychars/manta-keypad.kcm


# Input device files for smdk5250
#PRODUCT_COPY_FILES += \
#    device/samsung/manta/egalax_i2c.idc:system/usr/idc/egalax_i2c.idc \
#    device/samsung/manta/smdk5250-keypad.kl:system/usr/keylayout/smdk5250-keypad.kl \
#    device/samsung/manta/smdk5250-keypad.kcm:system/usr/keychars/smdk5250-keypad.kcm

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    device/rikomagic/mk802/media_codecs.xml:system/etc/media_codecs.xml \
    device/rikomagic/mk802/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml


# audio mixer paths
PRODUCT_COPY_FILES += \
    device/rikomagic/mk802/mixer_paths.xml:system/etc/mixer_paths.xml

# audio policy configuration
PRODUCT_COPY_FILES += \
    device/rikomagic/mk802/audio_policy.conf:system/etc/audio_policy.conf

# audio effects
PRODUCT_PACKAGES += libaudience_voicefx
PRODUCT_COPY_FILES += \
    device/rikomagic/mk802/audio_effects.conf:system/etc/audio_effects.conf

# for bugmailer
PRODUCT_PACKAGES := send_bug
PRODUCT_COPY_FILES += \
    system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
    system/extras/bugmailer/send_bug:system/bin/send_bug

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS := \
    device/rikomagic/mk802/overlay

# for now include gralloc here. should come from hardware/samsung_slsi/exynos5
PRODUCT_PACKAGES += \
    gralloc.sun4i \
    hwcomposer.exDroid \
    sensors.exDroid

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

PRODUCT_PACKAGES += \
    audio.primary.exDroid \
    audio.a2dp.default \
    audio.usb.default \
    libbubblelevel

PRODUCT_PACKAGES += \
    camera.exDroid

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=160 \
    hwui.render_dirty_regions=false 

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

# set default USB configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# for off charging mode
#PRODUCT_PACKAGES += \
#    charger \
#    charger_res_images

$(call inherit-product-if-exists, vendor/rikomagic/mk802/device-vendor.mk)

#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4324/device-bcm.mk)
