#!/bin/bash
set +e

# ensure LF and executable in CI
# create diy folder
mkdir -p package/diy

# ==================== 你原有的插件 ====================

# Argon theme + config
rm -rf package/diy/luci-theme-argon
rm -rf package/diy/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/diy/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/diy/luci-app-argon-config

# Design theme + config
rm -rf package/diy/luci-theme-design
rm -rf package/diy/luci-app-design-config
git clone https://github.com/gngpp/luci-theme-design.git package/diy/luci-theme-design
git clone https://github.com/gngpp/luci-app-design-config.git package/diy/luci-app-design-config


# ==================== 独立插件区 ====================

# Sirpdboy 实用小工具
rm -rf package/diy/luci-app-eqosplus
git clone --depth=1 https://github.com/sirpdboy/luci-app-eqosplus.git package/diy/luci-app-eqosplus

rm -rf package/diy/luci-app-fastnet
git clone --depth=1 https://github.com/sirpdboy/luci-app-fastnet.git package/diy/luci-app-fastnet

rm -rf package/diy/luci-app-openlist2
git clone --depth=1 https://github.com/sirpdboy/luci-app-openlist2.git package/diy/luci-app-openlist2

rm -rf package/diy/luci-app-parentcontrol
git clone --depth=1 https://github.com/sirpdboy/luci-app-parentcontrol.git package/diy/luci-app-parentcontrol

rm -rf package/diy/luci-app-partexp
git clone --depth=1 https://github.com/sirpdboy/luci-app-partexp.git package/diy/luci-app-partexp

rm -rf package/diy/luci-app-taskplan
git clone --depth=1 https://github.com/sirpdboy/luci-app-taskplan.git package/diy/luci-app-taskplan

# 阿里云盘 WebDAV
rm -rf package/diy/luci-app-aliyundrive-webdav
git clone --depth=1 https://github.com/messense/aliyundrive-webdav.git package/diy/luci-app-aliyundrive-webdav

# IPTV 助手
rm -rf package/diy/luci-app-iptvhelper
git clone --depth=1 https://github.com/mchome/luci-app-iptvhelper.git package/diy/luci-app-iptvhelper

# IPTV 组播 (msd_lite)
rm -rf package/diy/luci-app-msd_lite
git clone --depth=1 https://github.com/ximiTech/luci-app-msd_lite.git package/diy/luci-app-msd_lite

# Qosmate 流量控制
rm -rf package/diy/luci-app-qosmate
git clone --depth=1 https://github.com/hudra0/qosmate.git package/diy/luci-app-qosmate

# Turbo ACC 网络加速
rm -rf package/diy/luci-app-turboacc
git clone --depth=1 https://github.com/chenhw2/luci-app-turboacc.git package/diy/luci-app-turboacc

# Wrtbwmon 流量监控
rm -rf package/diy/luci-app-wrtbwmon
git clone --depth=1 https://github.com/brvphoenix/luci-app-wrtbwmon.git package/diy/luci-app-wrtbwmon


# ==================== 本次补充的缺失插件 ====================

# OpenAppFilter 应用过滤 (oaf)
rm -rf package/diy/OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter.git package/diy/OpenAppFilter

# iStore 应用商店 (store)
rm -rf package/diy/istore
git clone --depth=1 -b main https://github.com/linkease/istore.git package/diy/istore

# AP-Modem 访问光猫
rm -rf package/diy/luci-app-ap-modem
git clone --depth=1 https://github.com/sirpdboy/luci-app-ap-modem.git package/diy/luci-app-ap-modem

# Clouddrive2 多云盘挂载
rm -rf package/diy/luci-app-clouddrive2
git clone --depth=1 https://github.com/sirpdboy/luci-app-clouddrive2.git package/diy/luci-app-clouddrive2
