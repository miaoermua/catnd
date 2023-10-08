include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-cattools
PKG_VERSION:=1.0
PKG_RELEASE:=1
LUCI_TITLE:=LuCI Support of CatWrt Tools
LUCI_DESCRIPTION:=LuCI Support of CatWrt Tools
LUCI_DEPENDS:=+jq

include $(TOPDIR)/feeds/luci/luci.mk

define Package/cattools/install
    $(INSTALL_BIN) ./files/usr/bin/catwrt-update $(1)/usr/bin/catwrt-update
    $(INSTALL_BIN) ./files/usr/bin/catnd $(1)/usr/bin/catnd
endef

# call BuildPackage - OpenWrt buildroot signature