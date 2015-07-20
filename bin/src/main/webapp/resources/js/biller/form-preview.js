$(function() {
	var $previewButton = $("input.preview-form");
	var billerId = $("div.view-biller").data("biller-id");
	
	$previewButton.click(function(e) {
		$("#form-preview-dialog").dialog({
			 modal: true,
			 width: 650,
			 buttons: {
				 Close: function() {
				 	$(this).dialog( "close" );
				 }
			 },
			 close: function(event,ui) {
				  
			 },
			 open: function(e, ui) {
				 var $dialog = $(this);
				 
				 $.get(contextPath + "/payment/form/preview/" + billerId, {}, function(htmlData) {
					 $dialog.find("div#wrapper").html(htmlData);
					 
					 // Disable button actions
					 $dialog.find("div.payment-amounts button").click(function(e) {
						 e.preventDefault();
					 });
					 
					 $dialog.find('.date-field').datepicker({ dateFormat : "MM dd, yy"});
						
					 $dialog.find('.decimal-field').spinner({numberFormat : 'n', step : '.01'});
						
					 $dialog.find('.number-field').spinner();
				 });
			 }
		});
	});
});