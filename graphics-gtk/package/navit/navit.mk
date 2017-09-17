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

NAVIT_CONF_OPTS = -DSVG2PNG=FALSE -DLIBDIR=/usr/lib

ifeq ($(BR2_PACKAGE_NAVIT_GTK2),y)
NAVIT_DEPENDENCIES += libgtk2
NAVIT_CONF_OPTS += -Dgraphics/gtk_drawing_area=1
else
NAVIT_CONF_OPTS += -Dgraphics/gtk_drawing_area=0
endif

$(eval $(cmake-package))
