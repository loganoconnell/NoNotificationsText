GO_EASY_ON_ME=1
ARCHS = armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = NoNotificationsText
NoNotificationsText_FILES = Tweak.xm
NoNotificationsText_FRAMEWORKS = Foundation UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Springboard; killall -9 backboardd"
SUBPROJECTS += nonotificationstextprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
