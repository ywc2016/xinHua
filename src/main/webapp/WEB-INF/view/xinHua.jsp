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
	<div class="top-div"
		style="width: 100%; height: 100%; border-bottom: 1px solid #95B8E7; margin-top: -1px;">
		<table id="insurance-table" title="网站列表">
		</table>
		<div id="xinHua-toolbar" style="padding: 5px; height: auto;">
			<a href="javascript:void(0)" onclick="" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a> <a
				href="javascript:void(0)" onclick="" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a href="javascript:void(0)"
				onclick="upLoadButtonClick();" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">上传</a> <a href="javascript:void(0)"
				onclick="" class="easyui-linkbutton" iconCls="icon-excel"
				plain="true">导出</a>

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