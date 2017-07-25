PACKAGE_VERSION = 1.0.0

#THEOS_PLATFORM_SDK_ROOT_armv6 = /Applications/Xcode_Legacy.app/Contents/Developer
#TARGET_IPHONEOS_DEPLOYMENT_VERSION = 3.0
#TARGET_IPHONEOS_DEPLOYMENT_VERSION_arm64 = 7.0
#SDKVERSION_armv6 = 5.1
#ARCHS = armv6 armv7 arm64

#include $(THEOS_LEGACY)/makefiles/common.mk

TARGET = iphone:clang:latest:5.0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WhoMadeIt
WhoMadeIt_FILES = Tweak.xm
WhoMadeIt_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
