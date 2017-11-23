################################################################################
#
# libspotify
#
################################################################################

LIBSPOTIFY_VERSION = 12.1.103-Linux-armv6-bcm2708hardfp-release
LIBSPOTIFY_SITE = http://sd-55475.dedibox.fr
LIBSPOTIFY_LICENSE = GPL-2
LIBSPOTIFY_INSTALL_TARGET = YES
LIBSPOTIFY_INSTALL_STAGING = YES

LIB=libspotify.so

# define LIBSPOTIFY_BUILD_CMDS
# 	(cd $(@D); \
# 	$(TARGET_CXX) -Wall -fPIC -fno-rtti  -c ArduiPi_OLED.cpp; \
# 	$(TARGET_CXX) -Wall -fPIC -fno-rtti  -c Adafruit_GFX.cpp; \
# 	$(TARGET_CC) -Wall -fPIC -c bcm2835.c; \
# 	$(TARGET_CXX) -shared -Wl,-soname,$(LIBNAME) -o $(LIBNAME) ArduiPi_OLED.o Adafruit_GFX.o bcm2835.o; \
# 	)
# endef

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

        cp $(@D)/lib/$(LIB) $(STAGING_DIR)/usr/lib/
	ln $(STAGING_DIR)/usr/lib/$(LIB) $(STAGING_DIR)/usr/lib/$(LIB).12
	ln $(STAGING_DIR)/usr/lib/$(LIB).12 $(STAGING_DIR)/usr/lib/$(LIB).12.1.103

        cp $(@D)/lib/$(LIB) $(TARGET_DIR)/usr/lib/
	ln $(TARGET_DIR)/usr/lib/$(LIB) $(TARGET_DIR)/usr/lib/$(LIB).12
	ln $(TARGET_DIR)/usr/lib/$(LIB).12 $(TARGET_DIR)/usr/lib/$(LIB).12.1.103
endef


$(eval $(generic-package))
# $(eval $(host-generic-package))

