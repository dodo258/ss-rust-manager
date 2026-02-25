# Shadowsocks-Rust 安装管理脚本

> 维护者：**dodo258**  
> GitHub: https://github.com/dodo258/Shadowsocks-Rust

> 自用脚本（主脚本：`ss-rust.sh`）

## 一键运行（推荐）

```bash
wget -O ss-rust.sh https://raw.githubusercontent.com/dodo258/Shadowsocks-Rust/master/ss-rust.sh && chmod +x ss-rust.sh && ./ss-rust.sh
```

## 快速使用

```bash
wget -O ss-rust.sh https://raw.githubusercontent.com/dodo258/Shadowsocks-Rust/master/ss-rust.sh && chmod +x ss-rust.sh
```

### 交互菜单

```bash
./ss-rust.sh
```

### 命令模式（更简单）

```bash
./ss-rust.sh quick-install   # 默认参数快速安装
./ss-rust.sh install         # 交互安装
./ss-rust.sh update
./ss-rust.sh start|stop|restart|status|view|uninstall
```

可选环境变量（用于 `quick-install`）：

- `SS_PORT`（默认 2525）
- `SS_PASSWORD`（默认自动随机）
- `SS_CIPHER`（默认 aes-256-gcm）
- `SS_TFO`（默认 true）

示例：

```bash
SS_PORT=443 SS_CIPHER=chacha20-ietf-poly1305 ./ss-rust.sh quick-install
```

## 关于 TFO（TCP Fast Open）

- 作用：减少 TCP 建连握手时延，通常可改善首包速度。
- 当前策略：安装流程中默认自动开启（你无需手动选）。
- 同步策略：安装时自动尝试加载并持久化开启 BBR（`tcp_congestion_control=bbr`）。
- 如需关闭：安装后可在“修改配置”菜单中手动调整。

## 自动依赖安装

- 运行脚本会自动检测 `curl/jq/tar` 等运行依赖。
- 如缺失会自动安装，不需要手动补包。

## 已做增强

- 主脚本：`ss-rust.sh`（`Shadowsocks-Rust.sh` 仅保留兼容转发）
- 默认仅提供 AEAD 安全加密（chacha20-ietf-poly1305 / aes-128-gcm / aes-256-gcm）
- 已移除不安全下载参数 `--no-check-certificate`
- 已禁用旧版本备用源自动回退（避免降级到过旧版本）
- 官方二进制下载增加重试与 SHA256 校验（上游提供校验文件时）
- 二维码改为本机 `qrencode` 生成（无外部二维码依赖）
