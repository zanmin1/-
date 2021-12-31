/* 加载弹框 */
function loading(){
	$("body").prepend('<div class="bg-img" id="loadingid">' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="balls"></div>' +
		'<div class="six-1"></div>' +
		'<div class="six-2"></div>' +
		'</div>');
}
loading();
function loadingEnd() {
	$("#loadingid").hide();
}
setTimeout(function () {
	loadingEnd();
},5000);


