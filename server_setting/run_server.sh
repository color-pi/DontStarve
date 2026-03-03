#!/bin/bash

# ================= 配置部分 (完全保留你的设置) =================
game_home=/mnt/workspace/dst_server
game_config_dir=/mnt/workspace/dst_server/DontStarve
game_log_path=/mnt/workspace/dst_server/log
cluster_name="MyDediServer"  # 这里显式定义你的集群名，方便管理

# 确保日志目录存在
mkdir -p "$game_log_path"

# ================= 逻辑部分 (融合后的核心) =================

# 定义一个启动函数：接收 "Master" 或 "Caves" 作为参数
# 这样我们就不用写两遍相同的启动代码
launch_server() {
    local shard=$1
    echo "正在准备启动: $shard ..."

    # 进入目录 (你的逻辑)
    cd "$game_home"/bin || exit

    # 构建启动命令数组 (你的逻辑，完全原样保留)
    run_command=(./dontstarve_dedicated_server_nullrenderer)
    run_command+=(-console)
    run_command+=(-persistent_storage_root "$game_config_dir")
    run_command+=(-conf_dir clusters)
    run_command+=(-cluster "$cluster_name") # 使用上面定义的变量
    run_command+=(-shard "$shard")

    # 执行命令 (融合点！)
    # 1. "${run_command[@]}" : 调用你的命令数组
    # 2. > ... 2>&1 : 将输出写入日志文件 (因为双开不能都输出到屏幕，会乱码)
    # 3. & : 在后台运行 (借鉴了第二个脚本，为了能同时跑两个)
    "${run_command[@]}" > "$game_log_path/${shard}.log" 2>&1 &
    
    echo "$shard 服务器已在后台启动，日志位于: $game_log_path/${shard}.log"
}

# ================= 执行部分 (借鉴第二个脚本的双开逻辑) =================

# 1. 启动地面
launch_server "Master"

# 2. 等待几秒 (建议加上，防止数据库同时读写冲突)
sleep 5

# 3. 启动洞穴
launch_server "Caves"

echo "-----------------------------------------------------"
echo "地面和洞穴均已尝试启动。"
echo "请使用 'top' 或 'ps -ef | grep dontstarve' 查看进程。"