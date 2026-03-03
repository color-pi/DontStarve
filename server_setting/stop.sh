#!/bin/bash

echo "正在尝试关闭饥荒服务器..."

# 查找并杀死所有 dontstarve_dedicated_server_nullrenderer 进程
# 使用 SIGTERM (15) 信号，这会让服务器尝试进行正常的存档保存操作
pgrep -f dontstarve_dedicated_server_nullrenderer | xargs kill -15

# 等待几秒让服务器完成存档
sleep 3

# 检查是否还有进程在运行
remaining=$(pgrep -f dontstarve_dedicated_server_nullrenderer)

if [ -z "$remaining" ]; then
    echo "所有服务器进程已安全关闭。"
else
    echo "部分进程仍在运行，尝试强制关闭..."
    pgrep -f dontstarve_dedicated_server_nullrenderer | xargs kill -9
    echo "进程已强制清理。"
fi
