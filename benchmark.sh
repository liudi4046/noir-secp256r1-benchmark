#!/bin/bash

COMMAND="bb prove_ultra_honk -b ./target/zk_coprocessor.json -w ./target/witness.gz -o ./target/proof"
ITERATIONS=1

if ! command -v bb &> /dev/null; then
    echo "bb 命令未找到，请确保已安装该命令并添加到 PATH"
    exit 1
fi

echo "运行基准测试 ${ITERATIONS} 次..."

for i in $(seq 1 $ITERATIONS); do
    echo "第 $i 次执行..."

    START_TIME=$(date +%s.%N)
    $COMMAND
    END_TIME=$(date +%s.%N)

    ELAPSED=$(echo "$END_TIME - $START_TIME" | bc)

    echo "第 $i 次执行时间: $ELAPSED 秒"
done

echo "基准测试完成"
