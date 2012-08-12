$(function() {
	$(".section img").hover(function() {
		$("#contentTable").html("");
		$(this).addClass("hover-highlight");
		$(".section img:not('.hover-highlight')").stop().animate({ opacity: .4 }, 300);
		
		var sectionCode = $(this).parent().attr("id");
		var sectionName = ""
		switch (sectionCode) {
			case "AUD": sectionName = "Auditing and Attestation"; break;
			case "FAR": sectionName = "Financial Accounting and Reporting"; break;
			case "REG": sectionName = "Regulation"; break;
			case "BEC": sectionName = "Business Envirnonments and Concepts"; break;
		}
		$("#sectionName").html(sectionName);
		$("#contentTable").html($("table." + sectionCode).html());
		
	}, function() {
		$(this).removeClass("hover-highlight");
		$(".section img").stop().animate( { opacity: 1 }, 300);
		$("#sectionName").html("");
		$("#contentTable").html("");
	});
});