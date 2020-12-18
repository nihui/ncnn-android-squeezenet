LOCAL_PATH := $(call my-dir)

# change this folder path to yours
NCNN_INSTALL_PATH := ${LOCAL_PATH}/ncnn-20201218-android-vulkan/$(TARGET_ARCH_ABI)

include $(CLEAR_VARS)
LOCAL_MODULE := ncnn
LOCAL_SRC_FILES := $(NCNN_INSTALL_PATH)/lib/libncnn.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := glslang
LOCAL_SRC_FILES := $(NCNN_INSTALL_PATH)/lib/libglslang.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := SPIRV
LOCAL_SRC_FILES := $(NCNN_INSTALL_PATH)/lib/libSPIRV.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := OGLCompiler
LOCAL_SRC_FILES := $(NCNN_INSTALL_PATH)/lib/libOGLCompiler.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := OSDependent
LOCAL_SRC_FILES := $(NCNN_INSTALL_PATH)/lib/libOSDependent.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := squeezencnn
LOCAL_SRC_FILES := squeezencnn_jni.cpp

LOCAL_C_INCLUDES := $(NCNN_INSTALL_PATH)/include $(NCNN_INSTALL_PATH)/include/ncnn

LOCAL_STATIC_LIBRARIES := ncnn glslang SPIRV OGLCompiler OSDependent

LOCAL_CFLAGS := -O2 -fvisibility=hidden -fomit-frame-pointer -fstrict-aliasing -ffunction-sections -fdata-sections -ffast-math
LOCAL_CPPFLAGS := -O2 -fvisibility=hidden -fvisibility-inlines-hidden -fomit-frame-pointer -fstrict-aliasing -ffunction-sections -fdata-sections -ffast-math
LOCAL_LDFLAGS += -Wl,--gc-sections

LOCAL_CFLAGS += -fopenmp
LOCAL_CPPFLAGS += -fopenmp
LOCAL_LDFLAGS += -static-openmp -fopenmp

LOCAL_LDLIBS := -lz -llog -ljnigraphics -lvulkan -landroid

include $(BUILD_SHARED_LIBRARY)
