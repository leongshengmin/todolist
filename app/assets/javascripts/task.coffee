$(document).ready(function() {

	$("#search_results_modal").html("<%= escape_javascript(render :partial => 'modal_for_search') %>");
	$("#search-modal").modal("show");

	  $("#close-btn").click(function() {
	    $('#search-modal').modal('hide');
	});
});