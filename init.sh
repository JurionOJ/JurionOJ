#!/bin/bash

# 先执行 Hydro 的构建流程
echo "🚀 执行 Hydro 构建流程..."
npm run build

# 安装 hydrooj CLI
echo "📦 安装 Hydro CLI..."
npm install -g hydrooj

# 等待系统准备
sleep 10

# 检查是否首次运行
if [ ! -f /app/data/inited ]; then
    echo "🎯 首次运行，初始化系统..."
    
    # 初始化数据库
    hydrooj cli system init
    
    # 创建超级管理员
    hydrooj cli user create "Juruoya1@outlook.com" "abc123xyz"
    hydrooj cli user setSuperAdmin "Juruoya1"
    
    # 创建标记文件
    touch /app/data/inited
    
    echo "✅ 初始化完成！"
    echo "========================================"
    echo "🔐 超级管理员账户："
    echo "📧 邮箱: Juruoya1@outlook.com"
    echo "🔑 密码: abc123xyz"
    echo "👤 用户名: Juruoya1"
    echo "========================================"
else
    echo "⚡ 系统已初始化，直接启动..."
fi

# 启动服务（使用 Hydro 原生的 start 命令）
echo "🌐 启动 Hydro OJ 服务..."
exec npm start
