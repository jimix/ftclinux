#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/FTCOMNIEMBHPM
	NAME:=FTC Omnima EMB-HPM board
	PACKAGES:=kmod-usb-core kmod-usb-ohci kmod-usb2
	# we need these packages
	PACKAGES+= libevent2
	PACKAGES+= libusb-1.0
	PACKAGES+= usbutils
	PACKAGES+= usbreset
	PACKAGES+= samuel
	PACKAGES+= dmesg
	PACKAGES+= uboot-envtools
	PACKAGES+= wpa-supplicant
	PACKAGES+= wpa-cli
	PACKAGES+= wpad
	PACKAGES+= argp-standalone
	PACKAGES+= v4l-utils
	PACKAGES+= libv4l
	PACKAGES+= kmod-hid
	PACKAGES+= kmod-input-joydev
	PACKAGES+= kmod-input-joystick
	PACKAGES+= kmod-input-joystick-xpad
	PACKAGES+= kmod-video-core
	PACKAGES+= kmod-video-uvc
	PACKAGES+= kmod-video-videobuf2
	PACKAGES+= kmod-usb-hid
	PACKAGES+= kmod-usbmon
	# remove pacakages we don't want
	PACKAGES+= -dnsmasq
	PACKAGES+= -firewall
	PACKAGES+= -kmod-iptables
	PACKAGES+= -kmod-ip6tables
	PACKAGES+= -kmod-ppp
	PACKAGES+= -kmod-6relayd
	# remove router packages
	PACKAGES+=$(DEFAULT_PACKAGES.router:%=-%)
endef

define Profile/FTCOMNIEMBHPM/Description
	FTC Profile for using Omnima HPM with the LEGO NXT Brick.
	This is particularly targeted for use with the Samuel Project.
endef
$(eval $(call Profile,FTCOMNIEMBHPM))
