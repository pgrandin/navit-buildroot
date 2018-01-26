################################################################################
#
# navit
#
################################################################################

NAVIT_VERSION = trunk
NAVIT_SITE = git://github.com/navit-gps/navit 
NAVIT_LICENSE = GPL-2
NAVIT_INSTALL_TARGET = YES
NAVIT_DEPENDENCIES = host-pkgconf
NAVIT_MAKE = $(MAKE1)
NAVIT_CONF_OPTS = -DSVG2PNG=FALSE -DLIBDIR=/usr/lib -DSAMPLE_MAP=0

ifeq ($(BR2_PACKAGE_NAVIT_GTK2),y)
NAVIT_DEPENDENCIES += libgtk2
NAVIT_CONF_OPTS += -Dgraphics/gtk_drawing_area=1
else
NAVIT_CONF_OPTS += -Dgraphics/gtk_drawing_area=0
endif

ifeq ($(BR2_PACKAGE_NAVIT_QT5),y)
NAVIT_DEPENDENCIES += qt5svg qt5declarative
NAVIT_CONF_OPTS += -Dgraphics/qt5=1
else
NAVIT_CONF_OPTS += -DDISABLE_QT=1 -Dgraphics/qt5=0 -Dvehicle/qt5=0
endif

ifeq ($(BR2_PACKAGE_NAVIT_SSD1306),y)
NAVIT_VERSION = ssd1306
NAVIT_SITE = git://github.com/pgrandin/navit
NAVIT_DEPENDENCIES += ssd1306
endif

ifeq ($(BR2_PACKAGE_NAVIT_SPOTIFY_PLAYER),y)
NAVIT_VERSION = audio
NAVIT_DEPENDENCIES += alsa-lib libspotify
NAVIT_CONF_OPTS += -DUSE_AUDIO_FRAMEWORK=1
endif

ifeq ($(BR2_PACKAGE_NAVIT_GPSD_VEHICLE),y)
NAVIT_DEPENDENCIES += gpsd
NAVIT_CONF_OPTS += -Dvehicle/gpsd=1
endif

ifeq ($(BR2_PACKAGE_NAVIT_J1850_PLUGIN),y)
NAVIT_CONF_OPTS += -Dplugin/j1850=1
endif

$(eval $(cmake-package))
