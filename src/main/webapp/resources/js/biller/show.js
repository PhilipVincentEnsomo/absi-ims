var id = -1;

var log = function(message) {
	if (console && console.log) {
		console.log(message);
	}
}

$(function () {
	
	var $tabs = $("#tabs");
	$tabs.tabs();
	
	var displayedTab = getUrlParameter('displayedTab');
	
	if (displayedTab == 'paymentModes') {
		$tabs.tabs("option", "active", 1);
	} else if (displayedTab == 'products') {
		$tabs.tabs("option", "active", 2);
	} else if (displayedTab == 'paymentChannels') {
		$tabs.tabs("option", "active", 3);
	}
	
	var paymentFormId =$("div.view-biller").data("payment-form-id"),
		billerId = $("div.view-biller").data("biller-id"),
		configId = $("div.view-biller").data("config-id");


	$.ajax("../load/" + paymentFormId, {
		success: function(data, txetStatus, jxhr) {
			if (!data) {
				return;
			}
			
			var $fieldsTable = $("#fields-table");
			
			$fieldsTable.jqGrid({
		    	data: data.paymentForm.fields,
		        datatype: "local",
		        mtype: "GET",
		        hoverrows: false,
		        colNames: ["Label", "Field Type", "Enabled", "Tooltip"],
		        colModel: [
		            {
		            	name: "label",
		            	width: 150 ,
		            	editable:true,
		            	editrules: {
		            		custom : true,
		            		custom_func : function(value, colname) {
		            			if (!value || !value.trim()) {
		            				return [false, "Label should not be empty"];
		            			}
		            			return [true];
		            		},
		            	},
	            	},
		            {
		            	name: "typeLabel",
		            	width: 120,
		            	align: "center",
		            	editable: true,
		            	edittype: "select",
		            	editoptions: {
		            		value: data.fieldTypes
		            	}
		            },
		            {
		            	name: "enabled",
		            	width: 80,
		            	align: "center",
		            	editable: true,
		            	edittype: "checkbox",
		            	formatter: function(cellValue, options, rowObject) {
		            		
		            		if (!cellValue) {
		            			return 'Yes';
		            		}
		            		
		            		return cellValue;
		            	}
		            },
		            {
		            	name: "toolTip",
		            	width: 300,
		            	align: "left" ,
		            	editable: true ,
		            	edittype: "textarea",
		            	formatter: function(cellValue, options, rowObject) {
		            		$("#fields-table").jqGrid("resetSelection");
		            		
		            		if (!cellValue) {
		            			return '';
		            		}
		            		
		            		return cellValue;
		            	}
		            }
		        ],
		        pager: "#pager",
		        
				subGrid : true,
				subGridRowExpanded: subgridRowExpanded,
		        viewrecords: true,
		        gridview: true,
		        autoencode: true,
		        reloadAfterSubmit: true,
		        height: 'auto',
		        caption: "Biller Form Builder",
		        editurl: contextPath + "/paymentForm/saveField/" + paymentFormId,
		        rowList: [],        // disable page size dropdown
		        pgbuttons: false,     // disable page control like next, back button
		        pgtext: null,         // disable pager text like 'Page 0 of 10'
		        viewrecords: false    // disable current view record text like 'View 1-10 of 100' 
		    });
			
			$fieldsTable.jqGrid("navGrid", "#pager", 
				{add : false, 
				cancel:false,
				edit:false, 
				del: true,
				refresh: false,
				search:false,},
				// EDIT
				null, 
				// Add Options
				null,
				//DELETE
				{
					url: '../deleteField/' + billerId,
				}
			);
			
			$fieldsTable.jqGrid("inlineNav", "#pager", {
				addParams : {
					addRowParams : {
						aftersavefunc : function (rowId, response) {
							var responseJSON = $.parseJSON(response.responseText),
								newRowId = responseJSON.id;
							$("#" + rowId).attr("id", newRowId);
						}
				
					}
				}
			});
			
			$fieldsTable.find("tbody").sortable({
				update: function sortRow(event, ui) {
					var startIndex = $(ui.item).parent().children().index(ui.item),
					paymentFormId = $("div.view-biller").data("payment-form-id"),
					itemId = $(ui.item).attr("id");

					$.post(
						contextPath + "/paymentForm/saveSort/",
					    {
					    	id: itemId,
					    	startIndex: startIndex,
					    	paymentFormId: paymentFormId
					    }
						
					);
				}
			});
			
		}
	});
	
	var subgridRowExpanded = function(subgridId, mainGridRowId) {
		var lastSel;
		
		$.get(
			contextPath + "/form/field/" + mainGridRowId + "/validators", {},
			function(jsonData) {
				var tableId = subgridId + "_t";
				
				var tableHtml = '<table id="'+ tableId +'" class="scroll"></table><div><button class="edit-validations">Edit Validations</button></div>';
				
				var $cell = $("#" + subgridId);
				$cell.html(tableHtml);
				
				var $subgrid = $("#" + tableId);
				
				$subgrid.jqGrid({
			    	data: jsonData.validations,
			        datatype: "local",
			        mtype: "GET",
			        hoverrows: false,
			        colNames: ["Type", "Parameter", "Error Message",],
			        colModel:[
						{
							name:'type',
							editable:true,
							width:130,
							sortable: false,
						},
						
						{
							name:'parameter',
							index:'parameter',
							editable:true,
							width:120,
			            	align: "center",
							sortable: false
						},
						
						{
							name:'errorMessage',
							index:'errorMessage',
							editable:true,
							width:300,
							sortable: false
						}
					],
			        viewrecords: true,
			        gridview: true,
			        autoencode: true,
			        reloadAfterSubmit: true,
			        height: 'auto',
			        caption: "Validations",
			        beforeSelectRow: function(rowid, e) {
			            return false;
			        },
			        editurl: contextPath + "/form/field/" + paymentFormId + "/validator/save",
			        rowList: [],        // disable page size dropdown
			        pgbuttons: false,     // disable page control like next, back button
			        viewrecords: false    // disable current view record text like 'View 1-10 of 100' 
			    });
				
				var pagerId = "p_" + tableId;
				var pagerSelector = "#" + pagerId;
				
				$cell.find("button.edit-validations").click(function(e) {
					 $("#validations-dialog").dialog({
						 modal: true,
						 width: 530,
						 buttons: {
							 Done: function() {
							 	$(this).dialog( "close" );
							 }
						 },
						 close: function(event,ui) {
							 $cell.html('');
							 subgridRowExpanded(subgridId, mainGridRowId); 
						 },
						 open: function(e, ui) {
							 var $self = $(this);
							 
							 $.get(
								contextPath + "/form/field/" + mainGridRowId + "/validators", {},
								function(jsonData) {
									
									var tableHtml = "<table id='" + tableId + "' class='scroll'></table><div id='" + pagerId + "' class='scroll'></div>";
									$self.html(tableHtml);
									
									var $subgrid = $self.find("#" + tableId);
									
									$subgrid.jqGrid({
								    	data: jsonData.validations,
								        datatype: "local",
								        mtype: "GET",
								        hoverrows: false,
								        colNames: ["Type", "Parameter", "Error Message",],
								        colModel:[
											{
												name:'type',
												editable:true,
												width:130,
												edittype: "select",
												editoptions: {
													value: jsonData.validationTypes,
													dataEvents: [{
									        			  type: 'change',
									        			  fn: function(e){
									        				  var $select = $(this);
									        				  var $parameterInput = $select.closest("tr").find("td input[name='parameter']");
									        				  
									        				  var selectedValue = this.value;
									        				  
									        				  if (selectedValue == "UNIQUE" || selectedValue == "REQUIRED" || selectedValue == "ALPHANUMERIC" || selectedValue == "NUMERIC" || selectedValue == "DECIMAL") {
									        					  // Disable input field for UNIQUE and REQURED validation types
									        					  $parameterInput.attr("disabled", "disabled");
									        				  } else {
									        					  $parameterInput.attr("disabled", false);
									        				  }
									        			  }
													}]
												}
											},
											{
												name:'parameter',
												index:'parameter',
												editable:true,
												width:120,
								            	align: "center",
												sortable: false,
												edittype: "custom",
												editoptions: {
													custom_element: function(value, editOptions) {
														
														if (value) {
															return '<input type="text" id="' + editOptions.id + '_parameter" name="parameter" style="width: 98%;" role="textbox" class="editable" value="'
															+ value
															+ '">';
														} else {
															return '<input disabled type="text" id="' + editOptions.id + '_parameter" name="parameter" style="width: 98%;" role="textbox" class="editable" value="'
															+ value
															+ '">';
														}
													},
													custom_value: function(element, operationType, param) {
														
														var value = $(element).val();
														
														if (!value) {
															return '';
														}
														
														return value;
													}
												}
											},
											{
												name:'errorMessage',
												index:'errorMessage',
												editable:true,
												width:230,
												sortable: false
											}
										],
								        pager: pagerSelector,
								        
								        viewrecords: true,
								        gridview: true,
								        autoencode: true,
								        reloadAfterSubmit: true,
								        height: 'auto',
								        caption: "Validations Builder",
								        editurl: contextPath + "/form/field/" + mainGridRowId + "/validator/save",
								        rowList: [],        // disable page size dropdown
								        pgbuttons: false,     // disable page control like next, back button
								        pgtext: null,         // disable pager text like 'Page 0 of 10'
								        viewrecords: false,    // disable current view record text like 'View 1-10 of 100'
								        
								        onSelectRow: function(id) {
								        	
								        	if (id && id != lastSel) {
								        		lastSel = id;
								        	}
								        }
								    });
									
									$subgrid.jqGrid("navGrid", pagerSelector,
										{
											add : false, 
											cancel:false,
											edit:false, 
											del: true,
											refresh: false,
											search:false,
										},
										// EDIT
										null, 
										// Add Options
										null,
										//DELETE
										{
											url: contextPath + '/form/field/validation/delete',
										}
									);
									
									$subgrid.jqGrid("inlineNav", pagerSelector);
								},
								"json"
							);
						 }
					 });
				});
			},
			"json"
		);
	}

	function getUrlParameter(sParam) {
	    var sPageURL = window.location.search.substring(1);
	    var sURLVariables = sPageURL.split('&');
	    for (var i = 0; i < sURLVariables.length; i++) {
	        var sParameterName = sURLVariables[i].split('=');
	        if (sParameterName[0] == sParam) {
	            return sParameterName[1];
	        }
	    }
	}  

	$("#deleteBillerBtn").click(function() {
		$("#deleteBillerDialog").dialog({
			 modal: true,
			 buttons: {
				 Cancel: function() {
				 	$(this).dialog( "close" );
				 },
				 Delete: function() {
					$("#biller").submit();
					 
				 	$(this).dialog( "close" );
				 }
			 }
		});
	});
});