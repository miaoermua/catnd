<!--
 * @Author: 喵二
 * @Date: 2023-09-22 09:15:27
 * @LastEditors: 喵二
 * @LastEditTime: 2023-10-08 21:23:00
 * @FilePath: \undefinedd:\Git\catnd\luci-app-cattools\README.md
-->
# luci-app-cattools

LuCI 图形化 CatWrt 工具箱，适用于 CatWrt

## ToDo

- [ ] 测试
- [ ] 提供系统更新检测
- [ ] 添加更多功能
- [ ] 添加更多工具

### 自助诊断

诊断结果: Ping 了几遍不通，检查了你包含 PPPoE 字段

修复方法: 账号密码可能纯在错误

```shell
[PPPoE] Please check if your PPPoE account and password are correct.
```

***

诊断结果: 这个 DNS 不可靠

修复方法: 更换可靠的 DNS 例如: `223.6.6.6 223.5.5.5 119.29.29.99`

```shell
[DNS] Recommended to delete DNS $ip
```

***

诊断结果: 解析失败

修复方法: 可能是 DNS ，光猫以及 IPS 问题

```
[DNS] NS resolution failed for 'www.miaoer.xyz'
[DNS] Your DNS server may have issues
```

***

诊断结果: IPv6 获取地址失败

修复方法: 恢复 IPv6 设置

```shell
[IPv6] IPv6 network connection timed out
```

***

诊断结果: CatWrt 不是默认地址，如果你是小白用户可能乱动了设置

修复方法: 小白用户按照我们的博客进行设置

```shell
[Default-IP] address is not the catwrt default 192.168.1.4
Please configure your network at 'https://www.miaoer.xyz/posts/network/quickstart-catwrt
```

***

诊断结果: 旁路网关？为啥没有 Wan 口

```shell
[Bypass Gateway] No config for 'wan' interface found in /etc/config/network
Please check if your device is set as a Bypass Gateway
```

***

诊断结果: 路由器没有进行拨号上网

```shell
[PPPoE] DHCP protocol detected in WAN interface
The device may not be in PPPoE Rotuer Mode
```

***

诊断结果: IPv6 接口删除

修复方法: 重新配置 DHCPv6 客户端

```shell
[wan6] Your IPv6 network may have issues
```

## 脚本流程

- 开始
- 检查系统环境
- 显示 Banner 方便通过版本诊断
- 通过 ping IP 地址测试网络是否连通
- 通过 DNS 列表检查是否存在 DNS 地址
- 查看 DNS 黑名单列表是否存在可靠性不高的 DNS 地址
- 进行 nslookup 测试 DNS 解析是否正常
- 检查公网 IPv4/IPv6 地址是否正常
- 检查是否 IPv6 优先
- 查看配置文件中的默认 IP 地址还是 192.168.1.4 如果修改了当小白处理并且推荐查看博客文章进行更正
- 查看配置文件中的 wan 是存在来判断是否为旁路网关
- 查看配置文件中的 wan 是否是拨号上网，如果为 dhcp 就判断为没进行拨号上网
- 查看配置文件中的 wan6 是否存在，如果存在就检查 dhcpv6 是否开启
- 结束
