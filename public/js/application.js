$(document).ready(function() {
	for (var i=1; i<8; i++) {
		var thisColumn = 'c' + i;
		$("#board").append("<div class='column-div'><a href='/photos/show/" + i + "'><img src='imgs/look" + i + ".jpg'></a></div>");
	};
});
