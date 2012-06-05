$(document).ready(function() {
	// $(".faq-leftside").hide();
	// $(".faq-rightside").hide();
	$("#expand-donations").click(function() {
		if ($(this).html().trim() === "[+]") {
			show($(".faq-donations"), this);
		} else {
			hide($(".faq-donations"), this);
		}
 	});
 	$("#expand-projects").click(function() {
		if ($(this).html().trim() === "[+]") {
			show($(".faq-projects"), this);
		} else {
			hide($(".faq-projects"), this);
		}
 	});
 	$("#expand-support").click(function() {
		if ($(this).html().trim() === "[+]") {
			show($(".faq-support"), this);
		} else {
			hide($(".faq-support"), this);
		}
 	});
 	$("#expand-interested").click(function() {
		if ($(this).html().trim() === "[+]") {
			show($(".faq-interested"), this);
		} else {
			hide($(".faq-interested"), this);
		}
 	});
});

function show(container, clickedObject) {
	container.find('.faq-leftside').hide();
	container.find('.faq-rightside').hide();
	container.addClass("show");
	container.find('.faq-leftside').slideDown("slow");
	container.find('.faq-rightside').slideDown("slow");
	$(clickedObject).html(" [-] ");
};

function hide(container, clickedObject) {
	container.find('.faq-leftside').slideUp("fast");
	container.find('.faq-rightside').slideUp("fast");
	$(clickedObject).html(" [+] ");
};
























// 	(function() {
// 		$("#expand-donations").click(function() {

// 		});
// 	});
// 	$("#expand-projects").hide().click(function () {
		
// 	});
// 	$("#expand-support").hide().click(function() {

// 	});
// 	$("#expand-interested").hide().click(function() {

// 	});
// });