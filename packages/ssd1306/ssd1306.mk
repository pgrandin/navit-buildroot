################################################################################
#
# SSD1306
#
################################################################################

SSD1306_VERSION = master
SSD1306_SITE = git://github.com/hallard/ArduiPi_OLED.git
SSD1306_LICENSE = GPL-2
SSD1306_INSTALL_TARGET = YES
SSD1306_INSTALL_STAGING = YES

SSD1306_LIB=libArduiPi_OLED.so
SSD1306_LIBNAME=$(SSD1306_LIB).1.0

define SSD1306_BUILD_CMDS
	(cd $(@D); \
	$(TARGET_CXX) -Wall -fPIC -fno-rtti  -c ArduiPi_OLED.cpp; \
	$(TARGET_CXX) -Wall -fPIC -fno-rtti  -c Adafruit_GFX.cpp; \
	$(TARGET_CC) -Wall -fPIC -c bcm2835.c; \
	$(TARGET_CXX) -shared -Wl,-soname,$(SSD1306_LIBNAME) -o $(SSD1306_LIBNAME) ArduiPi_OLED.o Adafruit_GFX.o bcm2835.o; \
	)
endef

define SSD1306_INSTALL_STAGING_CMDS
        cp $(@D)/ArduiPi_*.h $(STAGING_DIR)/usr/include/
        cp $(@D)/Adafruit_*.h $(STAGING_DIR)/usr/include/
        cp $(@D)/bcm2835.h* $(STAGING_DIR)/usr/include/
        cp $(@D)/$(SSD1306_LIBNAME) $(STAGING_DIR)/usr/lib/
	ln $(STAGING_DIR)/usr/lib/$(SSD1306_LIBNAME) $(STAGING_DIR)/usr/lib/$(SSD1306_LIB)
        cp $(@D)/$(SSD1306_LIBNAME) $(TARGET_DIR)/usr/lib/
	ln $(TARGET_DIR)/usr/lib/$(SSD1306_LIBNAME) $(TARGET_DIR)/usr/lib/$(SSD1306_LIB)
endef


$(eval $(generic-package))
