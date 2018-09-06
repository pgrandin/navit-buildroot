################################################################################
#
# libspotify
#
################################################################################

LIBSPOTIFY_VERSION = 12.1.103-Linux-armv6-bcm2708hardfp-release
LIBSPOTIFY_SITE = https://github.com/mopidy/libspotify-archive/raw/master/
LIBSPOTIFY_LICENSE = GPL-2
LIBSPOTIFY_INSTALL_TARGET = YES
LIBSPOTIFY_INSTALL_STAGING = YES

LIBSPOTIFY_LIB=libspotify.so

# ./output/build/libspotify-12.1.103-Linux-armv6-bcm2708hardfp-release/lib/libspotify.so.12
# ./output/build/libspotify-12.1.103-Linux-armv6-bcm2708hardfp-release/lib/libspotify.so
# ./output/build/libspotify-12.1.103-Linux-armv6-bcm2708hardfp-release/lib/pkgconfig/libspotify.pc
# ./output/build/libspotify-12.1.103-Linux-armv6-bcm2708hardfp-release/lib/libspotify.so.12.1.103
# ./output/build/libspotify-12.1.103-Linux-armv6-bcm2708hardfp-release/include/libspotify
# ./output/build/libspotify-12.1.103-Linux-armv6-bcm2708hardfp-release/include/libspotify/api.h

define LIBSPOTIFY_INSTALL_STAGING_CMDS
        cp $(@D)/lib/pkgconfig/libspotify.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	mkdir $(STAGING_DIR)/usr/include/libspotify/
        cp $(@D)/include/libspotify/api.h $(STAGING_DIR)/usr/include/libspotify/

        cp $(@D)/lib/$(LIBSPOTIFY_LIB) $(STAGING_DIR)/usr/lib/
	ln $(STAGING_DIR)/usr/lib/$(LIBSPOTIFY_LIB) $(STAGING_DIR)/usr/lib/$(LIBSPOTIFY_LIB).12
	ln $(STAGING_DIR)/usr/lib/$(LIBSPOTIFY_LIB).12 $(STAGING_DIR)/usr/lib/$(LIBSPOTIFY_LIB).12.1.103

        cp $(@D)/lib/$(LIBSPOTIFY_LIB) $(TARGET_DIR)/usr/lib/
	ln $(TARGET_DIR)/usr/lib/$(LIBSPOTIFY_LIB) $(TARGET_DIR)/usr/lib/$(LIBSPOTIFY_LIB).12
	ln $(TARGET_DIR)/usr/lib/$(LIBSPOTIFY_LIB).12 $(TARGET_DIR)/usr/lib/$(LIBSPOTIFY_LIB).12.1.103
endef


$(eval $(generic-package))
