function message(res) {
	if(res.code == true) {
		$.messager.alert("提示","操作成功");
	} else if(code == false) {
		var message = "操作失败";
		if(res.message) {
			message = res.message;
		}
		$.messager.alert("提示",message);
	} else {
		$.messager.alert("提示", code);
	}
}

function formatteFlag(value,row) {
	if(value == '0') {
		return "是";
	} else if(value == '1'){
		return "否";
	}
}