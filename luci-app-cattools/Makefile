include $(TOPDIR)/rules.mk

PKG_NAME:=catnd
PKG_VERSION:=1.0
PKG_RELEASE:=1

LUCI_TITLE:=CatTools
LUCI_DEPENDS:= +catnd

include $(INCLUDE_DIR)/package.mk
$(call IncludeDirs,./luci)

define Package/catnd
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=catnd
    DEPENDS:=+jq
    URL:=https://www.miaoer.xyz/posts/network/catwrt-bash-script
    MAINTAINER:=miaoermua
endef

define Package/catnd/description
    catnd is a bash script.
endef

define Package/catnd/install
    $(INSTALL_CONF) ./files/usr/bin/catwrt-update $(1)/usr/bin/catwrt-update
    $(INSTALL_BIN) ./files/usr/bin/catnd $(1)/usr/bin/catnd
endef