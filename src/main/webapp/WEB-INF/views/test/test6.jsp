<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>New Document</title>
<script>
	function doLayerPopup(v) {
		var layerPopupFull = document.getElementById("layerPopupFull");
		var layerPopup = document.getElementById("layerPopup");
		if (v == "show") {
			layerPopupFull.style.display = "";
			layerPopup.style.display = "";
		} else {
			layerPopupFull.style.display = "none";
			layerPopup.style.display = "none";
		}
	}
</script>
</head>

<body>

	<div id="layerPopupFull" style="position: absolute;"></div>
	<div id="layerPopup" style="position: absolute; z-index: 10; top: 50px; display: none;">
		<button type="button" onclick="doLayerPopup('hide')">X</button>
		dd
	</div>
	<a href = "javascript:doLayerPopup('show')">dd</a>
</body>
</html>