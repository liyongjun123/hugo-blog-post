#!/bin/bash

date=$(date +%F)

echo "输入文章标题:"
read title

echo "选择分类:"
echo "1: C"
echo "2: GitHub"
read categories_index

case $categories_index in
	1)
		categories="C"
		;;
	2)
		categories="GitHub"
		;;
	*)
		categories=""
esac


title_format=$(echo ${title} | sed 's/ /-/g')
file_name=${date}-${title_format}.md

echo "---" > ${file_name}
echo "title: \"${title}\"" >> ${file_name}
echo "date: $(date +%FT%T+08:00)" >> ${file_name}
echo "draft: false" >> ${file_name}
echo "categories: [\"${categories}\"]" >> ${file_name}
echo "---" >> ${file_name}

typora $file_name
