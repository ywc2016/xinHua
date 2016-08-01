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
				onclick="" class="easyui-linkbutton" iconCls="icon-add" plain="true">导入</a>
			<a href="javascript:void(0)" onclick="" class="easyui-linkbutton"
				iconCls="icon-excel" plain="true">导出</a>

		</div>

		<div id="insuranceQuery" class="easyui-dialog" title="查询"
			closed="true" modal="true"
			style="width: 400px; height: 450px; padding: 20px"
			buttons="#insuranceQuery-buttons">
			<div class="ftitle">保单信息</div>
			<form id="insuranceQuery-fm" method="post" novalidate>
				<div class="fitem">
					<label>保单编号:</label> <input id="insuranceQuery-number"
						class="easyui-textbox" name="number" />
				</div>
				<div class="fitem">
					<label>业务员:</label> <input id="insuranceQuery-businessStaff"
						class="easyui-combobox" /><input
						id="insuranceQuery-businessStaffNumber" name="businessStaffNumber"
						style="display: none" />
				</div>
				<div class="fitem">
					<label>开始日期从:</label> <input id="insuranceQuery-beginningA"
						class="easyui-datebox" name="beginningA" />
				</div>
				<div class="fitem">
					<label>到:</label> <input id="insuranceQuery-beginningB"
						class="easyui-datebox" name="beginningB" />
				</div>
				<div class="fitem">
					<label>结束日期从:</label> <input id="insuranceQuery-dueA"
						class="easyui-datebox" name="dueA" />
				</div>
				<div class="fitem">
					<label>到:</label> <input id="insuranceQuery-dueB"
						class="easyui-datebox" name="dueB" />
				</div>
				<div class="fitem">
					<div style="float: left; width: 60px;">
						<label>机构:</label>
					</div>
					<div style="float: left; margin-left: 5px;">
						<ul id="insuranceQuery-department" class="easyui-tree"
							style="width: 220px;"></ul>
					</div>
					<div style="clear: both"></div>
				</div>
				<div class="fitem">
					<div style="float: left; width: 60px;">
						<label>险种:</label>
					</div>
					<div style="float: left; margin-left: 5px;">
						<ul id="insuranceQuery-category" class="easyui-tree"
							style="width: 220px;"></ul>
					</div>
					<div style="clear: both"></div>
				</div>
			</form>
		</div>
		<div id="insuranceQuery-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-search" onclick="insuranceQueryAuxiliary()">查询</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-reload" onclick="insuranceQueryAllAuxiliary()">查询全部</a>
		</div>


		<div id="loading" class="easyui-dialog" title="请稍后" closed="true"
			closable="false" modal="true"
			style="width: 200px; height: 100px; position: relative">
			<div
				style="position: absolute; left: 0; right: 0; top: 0; bottom: 0; margin: auto; font-size: 12px; height: 30px; line-height: 30px; width: 100px; text-align: center;">申请中,请稍后...</div>
		</div>
</body>
</html>