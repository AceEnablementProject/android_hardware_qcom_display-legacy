#Common headers
common_includes := $(call project-path-for,qcom-display)/$(TARGET_BOARD_PLATFORM)/libgralloc
common_includes += $(call project-path-for,qcom-display)/$(TARGET_BOARD_PLATFORM)/libgenlock
common_includes += $(call project-path-for,qcom-display)/$(TARGET_BOARD_PLATFORM)/liboverlay
common_includes += $(call project-path-for,qcom-display)/$(TARGET_BOARD_PLATFORM)/libcopybit
common_includes += $(call project-path-for,qcom-display)/$(TARGET_BOARD_PLATFORM)/libqdutils
common_includes += $(call project-path-for,qcom-display)/$(TARGET_BOARD_PLATFORM)/libhwcomposer
common_includes += $(call project-path-for,qcom-display)/$(TARGET_BOARD_PLATFORM)/libexternal
common_includes += $(call project-path-for,qcom-display)/$(TARGET_BOARD_PLATFORM)/libqservice

common_header_export_path := qcom/display

#Common libraries external to display-caf HAL
common_libs := liblog libutils libcutils libhardware

#Common C flags
common_flags := -DDEBUG_CALC_FPS -Wno-missing-field-initializers
common_flags += -Werror -Wno-error=unused-parameter

ifeq ($(ARCH_ARM_HAVE_NEON),true)
    common_flags += -D__ARM_HAVE_NEON
endif

ifeq ($(TARGET_BOARD_PLATFORM), msm8974)
    common_flags += -DVENUS_COLOR_FORMAT
    common_flags += -DMDSS_TARGET
endif

common_deps  :=
kernel_includes :=

# Executed only on QCOM BSPs
ifeq ($(TARGET_USES_QCOM_BSP),true)
    common_flags += -DQCOM_BSP
endif
ifeq ($(call is-vendor-board-platform,QCOM),true)
    common_deps += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
    kernel_includes += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
endif
