################################################################################
#
# alsaequal
#
################################################################################

ALSAEQUAL_VERSION = 0.6
#ALSAEQUAL_SOURCE = alsaequal-$(ALSAEQUAL_VERSION).tar.bz2
ALSAEQUAL_SOURCE = alsaequal_${ALSAEQUAL_VERSION}.orig.tar.bz2
#ALSAEQUAL_SITE = http://www.thedigitalmachine.net/tools
ALSAEQUAL_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
ALSAEQUAL_LICENSE = LGPLv2.1
ALSAEQUAL_LICENSE_FILES = COPYING
ALSAEQUAL_DEPENDENCIES = alsa-lib

define ALSAEQUAL_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
endef

define ALSAEQUAL_INSTALL_TARGET_CMDS
	install -dm755 "$(TARGET_DIR)"/usr/lib/alsa-lib
	$(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
endef

$(eval $(generic-package))
