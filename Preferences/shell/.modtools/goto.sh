#!/usr/bin/sh

GOTO_CONFIG="${HOME}/.goto_paths"

# 初始化配置文件
if [ ! -f "${GOTO_CONFIG}" ]; then
    touch "${GOTO_CONFIG}"
fi

usage() {
    echo "Usage:"
    echo "  goto <name>          - cd to registered path"
    echo "  goto add <name> <path> - register a shortcut"
    echo "  goto rm <name>       - remove a shortcut"
    echo "  goto list            - list all shortcuts"
}

# 添加快捷路径
goto_add() {
    if [ $# -lt 2 ]; then
        echo "Usage: goto add <name> <path>"
        return 1
    fi
    local name="$1"
    local dest="$2"
    # 如果已存在则先删除旧的
    goto_rm "$name" 2>/dev/null
    echo "${name}=${dest}" >> "${GOTO_CONFIG}"
    echo "Added: ${name} -> ${dest}"
}

# 删除快捷路径
goto_rm() {
    if [ $# -lt 1 ]; then
        echo "Usage: goto rm <name>"
        return 1
    fi
    local name="$1"
    local tmp="${GOTO_CONFIG}.tmp"
    grep -v "^${name}=" "${GOTO_CONFIG}" > "${tmp}" 2>/dev/null
    mv "${tmp}" "${GOTO_CONFIG}"
    echo "Removed: ${name}"
}

# 列出所有快捷路径
goto_list() {
    if [ ! -s "${GOTO_CONFIG}" ]; then
        echo "No shortcuts registered."
        return
    fi
    echo "Registered shortcuts:"
    while IFS='=' read -r name dest; do
        [ -n "$name" ] && printf "  %-12s -> %s\n" "$name" "$dest"
    done < "${GOTO_CONFIG}"
}

# 跳转到快捷路径
goto_cd() {
    local name="$1"
    local dest
    dest=$(grep "^${name}=" "${GOTO_CONFIG}" 2>/dev/null | head -1 2>/dev/null | cut -d'=' -f2- 2>/dev/null)
    if [ -n "$dest" ]; then
        cd "$dest"
    else
        echo "Unknown shortcut: ${name}"
        echo "Use 'goto list' to see available shortcuts."
        return 1
    fi
}

# 主逻辑
case "$1" in
    add)
        shift
        goto_add "$@"
        ;;
    rm)
        shift
        goto_rm "$@"
        ;;
    list)
        goto_list
        ;;
    -h|--help|help)
        usage
        ;;
    "")
        # 无参数时默认跳转 workspace（如果已注册）
        goto_cd "workspace"
        ;;
    *)
        goto_cd "$1"
        ;;
esac

