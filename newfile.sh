#!/bin/bash

open_file_func() {
	typora ${file_name} &
}

title_func() {
	date=$(date +%F)

	echo "输入文章标题:"
	read title

	title_format=$(echo ${title} | sed 's/ /-/g')
	file_name=${date}-${title_format}.md

	# 这里的-f 参数判断文件是否存在
	if [ -f "${file_name}" ]; then
		echo "${file_name}: 文件已存在！"
		sleep 1
		open_file_func
		exit 1
	fi
}

categories_func() {
	categories_array=(C Go JS Linux Python HTML JS STM32 工具 技术 无线 杂谈 生活 硬件 神学 经验 网络 计算机)
	
	echo ""
	echo "[分类]"
	echo "----------------------"

	for i in "${!categories_array[@]}"
	do
		echo "${i}: ${categories_array[${i}]}"
	done

	echo "----------------------"

	echo -e "输入\033[31m序号\033[0m or 输入\033[31m新分类:\033[0m"
	read categories_input

	if [ "${categories_input}" -ge 0 ] 2>/dev/null ;then 
		categories=${categories_array[${categories_input}]}
	else 
		categories=${categories_input}
	fi 
}

tags_func() {
	tags_array=(ASCII码表 cmd driver hugo Kernel APP MDIO ubuntu Wi-Fi 优先级 传参 公众号 协议 大小端 字节序 存储 开发 总线 总结 技巧 指针 数学 无线 物理 数据类型 经验 学习 芯片 补码)
	echo ""
	echo "[标签]"
	echo "----------------------"

	for i in "${!tags_array[@]}"
	do
		echo "${i}: ${tags_array[${i}]}"
	done

	echo "----------------------"

	echo -e "输入\033[31m序号\033[0m or 输入\033[31m新标签:\033[0m"
	read tags_input

	if [ "${tags_input}" -ge 0 ] 2>/dev/null ;then 
		tags=${tags_array[${tags_input}]}
	else 
		tags=${tags_input}
	fi 
}

url_func() {
	echo ""
	echo "[url]"
	echo "参照标题: ${title}"	
	echo "输入url："
	read url_input

	url="/$(date +%Y/%m/%d)/${url_input}.html"
	url_format=$(echo ${url} | sed 's/ /-/g')
	url_format=${url_format,,}
}

output_func() {
	echo "---" > ${file_name}
	echo "title: \"${title}\"" >> ${file_name}
	echo "date: $(date +%FT%T+08:00)" >> ${file_name}
	echo "draft: false" >> ${file_name}
	echo "categories: [\"${categories}\"]" >> ${file_name}
	echo "tags: [\"${tags}\"]" >> ${file_name}
	echo "toc: false" >> ${file_name}
	echo "url: ${url_format}" >> ${file_name}
	echo "---" >> ${file_name}
}



main() {
	title_func
	categories_func
	tags_func
	url_func
	output_func
	open_file_func
}

main

