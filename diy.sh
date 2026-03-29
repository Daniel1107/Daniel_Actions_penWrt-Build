#!/bin/bash
# 纯净编译测试，暂不拉取任何第三方插件

# ==================== 终极防弹衣：强制剔除内核级 ksmbd，防止内核冲突 ====================
echo ">>> 正在执行底层防爆破机制：物理剔除 ksmbd 及相关依赖..."

# 1. 物理铲除：直接干掉 feeds 缓存中自带的 ksmbd 源码包（斩草除根，不给它编译的机会）
rm -rf feeds/packages/net/ksmbd-tools
rm -rf feeds/packages/net/ksmbd-server
rm -rf feeds/luci/applications/luci-app-ksmbd

# 2. 基因重写：强制修改底层的 .config 文件，把 ksmbd 强行反选（防止系统默认勾选导致死灰复燃）
sed -i 's/CONFIG_PACKAGE_ksmbd-server=y/# CONFIG_PACKAGE_ksmbd-server is not set/g' .config
sed -i 's/CONFIG_PACKAGE_kmod-fs-ksmbd=y/# CONFIG_PACKAGE_kmod-fs-ksmbd is not set/g' .config
sed -i 's/CONFIG_PACKAGE_luci-app-ksmbd=y/# CONFIG_PACKAGE_luci-app-ksmbd is not set/g' .config

echo ">>> ksmbd 剔除完毕，内核编译雷区已扫清！"
