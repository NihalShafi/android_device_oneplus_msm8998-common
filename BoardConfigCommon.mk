#
# Copyright (C) 2017 The LineageOS Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

PLATFORM_PATH := device/oneplus/msm8998-common

TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8998
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8998

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a73

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += service_locator.enable=1 swiotlb=2048
BOARD_KERNEL_CMDLINE += loop.max_part=7
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8998
TARGET_KERNEL_CONFIG := lineage_oneplus5_defconfig

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Audio
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true

# Display
TARGET_SCREEN_DENSITY := 420
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true

# Filesystem
TARGET_FS_CONFIG_GEN += $(PLATFORM_PATH)/config.fs

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(PLATFORM_PATH)/framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix_legacy.xml \
    vendor/lineage/config/device_framework_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := $(PLATFORM_PATH)/framework_manifest.xml
DEVICE_MANIFEST_FILE := $(PLATFORM_PATH)/manifest.xml
DEVICE_MATRIX_FILE := hardware/qcom-caf/common/compatibility_matrix.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(PLATFORM_PATH):libinit_oneplus_msm8998

# Lineage Health
TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_BYPASS := false

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 32212254720
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_SYSTEM_EXT_PROP += $(PLATFORM_PATH)/system_ext.prop
TARGET_SYSTEM_PROP += $(PLATFORM_PATH)/system.prop
TARGET_VENDOR_PROP += $(PLATFORM_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_DEVICE_DIRS := $(PLATFORM_PATH)
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_oneplus
TARGET_RELEASETOOLS_EXTENSIONS := $(PLATFORM_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Root
BOARD_ROOT_EXTRA_SYMLINKS += /mnt/vendor/persist:/persist

# Security
VENDOR_SECURITY_PATCH := 2020-09-01

# SELinux
include device/lineage/sepolicy/libperfmgr/sepolicy.mk
include device/qcom/sepolicy-legacy-um/SEPolicy.mk

BOARD_VENDOR_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/private
PRODUCT_PUBLIC_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/public

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Verity
# Only needed for signing
BOARD_AVB_ENABLE := false

# VNDK
BOARD_VNDK_VERSION := current

# Wifi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# inherit from the proprietary version
include vendor/oneplus/msm8998-common/BoardConfigVendor.mk
