ARCHS := arm64
TARGET := iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk
# TARGET_CODESIGN = fastPathSign

FRAMEWORK_NAME = ANGLEGLKit

ANGLEGLKit_FILES = MGLContext.mm MGLDisplay.mm MGLKView.mm MGLKViewController.mm MGLLayer.mm MGLKit.m
ANGLEGLKit_CFLAGS = -fobjc-arc -Iinclude -DGL_GLEXT_PROTOTYPES -DGLES_SILENCE_DEPRECATION
ANGLEGLKit_CCFLAGS = -std=c++11
ANGLEGLKit_LDFLAGS = -FFrameworks -rpath @executable_path/Frameworks -Wl,-reexport_framework,libGLESv2
ANGLEGLKit_FRAMEWORKS = libEGL
ANGLEGLKit_PUBLIC_HEADERS = include/

include $(THEOS_MAKE_PATH)/framework.mk
