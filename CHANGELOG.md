# Changelog

All notable changes to this project will be documented in this file.

## [1.5.0] - 2026-02-25

### Added
- **日志系统**: 添加操作日志记录到 `/var/log/ss-rust.log`
- **自动备份**: 修改配置前自动备份配置文件，保留最近5个备份
- **配置验证**: 添加 `validate_config()` 函数验证 JSON 格式和必要字段
- **错误处理**: 添加 `trap` 错误捕获，记录错误行号

### Improved
- **日志记录**: 在关键操作点（安装、启动、停止、重启、配置修改）添加详细日志
- **安全性**: 添加非 ROOT 用户执行的错误日志

### Fixed
- 修复部分函数缺少错误检查的问题

---

## [1.4.0] - 2026-02-11

### Added
- 支持命令行模式 (`./ss-rust.sh quick-install`)
- 自动检测并安装运行时依赖 (curl, jq, tar)
- 安装时自动开启 BBR 和 TCP Fast Open

### Improved
- 现代化菜单 UI
- 默认使用 AEAD 安全加密方式
- 移除不安全的下载参数

---

## [1.3.0] - 2026-01-20

### Added
- 支持 IPv6
- 二维码本机生成（无需外部依赖）

---

## [1.2.0] - 2025-12-15

### Added
- 快速安装模式
- SHA256 校验

---

## [1.1.0] - 2025-11-01

### Added
- 初始版本
- 基本安装/管理功能
