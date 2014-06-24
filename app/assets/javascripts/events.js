$(function(){
	$('.event-button').click(function(){
		typeId = $(this).data('id');
		if (typeId == 'all') {
			$('#events-table tbody tr').show();
		} else {
			$('#events-table tbody tr').each(function(){
				if ($(this).data('eventTypeId') == typeId) $(this).show();
				else $(this).hide();
			});
		}
	});
	

});
$(function(){
	$('.table > tbody > tr').click(function() {
		//window.location.replace("localhost:3000/events/2");
});
});