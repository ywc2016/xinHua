function upLoadButtonClick() {
	$('#upload').dialog('open');
}

function upload() {
	var url = $('#uploadFile').filebox('getValue');
	// 判断文件格式
	var reg = new RegExp("\\.xlsx$" + "|" + "\\.xls$");
	var test = reg.test(url);
	if (test) {
		$.messager.show({
			title : '提示',
			msg : '文件格式正确.'
		});
		$('#uploadFile').filebox('clear');
		$('#upload').dialog('close');

	} else {
		$.messager.show({
			title : '提示',
			msg : '文件格式错误，请上传.xls或.xlsx文件.'
		});
		return;
	}
}

/**
 * 查询框
 */
function queryMain() {	
	$('#query').dialog('open').dialog('setTitle', '查询');
	$('#query-fm').form('clear');
}

/**
 * 查询全部
 */
function queryAllAuxiliary() {
	$('#main-table').datagrid('options').queryParams = null;
	$('#query').dialog('close');// 关闭弹出框
	$('#main-table').datagrid('reload');// 重新加载数据
}

/**
 * 查询具体
 */
function queryAuxiliary() {
	$('#main-table').datagrid('options').queryParams = {};
	var query = $('#main-table').datagrid('options').queryParams;
	if ($('#query-tableName').val() != '')
		query.webName = $('#query-webName').val();
	if ($('#query-startTime').val() != '') 
		query.navigation = $('#query-navigation').val();
	if ($('#query-classify').val() != '')
		query.classify = $('#query-classify').val();
	if ($('#query-classifyDetail').val() != '')
		query.classifyDetail = $('#query-classifyDetail').val();	
	if ($('#query-url').val() != '')
		query.url = $('#query-url').val();
	if ($('#query-webLevel').val() != '')
		query.webLevel = $('#query-webLevel').val();
	if ($('#query-ranking').val() != '')
		query.ranking = $('#query-ranking').val();
	if ($('#query-belonging').val() != '')
		query.belonging = $('#query-belonging').val();
	$('#main-table').datagrid('reload'); // 刷新页面
	$('#query-fm').form('clear');
	$('#query').dialog('close');
}

/*
 * 修改
 */
function editAuxiliary() {	
	$('#edit-fm').form('submit', {
		url : './admin/system/interface/update?'
			+ _csrf.toString(),
		onSubmit : function() {
			return $(this).form('validate');
		},
		success : function(result) {
			$('#edit').dialog('close'); // 关闭弹出框
			$('#main-table').datagrid('reload'); // 重新加载数据
		}
	});
}