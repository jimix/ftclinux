#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=samuel
PKG_VERSION:=0.8
PKG_RELEASE:=master
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(PKG_SOURCE_SUBDIR)

ifeq ($(CONFIG_SAMUEL_GIT),y)
PKG_SOURCE_URL:=$(CONFIG_SAMUEL_GIT_REPO)
PKG_SOURCE_PROTO:=git
else
PKG_SOURCE_URL:=$(CONFIG_SAMUEL_DIR)
PKG_SOURCE_PROTO:=rsync
endif

PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_MD5SUM:=

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=0

include $(INCLUDE_DIR)/package.mk

define Package/samuel
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Samuel
  URL:=https://bitbucket.org/ftcengineering/samuel
  MAINTAINER:=Jimi Xenidis <jimix@pobox.com>
  TITLE:=FTC Samuel Toolkit
  DEPENDS:=+libusb-1.0 +libevent2
  MENU:=1
endef

define Package/samuel/description
FTC Samuel Project
endef

define Package/samuel/config
	source "$(SOURCE)/Config.in"
endef

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)	\
		CROSS=$(TARGET_CROSS) URI_PATH=/usr/share/samuel/http all
endef

# Do nothing
define Build/Install/Default
endef

define Package/samuel/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/samuel $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tests/nxt_get_battery $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tests/nxt_file_list $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tests/nxt_robojoy $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/samuel
	$(CP) -a $(PKG_BUILD_DIR)/http $(1)/usr/share/samuel
endef

$(eval $(call BuildPackage,samuel))
