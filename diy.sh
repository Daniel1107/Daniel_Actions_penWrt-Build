#!/bin/bash

# 核心防弹衣：禁止 Git 遇到 404 时弹出密码提示导致卡死
export GIT_TERMINAL_PROMPT=0

# ==================== 建立专属插件隔离区 ====================
mkdir -p package/diy
echo "开始拉取定制插件..."

# ==================== [主题与外观配置] ====================

# 1. Argon 主题 (目前最火、极简现代风格的路由器后台主题)
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/diy/luci-theme-argon || true

# 2. Argon 主题设置 (图形化工具：用于自定义 Argon 主题的登录背景图片、颜色等)
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/diy/luci-app-argon-config || true

# 3. Design 主题 (另一款备受好评、带有毛玻璃/磨砂质感的精致主题)
git clone https://github.com/gngpp/luci-theme-design.git package/diy/luci-theme-design || true

# 4. Design 主题设置 (图形化工具：自定义 Design 主题的外观和背景)
git clone https://github.com/gngpp/luci-app-design-config.git package/diy/luci-app-design-config || true


# ==================== [Sirpdboy 实用小工具系列] ====================

# 5. EQoS+ 网速控制 (智能分配局域网宽带，防止某台设备疯狂下载拖慢全局网络)
git clone --depth=1 https://github.com/sirpdboy/luci-app-eqosplus.git package/diy/luci-app-eqosplus || true

# 6. FastNet 网络加速助手 (优化网络连接数和内核参数，提升网络响应速度)
git clone --depth=1 https://github.com/sirpdboy/luci-app-fastnet.git package/diy/luci-app-fastnet || true

# 7. OpenList2 路由策略 (高级路由规则工具，用于指定特定 IP 走特定网关，适合多线接入)
git clone --depth=1 https://github.com/sirpdboy/luci-app-openlist2.git package/diy/luci-app-openlist2 || true

# 8. 家长行为控制 (神器！可规定孩子设备的上网时间段，或者一键过滤不良网站)
git clone --depth=1 https://github.com/sirpdboy/luci-app-parentcontrol.git package/diy/luci-app-parentcontrol || true

# 9. 磁盘分区扩容助手 (图形化的一键挂载工具，帮你把空闲的硬盘空间格式化并利用起来)
git clone --depth=1 https://github.com/sirpdboy/luci-app-partexp.git package/diy/luci-app-partexp || true

# 10. 定时任务计划 (小白福音，可以直接在网页上设置定时重启路由器、定时开关 WiFi 等)
git clone --depth=1 https://github.com/sirpdboy/luci-app-taskplan.git package/diy/luci-app-taskplan || true


# ==================== [其他独立高阶神级插件] ====================

# 11. 阿里云盘 WebDAV (把你的阿里云盘变成路由器的本地硬盘，局域网内直接看云盘原画电影)
git clone --depth=1 https://github.com/messense/aliyundrive-webdav.git package/diy/luci-app-aliyundrive-webdav || true

# 12. IPTV 助手 (用于家庭宽带 IPTV 网络的融合、抓包、代理转换)
git clone --depth=1 https://github.com/mchome/luci-app-iptvhelper.git package/diy/luci-app-iptvhelper || true

# 13. IPTV 组播转单播 msd_lite (极简高效的组播代理，让手机、电脑连上WiFi就能看运营商的 IPTV 直播)
git clone --depth=1 https://github.com/ximiTech/luci-app-msd_lite.git package/diy/luci-app-msd_lite || true

# 14. QoSmate 流量控制 (新一代强大的 Qos 工具，优先保障游戏、网页浏览的超低延迟)
git clone --depth=1 https://github.com/hudra0/qosmate.git package/diy/luci-app-qosmate || true

# 15. Turbo ACC 网络加速 (极其核心！集成流量分流、BBR拥塞控制、DNS缓存，是跑满千兆网速的关键)
git clone --depth=1 https://github.com/chenhw2/luci-app-turboacc.git package/diy/luci-app-turboacc || true

# 16. WrtBwMon 局域网实时流量监控 (图形化显示局域网内每一台手机/电脑此时此刻的网速和累计消耗流量)
git clone --depth=1 https://github.com/brvphoenix/luci-app-wrtbwmon.git package/diy/luci-app-wrtbwmon || true

# 17. OAF 应用过滤 (企业级行为管理！一键屏蔽某台设备的抖音、王者荣耀、各类视频或购物软件)
git clone --depth=1 https://github.com/destan19/OpenAppFilter.git package/diy/OpenAppFilter || true

# 18. AP Modem 访问光猫助手 (让你连接着路由器的 WiFi，也能直接输入光猫 IP 进入光猫后台)
git clone --depth=1 https://github.com/sirpdboy/luci-app-ap-modem.git package/diy/luci-app-ap-modem || true

# 19. CloudDrive2 多云盘挂载 (网盘界的大杀器，支持将阿里云盘、115、夸克等多种网盘聚合挂载为本地磁盘)
git clone --depth=1 https://github.com/sirpdboy/luci-app-clouddrive2.git package/diy/luci-app-clouddrive2 || true


# ==================== 终极去重大招：智能清道夫 ====================
echo "正在执行包冲突去重机制..."
# 遍历 package/diy 下所有的文件夹名称
for x in $(ls package/diy)
do
    # 只要在 feeds 系统库里找到了和 diy 目录下同名的文件夹，一律无情抹杀！
    # 保证系统在编译时，只用我们刚才手动拉取的最新原作者版本！
    find feeds/ -maxdepth 4 -type d -name "$x" -exec rm -rf {} \;
done

echo "自定义插件脚本执行完毕！系统已达到最纯净状态！"
