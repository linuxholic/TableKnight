"+--------------------------------------------------------------------------+
"|                   Vim global plugin for generate table                   |
"|--------------------------------------------------------------------------|
"|    FileName: |  table.vim                                                |
"|--------------+-----------------------------------------------------------|
"|      Author: |  codepiano                                                |
"|--------------+-----------------------------------------------------------|
"|       Email: |  codepiano@gmail.com                                      |
"|--------------+-----------------------------------------------------------|
"|    HomePage: |  http://pianoisy.sinaapp.com/                             |
"|--------------+-----------------------------------------------------------|
"|  LastChange: |  2012-11-07 13:46:11                                      |
"|--------------+-----------------------------------------------------------|
"|  Maintainer: |  codepiano <codepiano@gmail.com>                          |
"|--------------+-----------------------------------------------------------|
"|     License: |  This file is placed in the public domain.                |
"+--------------------------------------------------------------------------+

"防止脚本重复加载，用户也可以手动设置该变量阻止该插件加载
if exists("g:loaded_tableknight")
	finish                      
endif                         
let g:loaded_tableknight = 1     

"设置按键绑定，绑定前先进行判断，防止覆盖用户自定义绑定
if !hasmapto("<Plug>TableKnight")
	map <unique> <Leader>t  <Plug>TableKnight
endif

noremap <unique> <script> <Plug>TableKnight  <SID>Princess

noremap <SID>Princess :call <SID>Princess()<CR>

"脚本内部使用的变量定义
"边框交叉点的字符
let s:tk_cross = "+"
"横向边框的连接线
let s:tk_horizontal_line = "-"
"纵向边框的连接线
let s:tk_vertical_line = "|"
"单元格的默认宽度
let s:tk_td_width = "9"

"Princess
function s:Princess()
	let l:tk_args = input("请输入行数和列数:")
	if strlen(l:tk_args) == 0
		echo "没有参数"
		return
	else
		let l:tk_args_list = split(l:tk_args,"[, -]")
	endif
	let l:row_number = 0 + l:tk_args_list[0]
	let l:column_number = 0 + l:tk_args_list[1]
	"参数合法性检查
	if(l:row_number == 0 || l:column_number == 0)
		echo "行数和列数不能为0"
		return
	endif
	echo s:Kinght_Build_Table(l:row_number,l:column_number)
endfunction

function s:Kinght_Build_Table(row_number,column_number)
	let l:column_width_list = s:Kinght_Calc_Width(a:column_number)
	if(len(l:column_width_list) > 0)

	endif
	return l:column_width_list
endfunction

"计算空表格的每行宽度
"@param column_number 列数
"@return column_width_list 记录列宽的list
function s:Kinght_Calc_Width(column_number)
	let l:column_width_list = []
	"判断是否开启折行
	let l:is_wrap = &wrap
	"默认单元格宽度
	if(l:is_wrap == 1)
		"获取每行最大宽
		let l:line_width = &textwidth
		let l:td_width = (l:line_width - a:column_number - 1) / a:column_number
	endif
	"使用默认单元格宽度
	if(s:tk_td_width < l:td_width)
		let l:td_width = s:tk_td_width
	endif
	"填充单元格宽度数据
	if(l:td_width > 0)
		let l:index = 0
		while l:index < a:column_number
			call add(l:column_width_list,l:td_width)
			let l:index = l:index + 1
		endwhile
	endif
	return l:column_width_list
endfunction

"分析计算每个单元格的宽度
"@param row_content 一行文本
"@return 
function s:Kinght_Analyze_Width(row_content)
	let l:column_width_list = []
	if(strlen(a:row_content) > 0)
	else
	endif
endfunction

"构造表格的边框
"@param olumn_width_list 存放每列宽度的list
"@param decoration 构成边框的字符，默认线条为'-'，交叉点为'+'
function s:Kinght_Make_Fence(column_width_list,decoration)
	let l:fence = ""
	let l:index = 0
	if(len(column_width_list) > 0)
	endif
endfunction

function s:Kinght_Make_Trellis(column_width_list,decoration)
endfunction

"使用' '、'-'、','分割输入字符串，返回list
"@param tk_args 待分割的参数字符串
"@return result 分割后的字符串列表
function s:Knight_Split_Args(tk_args)
	let l:result = []
	let l:matchIndex = match(a:tk_args,"[, -]") 
	echo l:matchIndex
	if l:matchIndex > 0
		let l:tk_split_char = strpart(a:tk_args,l:matchIndex,1)
	else
		call add(l:result,a:tk_args)
	endif
	return l:result
endfunction

if !exists(":Tk")
endif
