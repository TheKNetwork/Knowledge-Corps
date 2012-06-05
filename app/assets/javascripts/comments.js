$(document).ready(function(){
	$(".comments").click(function(){
		$("#comments").show("slow");
		$("#container").fadeTo('slow', 0.33);
	});
	$("#close_button").click(function(){
		$("#comments").hide("slow");
		$("#container").fadeTo('slow', 1.0);
	});
});