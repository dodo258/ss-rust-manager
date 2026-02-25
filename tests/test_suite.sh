#!/usr/bin/env bash
#=================================================
#	Shadowsocks-Rust 测试脚本
#	测试 ss-rust.sh 的核心功能
#=================================================

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
NC='\033[0m'

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
NC='\033[0m'

PASSED=0
FAILED=0

test_passed(){
    echo -e "${GREEN}[PASS]${NC} $1"
    PASSED=$((PASSED + 1))
}

test_failed(){
    echo -e "${RED}[FAIL]${NC} $1"
    FAILED=$((FAILED + 1))
}

test_info(){
    echo -e "${YELLOW}[INFO]${NC} $1"
}

echo "========================================"
echo "Shadowsocks-Rust 测试套件"
echo "========================================"

# 测试1: 检查脚本语法
test_info "测试1: Shell 语法检查"
if bash -n ss-rust.sh 2>/dev/null; then
    test_passed "Shell 语法检查"
else
    test_failed "Shell 语法检查"
fi

# 测试2: 检查必要变量定义
test_info "测试2: 检查必要变量"
required_vars=("sh_ver" "FOLDER" "FILE" "CONF" "LOG_FILE" "BACKUP_DIR")
for var in "${required_vars[@]}"; do
    if grep -q "^${var}=" ss-rust.sh; then
        test_passed "变量 ${var} 已定义"
    else
        test_failed "变量 ${var} 未定义"
    fi
done

# 测试3: 检查日志函数
test_info "测试3: 检查日志函数"
for func in "log_info" "log_error" "log_warn"; do
    if grep -q "^${func}()" ss-rust.sh; then
        test_passed "函数 ${func} 已定义"
    else
        test_failed "函数 ${func} 未定义"
    fi
done

# 测试4: 检查备份函数
test_info "测试4: 检查备份函数"
if grep -q "^backup_config()" ss-rust.sh; then
    test_passed "backup_config 函数已定义"
else
    test_failed "backup_config 函数未定义"
fi

# 测试5: 检查验证函数
test_info "测试5: 检查配置验证函数"
if grep -q "^validate_config()" ss-rust.sh; then
    test_passed "validate_config 函数已定义"
else
    test_failed "validate_config 函数未定义"
fi

# 测试6: 检查 trap 错误处理
test_info "测试6: 检查错误处理"
if grep -q "trap.*ERR" ss-rust.sh; then
    test_passed "错误 trap 已设置"
else
    test_failed "错误 trap 未设置"
fi

# 测试7: 检查版本号更新
test_info "测试7: 检查版本号"
current_ver=$(grep 'sh_ver=' ss-rust.sh | head -1 | cut -d'"' -f2)
if [[ "$current_ver" == "1.5.0" ]]; then
    test_passed "版本号已更新到 ${current_ver}"
else
    test_failed "版本号未更新 (当前: ${current_ver})"
fi

echo "========================================"
echo "测试结果: ${PASSED} 通过, ${FAILED} 失败"
echo "========================================"

if [[ $FAILED -eq 0 ]]; then
    echo -e "${GREEN}所有测试通过!${NC}"
    exit 0
else
    echo -e "${RED}部分测试失败${NC}"
    exit 1
fi
