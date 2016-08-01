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