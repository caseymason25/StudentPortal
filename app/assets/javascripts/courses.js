$(function(){
	$('.course-button').click(function(){
		typeId = $(this).data('id');
		if (typeId == 'all') {
			$('#courses-table tbody tr').show();
		} else {
			$('#courses-table tbody tr').each(function(){
				if ($(this).data('courseTypeId') == typeId) $(this).show();
				else $(this).hide();
			});
		}
	});
});
$(function(){
$(".open-modal").click(function () {
	 var _self = $(this);
    var course = _self.data('id');
	var res = course.split(",");
	document.getElementsByClassName("modal-title")[0].innerHTML = res[0];
    $(".modal-body #title").val(res[0]);
	$(".modal-body #description").val(res[1]);
	$(".modal-body #department").val(res[2]);
	$(".modal-body #number").val(res[3]);
	$(".modal-body #hours").val(res[4]);
	$(".modal-body #degree").val(res[5]);

});
});


$(document).ready(function(){
	$(".popup").popover({
	trigger: 'hover',
	html: 'true'
	})
});
