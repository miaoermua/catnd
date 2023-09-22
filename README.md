<!--
 * @Author: 喵二
 * @Date: 2023-09-22 09:15:27
 * @LastEditors: 喵二
 * @LastEditTime: 2023-09-22 18:25:07
 * @FilePath: \undefinedd:\Git\catnd\README.md
-->
# catnd
CatWrt-network-diagnostics

适用用于 CatWrt 的网络诊断脚本，暂时不考虑第三方版本 OpenWrt

**在线执行（闹着玩）**

```bash
curl https://fastly.jsdelivr.net/gh/miaoermua/catnd@main/catnd.sh | bash
```

**安装到 CatWrt 中**

```bash
curl -o /usr/bin/catnd https://fastly.jsdelivr.net/gh/miaoermua/catnd@main/catnd.sh
chmod +x /usr/bin/catnd
catnd
```

## 手动安装

**上传**

将文件下载 https://github.com/miaoermua/catnd/raw/main/catnd.sh 上传到 /usr/bin/ 中，然后执行 `chmod +x /usr/bin/catnd.sh` 赋予执行权限，最后执行 catnd 即可


**编辑**

将文件中所有内容 https://github.com/miaoermua/catnd/raw/main/catnd.sh 复制，并且使用 vi vim nano 等编辑器创建 catnd 赋予执行权限，最后执行 catnd 即可

```bash
chmod +x /usr/bin/catnd.sh
catnd
```

## 脚本流程

- 开始
- 检查系统环境
- 显示 Banner 方便通过版本诊断
- 通过 ping IP 地址测试网络是否连通
- 通过 DNS 列表检查是否存在其中一个 DNS 地址
- 查看 DNS 列表是否存在可靠性不高的 DNS 地址推荐用户修改为高可靠 DNS
- 进行 nslookup 测试 DNS 解析是否正常
- 查看配置文件中的默认 IP 地址还是 192.168.1.4 如果修改了当小白处理并且推荐查看博客文章进行更正
- 查看配置文件中的 wan 是存在来判断是否为旁路网关
- 查看配置文件中的 wan 是否是拨号上网，如果为 dhcp 就判断为没进行拨号上网
- 查看配置文件中的 wan6 是否存在，如果存在就检查 dhcpv6 是否开启
- 结束