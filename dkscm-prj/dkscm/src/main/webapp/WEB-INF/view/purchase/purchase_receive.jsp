<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="../../static/css/bootstrap.min.css">
  		<link rel="stylesheet" href="../../static/css/font-awesome.min.css">
  		<script src="../../static/js/jquery-3.4.1.min.js"></script>
		<script src="../../static/js/bootstrap.min.js"></script>
		<title></title>
		<script type="text/javascript">
			function receive(statusCode) {
				// 获得审批意见
				var receiveRemark = $("#receiveRemark").val();
				alert(receiveRemark);
				if (receiveRemark != null && receiveRemark != "") {
					// 审批有效，进行异步数据修改
					$.ajax({
						url: "",
						type: "post",
						data: {
							"receiveRemark": receiveRemark,
							"statusCode": statusCode
						},
						dataType: "json",
						success: function(data) {
							if (data) {
								alert("审批成功！");
							} else {
								alert("审批失败！");
							}
							// 关闭模态框
							parent.closeModal();
							// 页面重定向
							parent.openFrame("purchase/STORE/index", "fa fa-truck", "物资采购", "采购审批");
						}
					});
				} else {
					// 审批无效
					$("#receiveRemark").html("请填写审批意见！");
				}
			}
		</script>
	</head>
	<body>
		<div class="container" style="margin: 5px;">
			<div class="row">
				<div class="col-md-12">
					<table style="border-collapse: separate; border-spacing: 3px;">
						<tr>
							<td align="right">
								<span style="color: red;">*</span>
								<i class="fa fa-gift"></i>
								<label>领取备注：</label>
							</td>
							<td>
								<input type="text" id="receiveRemark" name="receiveRemark" class="form-control" style="width: 300px;"/>
							</td>
						</tr>
						<tr>
							<td><p></p></td>
							<td>
								<label id="receiveRemark" style="color: red;"></label>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<a href="javascript:receive('RECEIVE');" class="btn btn-success btn-sm">
									<i class="fa fa-check"></i>
									<label>确认领取</label>
								</a>
							</td>
						</tr>
					</table>
				</div>
			</div>		
		</div>
	</body>
</html>