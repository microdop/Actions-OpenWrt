#!/bin/bash
#=============================================================
# https://github.com/pema1029/Actions-OpenWrt
# File name: openwrt.sh
# Description: OpenWrt DIY script (Before Update feeds)
# Author: Microdop
#=============================================================
#修改机器名称
# sed -i 's/OpenWrt/Microdop/g' package/base-files/files/bin/config_generate
#修改网关地址
# sed -i 's/192.168.1.1/10.10.10.130/g' package/base-files/files/bin/config_generate
#修改版本号
sed -i 's/OpenWrt/Microdop $(TZ=UTC-8 date "+%Y%m%d") AutoBuild @ OpenWrt/g' package/lean/default-settings/files/zzz-default-settings

#添加额外软件包
git clone https://github.com/lisaac/luci-app-dockerman.git package/openwrt-packages/luci-app-dockerman
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/brook package/openwrt-packages/brook
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/chinadns-ng package/openwrt-packages/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-go package/openwrt-packages/trojan-go
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-plus package/openwrt-packages/trojan-plus
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/ssocks package/openwrt-packages/ssocks
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/openwrt-packages/luci-app-passwall
svn co https://github.com/siropboy/mypackages/trunk/luci-app-autopoweroff package/openwrt-packages/luci-app-autopoweroff
svn co https://github.com/siropboy/mypackages/trunk/luci-app-control-timewol package/openwrt-packages/luci-app-control-timewol
git clone https://github.com/tty228/luci-app-serverchan.git package/openwrt-packages/luci-app-serverchan
git clone https://github.com/jerrykuku/node-request.git package/openwrt-packages/node-request
git clone https://github.com/tuanqing/install-program package/openwrt-packages/install-program
svn co https://github.com/0saga0/OpenClash/trunk/luci-app-openclash package/openwrt-packages/luci-app-openclash

#赋予koolddns权限
#chmod 0755 package/openwrt-packages/luci-app-koolddns/root/etc/init.d/koolddns
#chmod 0755 package/openwrt-packages/luci-app-koolddns/root/usr/share/koolddns/aliddns

./scripts/feeds update -a
./scripts/feeds install -a
