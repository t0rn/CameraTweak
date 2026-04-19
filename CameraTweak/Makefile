TARGET = iphone:clang:latest:15.0
ARCHS = arm64 arm64e

THEOS_PACKAGE_SCHEME = rootless

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CameraTweak

CameraTweak_FILES = Tweak.xm FakeDelegate.m
CameraTweak_CFLAGS = -fobjc-arc

# Ресурсы
CameraTweak_RESOURCE_DIRS = Resources

include $(THEOS_MAKE_PATH)/tweak.mk

# Resources Bundle
BUNDLE_NAME = CameraTweakResources
CameraTweakResources_RESOURCE_DIRS = Resources
CameraTweakResources_INSTALL_PATH = /var/jb/Library/Application Support/CameraTweak
CameraTweakResources_BUNDLE_EXTENSION = bundle

include $(THEOS_MAKE_PATH)/bundle.mk
