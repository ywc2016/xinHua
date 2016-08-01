<%@ page language="java" import="java.util.Date"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="./backStatic.jsp"%>
<title>后台管理-CIB业务管理系统</title>
<style type="text/css">
.banner {
	height: 50px;
	text-align: left;
	color: #444444;
	font-size: 14px;
	font-family: 微软雅黑, 微软雅黑, Verdana, Tahoma;
}

.toolbar {
	float: right;
}

.toolbar a {
	position: relative;
	display: inline-block;
	font-size: 14px;
	width: 90px;
	height: 30px;
	line-height: 30px;
	text-align: center;
}

a:link {
	color: #000000;
	text-decoration: none
}

a:visited {
	color: #000000;
	text-decoration: none
}

a:hover {
	color: #ff7f24;
	text-decoration: underline;
}

a:active {
	color: #ff7f24;
	text-decoration: underline;
}

#north {
	padding-top: 15px;
}

#northNav {
	width: 860px;
	float: left;
}

#northNav>a {
	font-size: 18px;
	overflow: hidden;
	font-weight: 600;
	margin-left: 15px;
}

#northWel {
	width: 400px;
	float: right;
	text-align: right;
}

#northWel>a,#northWel>span {
	font-size: 16px;
	overflow: hidden;
	font-weight: 600;
	margin-right: 15px;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'north'" class="banner">
		<div id="north">
			<div id="northNav">
				<sec:authorize
					ifAnyGranted="AUTH_INSURANCE_BUSINESS ,AUTH_INSURANCE_SUPERVISION ">
					<a href="./admin/index?type=insurance">保单</a>
				</sec:authorize>
				<!-- 未加权限 -->
				<sec:authorize ifAnyGranted="AUTH_INVOICE_MANAGEMENT">
					<a href="./admin/index?type=invoice">发票</a>
				</sec:authorize>
				<sec:authorize ifAnyGranted="AUTH_DATA_ADMIN ">
					<a href="./admin/index?type=category">险种</a>
				</sec:authorize>
				<sec:authorize
					ifAnyGranted="AUTH_INSURANCE_BUSINESS ,AUTH_CONTRACT_SUPERVISION">
					<a href="./admin/index?type=contract">合同</a>
					<a href="./admin/index?type=material">资料</a>
				</sec:authorize>
				<sec:authorize
					ifAnyGranted="AUTH_DATA_ADMIN ,AUTH_INSURANCE_ENTERING">
					<a href="./admin/index?type=customer">客户</a>
				</sec:authorize>
				<sec:authorize ifAnyGranted="AUTH_DATA_ADMIN ">
					<a href="./admin/index?type=company">保险公司</a>
				</sec:authorize>
				<sec:authorize ifAnyGranted="AUTH_DATA_ADMIN_HIGH ">
					<a href="./admin/index?type=staff">人员</a>
				</sec:authorize>
				<sec:authorize ifAnyGranted="AUTH_DATA_ADMIN ">
					<a href="./admin/index?type=department">机构</a>
				</sec:authorize>
				<sec:authorize ifAnyGranted="AUTH_STAT">
					<a href="./admin/index?type=stat">统计</a>
				</sec:authorize>
				<sec:authorize
					ifAnyGranted="AUTH_SYSTEM_ADMIN_HIGH, AUTH_SYSTEM_ADMIN">
					<a href="./admin/index?type=system">系统</a>
				</sec:authorize>


			</div>
			<div class="toolbar">
				<span>欢迎： <sec:authentication property="principal.staffName" />&nbsp;&nbsp;&nbsp;&nbsp;
				</span> <a href="./handbook.pdf" target="_blank">用户手册</a>
				<sec:authorize ifAnyGranted="AUTH_ADMIN_CHANGE_PASSWORD">
					<a href="javascript:void(0)" id="menu-user"
						onclick="changePassword();"><img
						src="./images/icons/glyphicons_003_user.png" alt="user">修改密码</a>
				</sec:authorize>
				<a href="javascript:void(0)" id="menu-logout"><img
					src="./images/icons/glyphicons_387_log_out.png" alt="logout">退出系统</a>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${type eq 'system'}">
			<div data-options="region:'west'" title="系统管理" style="width: 15%;">

				<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="用户管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<li><div onclick="adminUserManagement();">系统用户</div></li>
						</ul>
					</div>
					<sec:authorize ifAnyGranted="AUTH_SYSTEM_ADMIN_HIGH ">
						<div title="权限控制" data-options="iconCls:'icon-9'"
							style="overflow: auto; padding-top: 10px;">
							<ul class="easyui-tree">
								<!--    <li><div onclick="userManagement();">用户管理</div></li> -->
								<li><div onclick="roleManagement();">角色管理</div></li>
								<li><div onclick="authorityManagement();">权限管理</div></li>
								<li><div onclick="resourceManagement();">资源管理</div></li>
							</ul>
						</div>
					</sec:authorize>
					<sec:authorize ifAnyGranted=" AUTH_SYSTEM_ADMIN">
						<div title="系统配置" data-options="iconCls:'icon-9'"
							style="overflow: auto; padding-top: 10px;">
							<ul class="easyui-tree">
								<li><div onclick="systemProperty();">系统参数配置</div></li>
								<li><div onclick="dictionaryManagement();">数据字典</div></li>
								<!-- 	<li><div onclick="statisticalInformation();">统计信息</div></li> -->
							</ul>
						</div>
					</sec:authorize>
					<div title="辅助管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<li><div onclick="scheduleJob();">定时任务</div></li>
							<li><div onclick="interfaceManagement();">接口管理</div></li> <
						</ul>
					</div>
				</div>
				<script type="text/javascript">
					$(function() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/adminUser");
					});
					function defaultImages() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/defaultImages/index");
					}
					function menuProperty() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/menuProperty/index");
					}
					function sensitiveWordProperty() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/sensitiveWordProperty/index");
					}
					function searchProperty() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/searchProperty/index");
					}
					function dictionaryManagement() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/dictionaryManagement");
					}
					function statisticalInformation() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/statisticalInformation");
					}
					function roleManagement() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/roleManagement");
					}
					function authorityManagement() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/authorityManagement");
					}
					function resourceManagement() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/resourceManagement");
					}
					function interfaceManagement() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/interfaceManagement");
					}
					function systemProperty() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/systemProperty/index");
					}
					function weixinProperty() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/weixinConfigProperty/index");
					}
					function weiboProperty() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/weiboConfigProperty/index");
					}
					function qqProperty() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/qqConfigProperty/index");
					}
					function demandProperty() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/demandFormProperty/index");
					}
					function scheduleJob() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/scheduleManagement");
					}
					function emailModelManagement() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/emailModelManagement");
					}
					function chartManagement() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/chartManagement");
					}
					function adminUserManagement() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/adminUser");
					}
					function commonUserManagement() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/commonUser");
					}
					function realNameUserManagement() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/realNameUser");
					}
					function pictureHouse() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/picture/daotu");
					}
					function avatarManagement() {
						window.parent.$('#center-frame').attr("src",
								"./admin/system/picture/avatar");
					}
				</script>

			</div>
		</c:when>
		<c:when test="${type eq 'category'}">
			<div data-options="region:'west'" title="险种管理" style="width: 15%;">
				<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="险种管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul id="allInsuType" class="easyui-tree">
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(function() {
					window.parent.$('#center-frame').attr("src",
							"./admin/category/categoryManagement");
					$
							.ajax({
								url : './admin/category/buildTree',
								type : 'POST',
								timeout : 5000,
								success : function(data) {
									var treeJson = eval(data);
									$('#allInsuType')
											.tree(
													{
														data : treeJson,

														onClick : function(node) {
															if ($(
																	'#allInsuType')
																	.tree(
																			'isLeaf',
																			node.target)) {
																window.parent
																		.$(
																				'#center-frame')
																		.attr(
																				"src",
																				"./admin/category/categoryManagement?leafId="
																						+ node.id);
															} else {
																window.parent
																		.$(
																				'#center-frame')
																		.attr(
																				"src",
																				"./admin/category/categoryManagement?parentId="
																						+ node.id);
															}
														}
													});
								}
							});
				});
				function basicCategory() {
					window.parent.$('#center-frame').attr("src",
							"./admin/category/categoryManagement?parentId=0");
				}
			</script>
		</c:when>

		<c:when test="${type eq 'insurance'}">
			<div data-options="region:'west'" title="保单管理" style="width: 15%;">
				<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="保单管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<sec:authorize ifAnyGranted="AUTH_INSURANCE_BUSINESS ">
								<li><div onclick="insuranceManagement();">保单管理</div></li>
							</sec:authorize>
							<sec:authorize ifAnyGranted="AUTH_INSURANCE_SUPERVISION ">
								<li><div onclick="insuranceShow();">保单查看</div></li>
							</sec:authorize>
							<sec:authorize ifAnyGranted="AUTH_INSURANCE_BUSINESS ">
								<!-- 权限 需要更改 -->
								<li><div onclick="incomeConfirmManagement();">收入管理</div></li>
							</sec:authorize>
						</ul>
					</div>
					<sec:authorize
						ifAnyGranted="AUTH_INSURANCE_CHECK , AUTH_ENDORSEMENT_CHECK ,AUTH_SURRENDER_CHECK">
						<div title="审核管理" data-options="iconCls:'icon-9'"
							style="overflow: auto; padding-top: 10px;">
							<ul class="easyui-tree">
								<sec:authorize ifAnyGranted="AUTH_INSURANCE_CHECK">
									<li><div onclick="insuranceCheck();">保单审核</div></li>
								</sec:authorize>
								<sec:authorize ifAnyGranted="AUTH_SURRENDER_CHECK">
									<li><div onclick="cancelCheck();">退保审核</div></li>
								</sec:authorize>
								<sec:authorize ifAnyGranted="AUTH_ENDORSEMENT_CHECK ">
									<li><div onclick="endorsementCheck();">批单审核</div></li>
								</sec:authorize>
							</ul>
						</div>
					</sec:authorize>
				</div>
			</div>
			<script type="text/javascript">
				$(function() {
					window.parent.$('#center-frame').attr("src",
							"./admin/insurance/insuranceManagement");
				});
				function insuranceManagement() {
					window.parent.$('#center-frame').attr("src",
							"./admin/insurance/insuranceManagement");
				}
				function insuranceShow() {
					window.parent.$('#center-frame').attr("src",
							"./admin/insurance/insuranceShow");
				}
				function incomeConfirmManagement() {
					window.parent.$('#center-frame').attr("src",
							"./admin/insurance/incomeConfirmManagement");
				}
				function insuranceCheck() {
					window.parent.$('#center-frame').attr("src",
							"./admin/insurance/insuranceCheck");
				}
				function cancelCheck() {
					window.parent.$('#center-frame').attr("src",
							"./admin/insurance/cancelCheck");
				}
				function endorsementCheck() {
					window.parent.$('#center-frame').attr("src",
							"./admin/insurance/endorsementCheck");
				}
			</script>
		</c:when>

		<c:when test="${type eq 'contract'}">
			<div data-options="region:'west'" title="合同管理" style="width: 15%;">
				<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="合同管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<sec:authorize ifAnyGranted=" AUTH_INSURANCE_BUSINESS">
								<li><div onclick="contractManagement();">合同管理</div></li>
							</sec:authorize>
							<sec:authorize ifAnyGranted=" AUTH_CONTRACT_SUPERVISION">
								<li><div onclick="contractShow();">合同查看</div></li>
							</sec:authorize>
						</ul>
					</div>
					<sec:authorize ifAnyGranted="AUTH_CONTRACT_CHECK ">
						<div title="审核管理" data-options="iconCls:'icon-9'"
							style="overflow: auto; padding-top: 10px;">
							<ul class="easyui-tree">
								<li><div onclick="contractCheck();">合同审核</div></li>
							</ul>
						</div>
					</sec:authorize>
				</div>
			</div>
			<script type="text/javascript">
				$(function() {
					window.parent.$('#center-frame').attr("src",
							"./admin/contract/contractManagement");
				});
				function contractManagement() {
					window.parent.$('#center-frame').attr("src",
							"./admin/contract/contractManagement");
				}
				function contractShow() {
					window.parent.$('#center-frame').attr("src",
							"./admin/contract/contractShow");
				}
				function contractCheck() {
					window.parent.$('#center-frame').attr("src",
							"./admin/contract/contractCheckManagement");
				}
			</script>
		</c:when>

		<c:when test="${type eq 'material'}">
			<div data-options="region:'west'" title="资料管理" style="width: 15%;">
				<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="资料管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<li><div onclick="materialManagement();">资料管理</div></li>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(function() {
					window.parent.$('#center-frame').attr("src",
							"./admin/material/materialManagement");
				});
				function materialManagement() {
					window.parent.$('#center-frame').attr("src",
							"./admin/material/materialManagement");
				}
			</script>
		</c:when>

		<c:when test="${type eq 'customer' }">
			<div data-options="region:'west'" title="客户管理" style="width: 15%;">
				<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="客户管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<li><div onclick="customerManagement();">客户管理</div></li>
						</ul>
					</div>
					<div title="客户负责人管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<li><div onclick="customerLeaderManagement();">客户负责人管理</div></li>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(function() {
					window.parent.$('#center-frame').attr("src",
							"./admin/customer/customerManagement");
				});
				function customerManagement() {
					window.parent.$('#center-frame').attr("src",
							"./admin/customer/customerManagement");
				}
				function customerLeaderManagement() {
					window.parent.$('#center-frame').attr("src",
							"./admin/customer/customerLeaderManagement");
				}
			</script>
		</c:when>

		<c:when test="${type eq 'company' }">
			<div data-options="region:'west'" title="保险公司管理" style="width: 15%;">
				<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="保险公司基本信息管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree" id="allCompany">
						</ul>
					</div>
					<div title="保险公司负责人管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree" id="allCompanyLeader">
						</ul>

					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(function() {
					window.parent.$('#center-frame').attr("src",
							"./admin/company/companyManagement");
					$
							.ajax({
								url : './admin/company/findCompanyTree',
								type : 'POST',
								timeout : 5000,
								success : function(data) {
									var treeJson = eval(data);
									$('#allCompany')
											.tree(
													{
														data : treeJson,
														onClick : function(node) {
															if ($('#allCompany')
																	.tree(
																			'isLeaf',
																			node.target)) {
																window.parent
																		.$(
																				'#center-frame')
																		.attr(
																				"src",
																				"./admin/company/companyManagement?leafId="
																						+ node.id);
															} else {
																window.parent
																		.$(
																				'#center-frame')
																		.attr(
																				"src",
																				"./admin/company/companyManagement?parentId="
																						+ node.id);
															}
														}
													});
									$('#allCompanyLeader')
											.tree(
													{
														data : treeJson,
														onClick : function(node) {
															window.parent
																	.$(
																			'#center-frame')
																	.attr(
																			"src",
																			"./admin/company/companyLeaderManagement?companyId="
																					+ node.id);
														}
													});
								}
							});
				});
				function companyManagement() {
					window.parent.$('#center-frame').attr("src",
							"./admin/company/companyManagement");
				}
				function companyLeaderManagement() {
					window.parent.$('#center-frame').attr("src",
							"./admin/company/companyLeaderManagement");
				}
			</script>
		</c:when>

		<c:when test="${type eq 'department'}">
			<div data-options="region:'west'" title="机构管理" style="width: 15%;">
				<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="机构信息管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul id="allDepartment" class="easyui-tree">
						</ul>
					</div>
					<div title="机构负责人管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<li><div onclick="leaderManagement();">负责人信息管理</div></li>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(function() {
					window.parent.$('#center-frame').attr("src",
							"./admin/department/departmentManagement");
					$
							.ajax({
								url : './admin/department/findDepartmentTree',
								type : 'POST',
								timeout : 5000,
								success : function(data) {
									var treeJson = eval(data);
									$('#allDepartment')
											.tree(
													{
														data : treeJson,
														onClick : function(node) {
															if ($(
																	'#allDepartment')
																	.tree(
																			'isLeaf',
																			node.target)) {
																window.parent
																		.$(
																				'#center-frame')
																		.attr(
																				"src",
																				"./admin/department/departmentManagement?leafId="
																						+ node.id);
															} else {
																window.parent
																		.$(
																				'#center-frame')
																		.attr(
																				"src",
																				"./admin/department/departmentManagement?parentId="
																						+ node.id);
															}
														}
													});
								}
							});
				});

				function leaderManagement() {
					window.parent.$('#center-frame').attr("src",
							"./admin/department/leaderManagement");
				}
			</script>
		</c:when>

		<c:when test="${type eq 'staff' }">
			<div data-options="region:'west'" title="人员管理" style="width: 15%;">
				<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="人员管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<li><div onclick="staffManagement();">人员管理</div></li>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(function() {
					window.parent.$('#center-frame').attr("src",
							"./admin/staff/staffManagement");
				});
				function staffManagement() {
					window.parent.$('#center-frame').attr("src",
							"./admin/staff/staffManagement");
				}
			</script>
		</c:when>

		<c:when test="${type eq 'stat' }">
			<div data-options="region:'west'" title="数据统计" style="width: 15%;">
				<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="报表" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<li><div onclick="stat('CTG-001');">产险业务</div></li>
							<li><div onclick="stat('CTG-002');">人身险业务</div></li>
						</ul>
					</div>
					<div title="统计" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<li><div onclick="customerStat('');">客户统计</div></li>
							<li><div onclick="companyStat('');">保险公司统计</div></li>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(function() {
					stat('CTG-001');
				});
				function stat(id) {
					window.parent.$('#center-frame').attr("src",
							"./admin/stat/insurance?number=" + id);
				}
				function customerStat(number) {
					window.parent.$('#center-frame').attr("src",
							"./admin/stat/customerStat?number=" + number);
				}
				function companyStat(number) {
					window.parent.$('#center-frame').attr("src",
							"./admin/stat/companyStat?number=" + number);
				}
			</script>
		</c:when>

		<c:when test="${type eq 'invoice'}">
			<div data-options="region:'west'" title="发票管理" style="width: 15%;">
				<div class="easyui-accordion" data-options="fit:true,border:false">
					<div title="发票管理" data-options="iconCls:'icon-9'"
						style="overflow: auto; padding-top: 10px;">
						<ul class="easyui-tree">
							<sec:authorize ifAnyGranted=" AUTH_INVOICE_MANAGEMENT">
								<li><div onclick="invoiceManagement();">发票查看</div></li>
							</sec:authorize>
							<sec:authorize ifAnyGranted=" AUTH_INVOICE_MANAGEMENT">
								<li><div onclick="invoiceApplication();">发票申请</div></li>
							</sec:authorize>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(function() {
					window.parent.$('#center-frame').attr("src",
							"./admin/invoice/invoiceManagement");
				});
				function invoiceManagement() {
					window.parent.$('#center-frame').attr("src",
							"./admin/invoice/invoiceManagement");
				}
				function invoiceApplication() {
					window.open("./admin/invoice/invoiceApplication");
				}
			</script>
		</c:when>

		<c:otherwise>
			<div data-options="region:'west'" style="width: 15%;">
				<div class="easyui-accordion" data-options="fit:true,border:false">
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<div data-options="region:'center'" style="width: 100%;">
		<iframe id="center-frame" scrolling="auto" frameborder="0"
			style="width: 100%; height: 100%;" marginwidth="0" marginheight="0"></iframe>
	</div>

	<div style="display: none;">
		<form action="./admin/j_spring_security_logout" method="post">
			<input type="submit" id="admin-logout" value="退出" />
			<sec:csrfInput />
		</form>
	</div>

	<script type="text/javascript">
		$(function() {
			$('#menu-logout').click(function() {
				$('#admin-logout').click();
			})
		})
		function changePassword() {
			window.parent.$('#center-frame').attr("src",
					"./admin/changePassword");
		}
	</script>
</body>
</html>