<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%;">
<head>
<%@ include file="backStatic.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新华网</title>
</head>
<body style="height: 100%; margin: 0">
	<div style="font-size: 20px; text-align: center">新华网</div>
<!-- 	<div class="top-div"
		style="width: 100%; height: 100%; border-bottom: 1px solid #95B8E7; margin-top: -1px;"> -->
		
		
		<div id="xinHua-toolbar" style="padding: 5px; height: auto;">
			<a href="javascript:void(0)" onclick="queryMain()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a> <a
				href="javascript:void(0)" onclick="" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a href="javascript:void(0)"
				onclick="upLoadButtonClick();" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">上传</a> <a href="javascript:void(0)"
				onclick="" class="easyui-linkbutton" iconCls="icon-excel"
				plain="true">导出</a>

		</div>
				
    <table id="main-table" class="easyui-datagrid" title="网站列表"
		data-options="
			url:'./news/findByExampleForPagination?',
			sortName:'id',
			remoteSort: false, 
			singleSelect: true,
			pagination: false, 
			toolbar:'#tb'">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',width:100,hidden:true">ID</th>
				<th data-options="field:'webName',width:150">网站</th>
				<th data-options="field:'navigation',width:200">导航条</th>
				<th data-options="field:'classify',width:85">分类</th>
				<th data-options="field:'classifyDetail',width:85">细分类</th>
				<th data-options="field:'url',width:500">URL</th>
				<th data-options="field:'webLevel',width:85">网站定位</th>
				<th data-options="field:'ranking',width:85">排名</th>				
				<th data-options="field:'belonging',width:100">网站所属地</th>
			</tr>
		</thead>
	</table>

		
			<!-- 弹框查询面板 -->
	<div id="query" class="easyui-dialog" title="新闻网站查询" closed="true"
		style="width: 500px; height: 400px; padding: 20px" modal="true"
		buttons="#query-buttons">
		<div class="ftitle">新闻网站信息</div>
		<form id="query-fm" class="easyui-form" method="post"
			data-options="novalidate:true">
			<div class="fitem">
				<label style="width: 90px">网站名:</label> <input id="query-webName"
					name="webName" type="text" class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">导航条:</label> <input id="query-navigation"
					name="navigation" type="text" class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">分类:</label> <input
					id="query-classify" name="classify" type="text"
					class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">细分类:</label> <input
					id="query-classifyDetail" name="classifyDetail" type="text"
					class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">URL:</label> <input
					id="query-url" name="url" type="text"
					class="easyui-textbox" />
			</div>						
			<div class="fitem">
				<label style="width: 90px">网站定位:</label> <input
					id="query-webLevel" name="web_level" type="text"
					class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">排名:</label> <input id="query-ranking"
					name="ranking" type="text" class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">网站所属地:</label> <input id="query-belonging"
					name="belonging" type="text" class="easyui-textbox" />
			</div>
		</form>

	</div>
	<div id="query-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-search" onclick="queryAuxiliary()">查询</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-reload" onclick="queryAllAuxiliary()">查询全部</a>
	</div>
	
			<!-- 弹框查询面板 -->
	<div id="edit" class="easyui-dialog" title="新闻网站查询" closed="true"
		style="width: 500px; height: 400px; padding: 20px" modal="true"
		buttons="#edit-buttons">
		<div class="ftitle">新闻网站信息</div>
		<form id="edit-fm" class="easyui-form" method="post"
			data-options="novalidate:true">
			<div class="fitem">
				<label style="width: 90px">网站名:</label> <input id="query-webName"
					name="webName" type="text" class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">导航条:</label> <input id="query-navigation"
					name="navigation" type="text" class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">分类:</label> <input
					id="query-classify" name="classify" type="text"
					class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">细分类:</label> <input
					id="query-classifyDetail" name="classifyDetail" type="text"
					class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">URL:</label> <input
					id="query-url" name="url" type="text"
					class="easyui-textbox" />
			</div>						
			<div class="fitem">
				<label style="width: 90px">网站定位:</label> <input
					id="query-webLevel" name="web_level" type="text"
					class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">排名:</label> <input id="query-ranking"
					name="ranking" type="text" class="easyui-textbox" />
			</div>
			<div class="fitem">
				<label style="width: 90px">网站所属地:</label> <input id="query-belonging"
					name="belonging" type="text" class="easyui-textbox" />
			</div>
		</form>

	</div>
	<div id="edit-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-search" onclick="editAuxiliary()">保存</a> 
	</div>	
		
		

		<div id="upload" class="easyui-dialog" title="上传文件" closed="true"
			modal="true" style="width: 350px; height: 200px; padding: 20px"
			buttons="#upload-buttons">
			<div class="ftitle">请选择要上传的文件</div>
			<form id="upload-fm" method="post" novalidate>
				<div class="fitem">
					<div style="margin-bottom: 20px">
						<input id="uploadFile" class="easyui-filebox" name="file"
							data-options="prompt:'请选择文件...'" style="width: 100%">
					</div>
				</div>
			</form>
		</div>

		<div id="upload-buttons">
			<a href="#" class="easyui-linkbutton" onclick="upload();">Upload</a>
		</div>

		<div id="loading" class="easyui-dialog" title="请稍后" closed="true"
			closable="false" modal="true"
			style="width: 200px; height: 100px; position: relative">
			<div
				style="position: absolute; left: 0; right: 0; top: 0; bottom: 0; margin: auto; font-size: 12px; height: 30px; line-height: 30px; width: 100px; text-align: center;">申请中,请稍后...</div>
		</div>
		
</body>
<script type="text/javascript" src="../js/xinHua.js"></script>
</html>