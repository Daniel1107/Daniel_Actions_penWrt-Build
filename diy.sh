#!/bin/bash
# =================================================================
# OpenWrt 极简纯净定制脚本 (diy.sh) - 排除干扰项，保底编译通关
# =================================================================

# 核心防弹衣：禁止 Git 遇到 404 时弹出密码提示导致卡死
export GIT_TERMINAL_PROMPT=0

mkdir -p package/diy
echo "开始拉取定制插件..."

# ==================== [Sirpdboy 实用小工具系列] ====================

# 4. 家长行为控制 (管理孩子设备的上网时间段，或一键过滤不良网站)
git clone --depth=1 https://github.com/sirpdboy/luci-app-parentcontrol.git package/diy/luci-app-parentcontrol || true

# 5. 磁盘分区扩容助手 (图形化的一键挂载工具，帮你把空闲的硬盘空间格式化并利用起来)
git clone --depth=1 https://github.com/sirpdboy/luci-app-partexp.git package/diy/luci-app-partexp || true

# 6. 定时任务计划 (小白福音，网页端直接设置定时重启路由器、定时开关 WiFi 等)
git clone --depth=1 https://github.com/sirpdboy/luci-app-taskplan.git package/diy/luci-app-taskplan || true


# ==================== [其他独立高阶神级插件] ====================

# 7. 阿里云盘 WebDAV (将阿里云盘挂载为本地硬盘，供局域网设备直接观看云盘原画电影)
git clone --depth=1 https://github.com/messense/aliyundrive-webdav.git package/diy/luci-app-aliyundrive-webdav || true

# 8. IPTV 助手 (用于家庭宽带 IPTV 网络的融合、抓包、代理转换)
git clone --depth=1 https://github.com/mchome/luci-app-iptvhelper.git package/diy/luci-app-iptvhelper || true

# 9. msd_lite (IPTV 组播转单播代理，让手机、电脑连上 WiFi 就能看运营商的直播)
git clone --depth=1 https://github.com/ximiTech/luci-app-msd_lite.git package/diy/luci-app-msd_lite || true

# 11. Turbo ACC 网络加速 (极其核心！集成 BBR 拥塞控制、DNS 缓存等，跑满千兆网速必备)
git clone --depth=1 https://github.com/chenhw2/luci-app-turboacc.git package/diy/luci-app-turboacc || true

# 12. WrtBwMon 局域网实时流量监控 (图形化显示局域网内每台设备的实时网速和累计消耗流量)
git clone --depth=1 https://github.com/brvphoenix/luci-app-wrtbwmon.git package/diy/luci-app-wrtbwmon || true

# 13. OAF 应用过滤 (企业级行为管理！一键屏蔽某台设备的特定 App，如抖音、王者荣耀)
git clone --depth=1 https://github.com/destan19/OpenAppFilter.git package/diy/OpenAppFilter || true

# 14. AP Modem 访问光猫助手 (连接着路由器的 WiFi，也能直接输入光猫 IP 进入光猫后台)
git clone --depth=1 https://github.com/sirpdboy/luci-app-ap-modem.git package/diy/luci-app-ap-modem || true

# 15. CloudDrive2 多云盘挂载 (网盘聚合神器，支持将阿里云盘、115、夸克等挂载为本地磁盘)
git clone --depth=1 https://github.com/sirpdboy/luci-app-clouddrive2.git package/diy/luci-app-clouddrive2 || true


# ==================== 终极去重大招：全景智能清道夫 (核心修复) ====================
echo "正在执行包冲突全局去重机制..."
# 遍历 package/diy 下所有的文件夹名称
for x in $(ls package/diy)
do
    # 1. 抹杀 feeds 目录下的重复包
    find feeds/ -maxdepth 4 -type d -name "$x" -exec rm -rf {} \;
    
    # 2. 抹杀 package 目录下其他位置（如 package/lean/）的自带重复包！
    # -not -path "package/diy/*" 的作用是保护我们刚才下载的代码不被误删
    find package/ -maxdepth 4 -type d -name "$x" -not -path "package/diy/*" -exec rm -rf {} \;
done

# ==================== 极度危险组件物理删除 ====================
echo "正在物理删除无用且易冲突的 MMDVM 源码..."
rm -rf feeds/*/luci-app-mmdvm
rm -rf package/*/luci-app-mmdvm
rm -rf feeds/*/luci-theme-mmdvm
rm -rf package/*/luci-theme-mmdvm

echo "自定义插件脚本执行完毕！系统已达到最纯净、无冲突状态！"
