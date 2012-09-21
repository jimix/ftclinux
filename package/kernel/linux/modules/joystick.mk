JOYSTICK_MENU:=Joystick

define KernelPackage/input-joystick
  SUBMENU:=$(JOYSTICK_MENU)
  TITLE:=Joystick Input support
  DEPENDS:=+kmod-input-joydev +kmod-input-core +kmod-usb-core
  KCONFIG:=CONFIG_INPUT_JOYSTICK=y
  # Default them all to no, you can add the ones you care about later
  KCONFIG+=CONFIG_JOYSTICK_ANALOG=n
  KCONFIG+=CONFIG_JOYSTICK_A3D=n
  KCONFIG+=CONFIG_JOYSTICK_ADI=n
  KCONFIG+=CONFIG_JOYSTICK_COBRA=n
  KCONFIG+=CONFIG_JOYSTICK_GF2K=n
  KCONFIG+=CONFIG_JOYSTICK_GRIP=n
  KCONFIG+=CONFIG_JOYSTICK_GRIP_MP=n
  KCONFIG+=CONFIG_JOYSTICK_GUILLEMOT=n
  KCONFIG+=CONFIG_JOYSTICK_INTERACT=n
  KCONFIG+=CONFIG_JOYSTICK_SIDEWINDER=n
  KCONFIG+=CONFIG_JOYSTICK_TMDC=n
  KCONFIG+=CONFIG_JOYSTICK_IFORCE=n
  KCONFIG+=CONFIG_JOYSTICK_WARRIOR=n
  KCONFIG+=CONFIG_JOYSTICK_MAGELLAN=n
  KCONFIG+=CONFIG_JOYSTICK_SPACEORB=n
  KCONFIG+=CONFIG_JOYSTICK_SPACEBALL=n
  KCONFIG+=CONFIG_JOYSTICK_STINGER=n
  KCONFIG+=CONFIG_JOYSTICK_TWIDJOY=n
  KCONFIG+=CONFIG_JOYSTICK_ZHENHUA=n
  KCONFIG+=CONFIG_JOYSTICK_DB9=n
  KCONFIG+=CONFIG_JOYSTICK_GAMECON=n
  KCONFIG+=CONFIG_JOYSTICK_TURBOGRAFX=n
  KCONFIG+=CONFIG_JOYSTICK_AMIGA=n
  KCONFIG+=CONFIG_JOYSTICK_AS5011=n
  KCONFIG+=CONFIG_JOYSTICK_JOYDUMP=n
  KCONFIG+=CONFIG_JOYSTICK_XPAD=n
  KCONFIG+=CONFIG_JOYSTICK_XPAD_FF=n
  KCONFIG+=CONFIG_JOYSTICK_XPAD_LEDS=n
  KCONFIG+=CONFIG_JOYSTICK_WALKERA0701=n
  KCONFIG+=CONFIG_JOYSTICK_MAPLE=n
  $(call AddDepends/input-joydev)
endef

define KernelPackage/input-joystick/description
  Kernel module for joystick input support
endef

$(eval $(call KernelPackage,input-joystick))

define KernelPackage/input-joystick-xpad
  SUBMENU:=$(JOYSTICK_MENU)
  TITLE:=Joystick device support for XBox Controller
  DEPENDS:=+kmod-input-joystick +kmod-input-core +kmod-usb-core
  KCONFIG:=CONFIG_JOYSTICK_XPAD
  FILES:=$(LINUX_DIR)/drivers/input/joystick/xpad.ko
  AUTOLOAD:=$(call AutoLoad,63,xpad)
  $(call AddDepends/input-joystick)
endef

define KernelPackage/input-joystick-xpad/description
  Kernel module for joystick support for XBox Controller
endef

$(eval $(call KernelPackage,input-joystick-xpad))
