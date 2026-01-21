include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package-files.mk

# Name and release number of this package 
PKG_NAME    := nmea0183
PKG_RELEASE := 1.0

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/nmea0183
	SECTION  := local 
	CATEGORY := LOCAL
	TITLE    := NMEA0183 library
	DEPENDS  := +libstdcpp 
endef

define Package/nmea0183/description
  A library for parsing nmea0183
endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)

	$(CP) -r ./NMEA0183/* $(PKG_BUILD_DIR)/. 

	$(call Build/Prepare/Default)
endef

define Build/InstallDev
	echo "Installing Dev from $(PKG_INSTALL_DIR) to $(1)/usr/include/nmea0183"

	$(INSTALL_DIR) $(1)/usr/include/nmea0183
	$(CP) $(PKG_INSTALL_DIR)/usr/include/nmea0183/*.h  $(1)/usr/include/nmea0183/.

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/.

endef

define Package/nmea0183/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so $(1)/usr/lib/.
endef

$(eval $(call BuildPackage,nmea0183))
