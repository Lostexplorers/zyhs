<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="static/css/testOnline-programmer.css" />
<script src="http://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/tooltip.js"></script>
<script type="text/javascript" src="static/js/popover.js"></script>
<title>商品编辑</title>
</head>
<body style="background-color: #E5E5E5; padding: 0px;">
	<jsp:include page="include-mainNavbar.jsp"></jsp:include>
	<div>
		<style>
* {
	color: #262626;
}

.questionCont {
	border-radius: 5px;
	margin-top: 20px;
	width: 1100px;
	margin-left: auto;
	margin-right: auto;
	background-color: white;
	height: 1120px;
}

.cont-right {
	width: 950px;
	float: left;
	color: #737373;
	padding-left: 33px;
	padding-right: 33px;
}

.tableImg {
	display: none;
	position: absolute;
}
</style>


		<div class="questionCont">
			<jsp:include page="include-mainTab.jsp"></jsp:include>
			<script>
				$('#nav-ul').children('li:nth-child(2)').addClass('visiting');
			</script>

			<style>
.table-input {
	width: 550px;
	border: none;
	background-color: transparent;
}
</style>
			<div class="cont-right">
				<h3>
					<a href="editOrder.action?id=${orderGood.blOrderId}">订单编辑</a>--> <a
						href="setGood.action?blOrderId=${orderGood.blOrderId}">商品管理</a>
					-->物品编辑
				</h3>
				<hr />
				<hr />
				<form action="submitEditOrderGoods.action" method="post">
					<table class="table table-striped ">
						<tr>
							<td>id：</td>
							<td><input name="goodsId" id="goodsId" type="text"
								value="${orderGood.goodsId}" class="table-input"
								readonly="readonly" required="true" /> <input name="blOrderId"
								type="text" value="${orderGood.blOrderId}" hidden></td>
						</tr>
						<tr>
							<td>商品一级分类id：</td>
							<td><input name="goodsLevelId" type="text"
								value="${orderGood.goodsLevelId}" class="table-input"
								style="font-size: 20px; color: #66AFE9;" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>商品名称：</td>
							<td><input name="goodsType" type="text"
								value="${orderGood.goodsType }" class="table-input"
								style="font-size: 20px; color: #66AFE9;" /></td>
						</tr>
						<tr>
							<td>商品价格：</td>
							<td>
								${orderGood.goodsPrice }
							</td>
						</tr>
						<tr>
							<td>商品介绍：</td>
							<td><input name="introduce" type="text"
								value="${orderGood.introduce }" class="table-input" /></td>
						</tr>
						<tr>
						<td>缺失零件：</td>
						<td>${orderGood.missingTools}</td>
						</tr>
						     
						<tr>
							<td>详情图片：</td>
							<td><input type="button" value="详情图片1" class="tableButton"
								id="uploadButton1"> <img src="${orderGood.imageUrl1}"
								alt="" name="flag1" class="tableImg" width="200" height="130">
								<input type="text" name="imageUrl1" id="imgurl1"
								value="${orderGood.imageUrl1}" hidden> <input
								type="button" value="详情图片2" class="tableButton"
								id="uploadButton2"> <img src="${orderGood.imageUrl2}"
								alt="" name="flag2" class="tableImg" width="200" height="130">
								<input type="text" name="imageUrl2" id="imgurl2"
								value="${orderGood.imageUrl2}" hidden> <input
								type="button" value="详情图片3" class="tableButton"
								id="uploadButton3"> <img src="${orderGood.imageUrl3}"
								alt="" name="flag3" class="tableImg" width="200" height="130">
								<input type="text" name="imageUrl3" id="imgurl3"
								value="${orderGood.imageUrl3}" hidden></td>
						</tr>
					</table>
					<script type="text/javascript">
						$(function() {
							$('[data-toggle="tooltip"]').tooltip()
						})
					</script>
					<hr>
					<input type="submit" class="form-button"
						style="margin-left: 400px;" value="提交" />
				</form>
			</div>
		</div>

	</div>

	<div hidden>
		<input type="file" name="upfile1" id="file1" accept="image/*"
			onchange="upload1()">
	</div>

	<div hidden>
		<input type="file" name="upfile2" id="file2" accept="image/*"
			onchange="upload2()">
	</div>

	<div hidden>
		<input type="file" name="upfile3" id="file3" accept="image/*"
			onchange="upload3()">
	</div>

	<script>
		var imgTarget;
		var inputTarget;

		$('#uploadButton1').click(function() {
			imgTarget = $(this).next();
			inputTarget = $('#imgurl1');
			$('#file1').click();
		});
		$('#uploadButton2').click(function() {
			imgTarget = $(this).next();
			inputTarget = $('#imgurl2');
			$('#file2').click();
		});
		$('#uploadButton3').click(function() {
			imgTarget = $(this).next();
			inputTarget = $('#imgurl3');
			$('#file3').click();
		});

		function upload1() {
			var fd = new FormData();
			fd.append('upfile1', $('#file1')[0].files[0]);
			$.ajax({
				url : 'ueditor/jsp/controller.jsp?action=uploadimage',
				data : fd,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					let temp = data;
					updatePage1(temp);
				}
			});
		}

		function upload2() {
			var fd = new FormData();
			fd.append('upfile2', $('#file2')[0].files[0]);
			$.ajax({
				url : 'ueditor/jsp/controller.jsp?action=uploadimage',
				data : fd,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					let temp = data;
					updatePage2(temp);
				}
			});
		}

		function upload3() {
			var fd = new FormData();
			fd.append('upfile3', $('#file3')[0].files[0]);
			$.ajax({
				url : 'ueditor/jsp/controller.jsp?action=uploadimage',
				data : fd,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					let temp = data;
					updatePage3(temp);
				}
			});
		}

		function updatePage1(data) {
			let obj = JSON.parse(data);
			if (obj.state === "SUCCESS") {
				inputTarget.val(obj.url);
				imgTarget.attr('src', obj.url);
			} else {
				notify('#add .modal-body', '上传封面失败!', 'warning');
			}

			if (imgTarget.attr('name') === 'flag1') {
				let id = $('#goodsId').val();
				$.ajax({
					url : "modifyOrderGoods.action",
					data : {
						goodsId : id,
						imageUrl1 : obj.url
					},
					fail : function() {
						notify('.cont-right', '设置失败', 'warning');
					},
					success : function() {
						notify('.cont-right', '设置成功', 'success');
						window.location.url = '/backer/orderGoods.jsp';
					}
				})
			}
		}
		function updatePage2(data) {
			let obj = JSON.parse(data);
			if (obj.state === "SUCCESS") {
				inputTarget.val(obj.url);
				imgTarget.attr('src', obj.url);
			} else {
				notify('#add .modal-body', '上传封面失败!', 'warning');
			}

			if (imgTarget.attr('name') === 'flag2') {
				let id = $('#goodsId').val();
				$.ajax({
					url : "modifyOrderGoods.action",
					data : {
						goodsId : id,
						imageUrl2 : obj.url
					},
					fail : function() {
						notify('.cont-right', '设置失败', 'warning');
					},
					success : function() {
						notify('.cont-right', '设置成功', 'success');
						window.location.url = '/backer/orderGoods.jsp';
					}
				})
			}
		}
		function updatePage3(data) {
			let obj = JSON.parse(data);
			if (obj.state === "SUCCESS") {
				inputTarget.val(obj.url);
				imgTarget.attr('src', obj.url);
			} else {
				notify('#add .modal-body', '上传封面失败!', 'warning');
			}

			if (imgTarget.attr('name') === 'flag3') {
				let id = $('#goodsId').val();
				$.ajax({
					url : "modifyOrderGoods.action",
					data : {
						goodsId : id,
						imageUrl3 : obj.url
					},
					fail : function() {
						notify('.cont-right', '设置失败', 'warning');
					},
					success : function() {
						notify('.cont-right', '设置成功', 'success');
						window.location.url = '/backer/orderGoods.jsp';
					}
				})
			}
		}
	</script>

	<!-- 配置文件 -->
	<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".tableButton").mouseover(function() {
				$(this).next().show(100);
			}).mouseout(function() {
				$(this).next().hide(100);
			});

		});

		var ue = UE.getEditor('content', {
			autoHeightEnabled : false
		});

		function notify(container, result, modal) {
			$(container)
					.prepend(
							'<div class="alert alert-'
            + modal +' alert-dismissible" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <strong>'
									+ result
									+ '</strong>&nbsp; '
									+ message
									+ '</div>');
		}
	</script>


</body>
</html>
