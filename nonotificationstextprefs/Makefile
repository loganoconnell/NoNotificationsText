GO_EASY_ON_ME=1
ARCHS = armv7 arm64
include theos/makefiles/common.mk

BUNDLE_NAME = NoNotificationsTextPrefs
NoNotificationsTextPrefs_FILES = NoNotificationsTextPrefs.mm
NoNotificationsTextPrefs_INSTALL_PATH = /Library/PreferenceBundles
NoNotificationsTextPrefs_FRAMEWORKS = Foundation UIKit
NoNotificationsTextPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NoNotificationsTextPrefs.plist$(ECHO_END)
