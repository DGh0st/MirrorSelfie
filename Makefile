export ARCHS = armv7 arm64 arm64e
export TARGET = iphone:clang:8.1:9.0

INSTALL_TARGET_PROCESSES = com.apple.camera

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MirrorSelfie

MirrorSelfie_FILES = Tweak.x

include $(THEOS_MAKE_PATH)/tweak.mk
