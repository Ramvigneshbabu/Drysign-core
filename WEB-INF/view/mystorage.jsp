<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.authentication.AnonymousAuthenticationToken,org.springframework.security.core.Authentication" %>


<% 
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
  

<jsp:include page="header.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/2.0.8/purify.js"></script>

	<%-- <link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/responsive.bootstrap.css">
	<link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/responsive.dataTables.css"> --%>
	<link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/jquery.dataTables.min.css"> 
	<style>
	
	.dataTables_wrapper .dataTables_paginate .paginate_button{
padding:0.5px !important;
}
	.sorting_disabled{
	text-align:left !important;}
	.table-menu{
	padding-left:0px !important;}
	
	table.noborder tbody tr:first-child td strong {
	    white-space: nowrap;
   
}
	table.dataTable.display tbody td:last-child {
    
}
		table {
    background-color: transparent;
    width: 100%;
}
		.newdashboard .fa.fa-eye {
  		  color: #40505b;
    		padding-left: 4px;
}
		.table.Data_table_heading th {
    		background-color: #f2f2f2!important;
			}
		table.dataTable thead th.sorting:after, table.dataTable thead th.sorting_asc:after, table.dataTable thead th.sorting_desc:after {
			position: relative;
			top: 0;
			right: 0;
			display: inline-table;
			font-family: FontAwesome;
			left: 10px;
		}
		.tab-content {
			padding: 20px 0;
		}
		thead input {
			width: 100%;
			border: none;
			padding: 3px;
		}

		.filters input {
			width: 100%;
			padding: 3px;
			box-sizing: border-box;
			border: 0 none;
		}
		
		.nav-tabs>li>a:hover {
			border-color: transparent;
		}

		.newdashboard .nav-tabs>li>a {
			color: #666;
			padding: 10px 30px;
		}
		
		@media (max-width:800px) {
			
			.newdashboard .nav-tabs>li>a {
				padding: 10px 11px;
			}
			table#PendingTable, 
			table#SignedTable, 
			table#CompletedDocumentsTable,
			table#companies, 
			table#DraftsTable,
			table#RejectedlistTable  {
				width: 800px !important;
				
				display: block;
			}
		}
			@media (max-width:1000px) {
			table#SignedTable
				 {
				width: 800px !important;
				overflow-x: scroll;
				display: block;
			}
		}
		
		
		#SignedTable thead tr th:first-child:after,#SignedTable thead tr th:first-child:after, #CompletedDocumentsTable thead tr th:first-child:after, #companies thead tr th:first-child:after{
			visibility:hidden;
			cursor: auto;
		}

		#SignedTable th.details-control.sorting_disabled input, #SignedTable th.sorting:last-child input,
		#CompletedDocumentsTable th.details-control.sorting_disabled input, #CompletedDocumentsTable th.sorting:last-child input,
		#CompletedDocumentsTable th.details-control.sorting_disabled input, #companies th.sorting:last-child input {

			display: none;
		}
		/*table#PendingTable, 
		table#SignedTable, 
		table#CompletedDocumentsTable,
		table#companies, 
		table#DraftsTable  {
			width: 942px !important;
			overflow-x: scroll;
			display: block;
		}*/
		
		.pagination>.disabled>a, .pagination>.disabled>a:focus, .pagination>.disabled>a:hover, .pagination>.disabled>span, .pagination>.disabled>span:focus, .pagination>.disabled>span:hover,
		.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus, .pagination>li>span:hover
		{
			border:none;
			background-color: #fff;
		}
		div.dataTables_paginate li.first > a, div.dataTables_paginate li.previous > a, div.dataTables_paginate li.next > a, div.dataTables_paginate li.last > a{
			padding-left:5px;
			padding-right:5px;
		}
.dataTables_paginate.paging_full_numbers{
    text-align: right;
}
.pointer {cursor: pointer;}
	</style> 

<!-- vvv 15feb2020 for outforsign.jsp -->
	<input type="hidden" id="pageNumber" name="pageNumber" value="1"/>



<div id="loader2" class="loader2" style="display:none">
	<div class="loaderdiv">
		 <p><img src="<%=appUrl %>/images/drysign_logo_mono.svg"></p>
		<p><img src="<%=appUrl %>/images/drysign-logo-line_only.gif" ></p> 		
		<p><spring:message code="label.wait"/></p>
	</div>
</div>
  <div class="content-wrapper bg_wrap newdashboard">
            <div class="container-fluid">
                <!-- breadcrumb -->
                <ol class="breadcrumb">
                	<li class="Groupsignhead"><spring:message code="label.storage"/> |</li>
                    <li><a href="<%=appUrl %>/app/dashboard"><spring:message code="label.cat_home"/></a></li>
                    <li class="active"><spring:message code="label.storage"/> <span><i 	 class="fa fa-refresh pointer" onClick="Refresh()"></i></span></li>
                </ol>
            </div>

            <!-- Main content -->
            <div class="container-fluid">
                     		
	            <div class="Content-wh-module">
					<div class="responsiveTabs">
						<ul id="myTab" class="nav nav-tabs">
				
							<li class='active '  id="pendingTab"><a data-toggle="tab" href="#Pending"><spring:message code="label.pnding"/></a></li>
							<li id="signedTab"><a data-toggle="tab"  href="#Signed"> <spring:message code="label.sgned"/> </a></li>
							<li id="completedTab"><a data-toggle="tab"  href="#CompletedDocuments"><spring:message code="label.cmplt_doc"/></a></li>
							<li id="outForSignTab"><a data-toggle="tab"   href="#OutForSignature"><spring:message code="label.dash_outdoc"/></a></li>
							<li id="draftsTab"><a data-toggle="tab"   href="#Drafts"><spring:message code="label.drfts"/></a></li>
							<li id="rejectedlistTab"><a data-toggle="tab"   href="#Rejectedlist"><spring:message code="label.rejected"/></a></li>
						</ul>
	
						<div  id="myTabContent" class="tab-content">
							<div id="Pending" class="tab-pane fade in active accordianicon ">
								<%-- <jsp:include page="pendingbyme.jsp"></jsp:include> --%>
							</div>

							<div id="Signed" class="tab-pane fade">
							 	<%-- <jsp:include page="signedbyme.jsp"></jsp:include> --%>
							 </div>
							<%-- <div id="CompletedDocuments" class="tab-pane fade">
								<jsp:include page="completedDocuments1.jsp"></jsp:include>
							</div> --%>
							<div id="CompletedDocuments" class="tab-pane fade">
								<%-- <jsp:include page="completedDocuments1.jsp"></jsp:include> --%>
							</div>
							<div id="OutForSignature" class="tab-pane fade">
								<%-- <jsp:include page="outforsign.jsp"></jsp:include> --%>
							</div>
							<div id="Drafts" class="tab-pane fade">
								<%-- <jsp:include page="draft1.jsp"></jsp:include> --%>
							</div>
							<div id="Rejectedlist" class="tab-pane fade">
								 <%-- <jsp:include page="rejectedList.jsp"></jsp:include> --%> 
							</div>
							 <div id="datanotAvailable" style="text-align: center; display:none" >
							<br/><br/><br/><h4><spring:message code="label.nodatavail"/></h4> </div> 
						</div>
								
					</div>
	        		</div>
	        </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
 <script src="<%=appUrl %>/js/jquery.validate.js"></script>
<script src="<%=appUrl %>/js/jquery.dataTables.min.js"></script>
<script src="<%=appUrl %>/js/dataTables.bootstrap4.min.js"></script>
<%-- <script type="text/javascript" language="javascript" src="<%=appUrl %>/js/dataTables.responsive.js"></script>
<script type="text/javascript" language="javascript" src="<%=appUrl %>/js/responsive.bootstrap.js"></script> --%>
 <script src="<%=appUrl %>/js/jquery.buttonLoader.js"></script>

<!-- vvv datatble for datatable pipeline for outforsign -COMMENTED DUE TO ISSUES WITH ORDERING IN OTHER TABS IF USED-->
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script> -->
<!-- vvv datatble for datatable pipeline for outforsign -->

<script>

var href;	//keep it global to allow table data visibility with unique table when resizing to landscape view for iphone X

var dataAvailableForApi={};
dataAvailableForApi.Pending=false;
dataAvailableForApi.Signed=false;
dataAvailableForApi.OutForSignature=false;
dataAvailableForApi.drafts=false;
dataAvailableForApi.completedDocumentData=false;

dataAvailableForApi.PendingData=false;
dataAvailableForApi.SignedData=false;
dataAvailableForApi.OutForSignatureData=false;
dataAvailableForApi.draftsData=false;
dataAvailableForApi.completedDocumentDataData=false;

var appUrl;
var token;
var header;

$(document).ready(function(){
	$(".panel-title").addClass("accordianPlusicon");
	$(".collapse.show").each(function(){
    	$(this).prev(".panel-heading").find(".panel-title").addClass("accordianMinusicon").removeClass("accordianPlusicon");
    });
    
    // Toggle plus minus icon on show hide of collapse element
    $(".collapse").on('show.bs.collapse', function(){
    	$(this).prev(".panel-heading").find(".panel-title").removeClass("accordianPlusicon").addClass("accordianMinusicon");
    }).on('hide.bs.collapse', function(){
    	$(this).prev(".panel-heading").find(".panel-title").removeClass("accordianMinusicon").addClass("accordianPlusicon");
    });
	appUrl="<%=appUrl%>";
	token = $("meta[name='_csrf']").attr("content");
	header = $("meta[name='_csrf_header']").attr("content");
	  
	getSelectedTabData();
	
	var title='${title}';
	if(title=='My Files'){
		
		$("#myStorageSidebar").addClass('active');
		$("#helpSidebar").removeClass("active");
		$("#PendingCollapse").removeClass('in');	//vvv24Mar2020	$("#Pending-collapse").removeClass('in');
	}

 	 	
});

function Refresh(){
	var id=$("#myTab li.active").attr("id");
	$("input:text").val('');
    $('input').keyup();
    closeOpenTr();
	switch(id){
	/* case "pendingTab": getPendingData(); */
	case "pendingTab": getPendingData_ServerSidePagination();
		break;
	case "signedTab":  getSignData();
		break;
	/* case "completedTab":getcompleteDocumentData();
		break; */
	case "completedTab":getCompletedDocuments_ServerSidePaginationData();
	break;
	case "outForSignTab": getOutForSignatureData();
		break;
	case "draftsTab":   getDraftData();
		break;
	case "rejectedlistTab":   getRejectedData();
	break;
		
	}
}

function getSelectedTabData(){
	
  	 $('#datanotAvailable').hide();
     $("#Pending").hide();	
     $("#CompletedDocuments").hide();	
     $("#Drafts").hide();	
     $("#Signed").hide();
  	 $("#OutForSignature").hide();	
  	 $("#Rejectedlist").hide();
  	
  	// alert(location.search.indexOf())
	if (location.search.indexOf("signed")!=-1){
		$('#myTab a[href="#Signed"]').tab('show');
		
		getSignData();
		dataAvailableForApi.Signed=true;
		//add value to href to allow resizing when control comes from Dashboard
		//href="#Signed";
	}
    else if (location.search.indexOf("completed")!=-1){
		$('#myTab a[href="#CompletedDocuments"]').tab('show');
	//	getcompleteDocumentData();
		getCompletedDocuments_ServerSidePaginationData();
		dataAvailableForApi.completedDocumentData=true;		
		//add value to href to allow resizing when control comes from Dashboard
		//href="#CompletedDocuments";
	}
    else if (location.search.indexOf("outforsign")!=-1){
		$('#myTab a[href="#OutForSignature"]').tab('show');
		getOutForSignatureData();
		dataAvailableForApi.OutForSignature=true;
		//add value to href to allow resizing when control comes from Dashboard
		//href="#OutForSignature";
	}
    else if (location.search.indexOf("draft")!=-1){
		$('#myTab a[href="#Drafts"]').tab('show');
		getDraftData();
		dataAvailableForApi.drafts=true;	
		//href="#Drafts";
	}
    else if (location.search.indexOf("rejectlist")!=-1){
		$('#myTab a[href="#Rejectedlist"]').tab('show');
		getRejectedData();
		//dataAvailableForApi.drafts=true;	
		//href="#Drafts";
	}
    else{
		getPendingData_ServerSidePagination();
		dataAvailableForApi.Pending=true;
	}

}		



$(".responsiveTabs a").click(function(){
	///var href=$(this).attr('href');	//declared as global variable on top
	 href=$(this).attr('href');
	 getTabData(href);
  
 });
 
	function getTabData(href){
		
		$('#datanotAvailable').hide();
	     $("#Pending").hide();	
	     $("#CompletedDocuments").hide();	
	     $("#Drafts").hide();	
	     $("#Signed").hide();
	  	 $("#OutForSignature").hide();	
	  	 $("#Rejectedlist").hide();
	  	
	  	 $("input:text").val('');
	  	 $('input').keyup();
	     closeOpenTr();
	     
	 //  if(href.indexOf("collapse")==-1){ // for web browser
		 
		 var table;
	    switch(href){ 
	    case "#OutForSignature" :      	 
            //dataAvailableForApi.OutForSignatureRowCount = undefined so below code gets executed
            							 	$("#OutForSignature").show();	 
                                     	table=$('#companies').DataTable();
                                  		table.search('').draw();
            							
            							//below code commented as DataNotAvailable cond is taken care in outforsign..page 
            							/* if(dataAvailableForApi.OutForSignatureRowCount != 0){
                                     	 $("#OutForSignature").show();	 
                                     	 table=$('#companies').DataTable();
                                  		  table.search('').draw();
  										//closeOpenTr();
                                      }
                                      else{
                                     	 $('#datanotAvailable').show();	//showed from table
                                      }  */
                                    ///  $("#OutForSignature").show();	
                                	                            
 		break;
	    case "#CompletedDocuments": 		
	    	   								if(dataAvailableForApi.CompletedDocumentsRowCount!=0){
	          	 								$("#CompletedDocuments").show();	 
	          	 								 table=$('#CompletedDocumentsTable').DataTable();
	    										table.search('').draw();
	    										//closeOpenTr();
	           								}
	           								else{
	          	 								$('#datanotAvailable').show();
	           								}
				 	
	        						
	        					
	    break;
	    case "#Drafts": 				  /*  if(dataAvailableForApi.DraftsRowCount!=0){
			$("#Drafts").show();	
			 table=$('#DraftsTable').DataTable();
			table.search('').draw();
			//closeOpenTr();
			}
			else{
				$('#datanotAvailable').show();
			} */
			
										    $("#Drafts").show();	 
									    	table=$('#DraftsTable').DataTable();
									 		table.search('').draw();

		break;
	    case "#Pending": 		     		//$('.nav-tabs a[href="#Pending"]').tab('show');
	    	 								if(dataAvailableForApi.PendingRowCount!=0){
											$("#Pending").show();
											table=$('#PendingTable').DataTable();
										
											table.search('').draw();
											//closeOpenTr();
	    	 								}else{
	    	 									$('#datanotAvailable').show();
	    	 								}
										

	    break;
	    case "#Signed": 					/*$("#pageNumber").val(1);
									   		 $("#Signed").show();*/
									    	 if(dataAvailableForApi.SignedRowCount!=0){	
											$("#Signed").show();
										    table=$('#SignedTable').DataTable();
											table.search('').draw();
											//closeOpenTr();
	    									}
	   										 else{
	   										$('#datanotAvailable').show();
	    									} 
										
	    								
	    break; 
	    case "#Rejectedlist": 		 if(dataAvailableForApi.RejectedRowCount!=0){	
	    								$('#datanotAvailable').hide();
										//closeOpenTr();
										}
											 else{
											$('#datanotAvailable').show();
										} 
									
		
break; 
	    
	    
	    case "#PendingCollapse": 	table=$('#PendingTable').DataTable();
	    							table.search('').draw();									
		break;
									

	    case "#SignedCollapse": 	table=$('#SignedTable').DataTable();
	    							table.search('').draw();							
		break;
									
									
	    case "#DraftsCollapse": 	table=$('#DraftsTable').DataTable();
	    							table.search('').draw();									
		break;	
									
	    case "#CompletedDocumentsCollapse": table=$('#CompletedDocumentsTable').DataTable();
											 table.search('').draw();									
		break;
												
	    case "#OutForSignatureCollapse": 	//alert("vvv case #OutForSignature-collapse");  // "#OutForSignature-collapse":
	    									/// table=$('#companies').DataTable();
	    									 table=$('#companies').DataTable();
											 table.search('').draw();
		break;
		
	    case "#RejectedlistCollapse": 	//alert("vvv case #OutForSignature-collapse");
	    									/// table=$('#companies').DataTable();
	    									 table=$('#RejectedlistTable').DataTable();
											 table.search('').draw();
		break;
		
	    }
	  
	 if((href=="#Pending"  || href=="#PendingCollapse") && dataAvailableForApi.Pending==false){
		
		 	//getPendingData();
		 	getPendingData_ServerSidePagination();
			dataAvailableForApi.Pending=true;
		}
	 else if((href=="#Signed" || href=="#SignedCollapse") && dataAvailableForApi.Signed==false){
		 	getSignData();
		 	dataAvailableForApi.Signed=true;
		} 
	 else if((href=="#OutForSignature" || href=="#OutForSignatureCollapse") && dataAvailableForApi.OutForSignature==false){
		//	else if(href=="#OutForSignature" || href=="#OutForSignature-collapse") 	{
		//for this code to run when called from tab toggle, dataAvailableForApi.OutForSignature==false should be removed since it is true
		getOutForSignatureData();
		dataAvailableForApi.OutForSignature=true;
	}
	else if((href=="#Drafts" || href=="#DraftsCollapse") && dataAvailableForApi.drafts==false){
		getDraftData();
		dataAvailableForApi.drafts=true;
	}
	else if((href=="#CompletedDocuments"|| href=="#CompletedDocumentsCollapse") && dataAvailableForApi.completedDocumentData==false){
	//getcompleteDocumentData();
	getCompletedDocuments_ServerSidePaginationData();
	dataAvailableForApi.completedDocumentData=true;
	}
	else if((href=="#Rejectedlist"|| href=="#RejectedlistCollapse") ){
		//getcompleteDocumentData();
		getRejectedData();
		//getCompletedDocuments_ServerSidePaginationData();
	//	dataAvailableForApi.completedDocumentData=true;
		}

	}

	
	function closeOpenTr(){
		
		$('.noborder').closest('tr').hide();
		$('tr').removeClass('shown');
	}
	
</script>

<script>
	
		!function ($) {

			"use strict";

			// TABCOLLAPSE CLASS DEFINITION
			// ======================

			var TabCollapse = function (el, options) {
				this.options   = options;
				this.$tabs  = $(el);

				this._accordionVisible = false; //content is attached to tabs at first
				this._initAccordion();
				this._checkStateOnResize();


				// checkState() has gone to setTimeout for making it possible to attach listeners to
				// shown-accordion.bs.tabcollapse event on page load.
				// See https://github.com/flatlogic/bootstrap-tabcollapse/issues/23
				var that = this;
				setTimeout(function() {
				that.checkState();
				}, 0);
			};

			TabCollapse.DEFAULTS = {
				accordionClass: 'visible-xs',
				tabsClass: 'hidden-xs',
				accordionTemplate: function(heading, groupId, parentId, active) {
					return  '<div class="panel panel-default">' +
							'   <div class="panel-heading">' +
							'      <h4 class="panel-title accordianPlusicon">' +
							'      </h4>' +
							'   </div>' +
							'   <div id="' + groupId + '" class="panel-collapse collapse ' + (active ? 'in' : '') + '">' +
							'       <div class="panel-body js-tabcollapse-panel-body">' +
							'       </div>' +
							'   </div>' +
							'</div>'

				}
			};

			TabCollapse.prototype.checkState = function(){
				if (this.$tabs.is(':visible') && this._accordionVisible){
					
				
					this.showTabs();
					this._accordionVisible = false;
					
				} else if (this.$accordion.is(':visible') && !this._accordionVisible){
					
					
					this.showAccordion();
					this._accordionVisible = true;
				}
			};

			TabCollapse.prototype.showTabs = function(){
				var view = this;
				this.$tabs.trigger($.Event('show-tabs.bs.tabcollapse'));
				
				var $panelHeadings = this.$accordion.find('.js-tabcollapse-panel-heading').detach();

				$panelHeadings.each(function() {
					var $panelHeading = $(this),
					$parentLi = $panelHeading.data('bs.tabcollapse.parentLi');

					var $oldHeading = view._panelHeadingToTabHeading($panelHeading);

					$parentLi.removeClass('active');
					if ($parentLi.parent().hasClass('dropdown-menu') && !$parentLi.siblings('li').hasClass('active')) {
						$parentLi.parent().parent().removeClass('active');
						
					}

					if (!$oldHeading.hasClass('collapsed')) {
						$parentLi.addClass('active');
						if ($parentLi.parent().hasClass('dropdown-menu')) {
							
							
							$parentLi.parent().parent().addClass('active');
						}
					} else {
						$oldHeading.removeClass('collapsed');
					}

					$parentLi.append($panelHeading);
				});

				if (!$('li').hasClass('active')) {
					$('li').first().addClass('active')
				}

				var $panelBodies = this.$accordion.find('.js-tabcollapse-panel-body');
				$panelBodies.each(function(){
					var $panelBody = $(this),
						$tabPane = $panelBody.data('bs.tabcollapse.tabpane');
					$tabPane.append($panelBody.contents().detach());
				});
				this.$accordion.html('');

				if(this.options.updateLinks) {
					var $tabContents = this.getTabContentElement();
					$tabContents.find('[data-toggle-was="tab"], [data-toggle-was="pill"]').each(function() {
						var $el = $(this);
						var href = $el.attr('href').replace(/Collapse$/g, '');		//vvv24Mar2020	$el.attr('href').replace(/-collapse$/g, '');
						$el.attr({
							'data-toggle': $el.attr('data-toggle-was'),
							'data-toggle-was': '',
							'data-parent': '',
							href: href
						});
					});
				}

				this.$tabs.trigger($.Event('shown-tabs.bs.tabcollapse'));
			};

			TabCollapse.prototype.getTabContentElement = function(){
				var $tabContents = $(this.options.tabContentSelector);
				if($tabContents.length === 0) {
					$tabContents = this.$tabs.siblings('.tab-content');
				}
				return $tabContents;
			};

			TabCollapse.prototype.showAccordion = function(){
				this.$tabs.trigger($.Event('show-accordion.bs.tabcollapse'));

				var $headings = this.$tabs.find('li:not(.dropdown) [data-toggle="tab"], li:not(.dropdown) [data-toggle="pill"]'),
					view = this;
				$headings.each(function(){
					var $heading = $(this),
						$parentLi = $heading.parent();
					$heading.data('bs.tabcollapse.parentLi', $parentLi);
					view.$accordion.append(view._createAccordionGroup(view.$accordion.attr('id'), $heading.detach()));
				});

				if(this.options.updateLinks) {
					var parentId = this.$accordion.attr('id');
					var $selector = this.$accordion.find('.js-tabcollapse-panel-body');
					$selector.find('[data-toggle="tab"], [data-toggle="pill"]').each(function() {
						var $el = $(this);
						var href = $el.attr('href') + 'Collapse';			//vvv24Mar2020	var href = $el.attr('href') + '-collapse';
						$el.attr({
							'data-toggle-was': $el.attr('data-toggle'),
							'data-toggle': 'collapse',
							'data-parent': '#' + parentId,
							href: href
						});
					});
				}

				this.$tabs.trigger($.Event('shown-accordion.bs.tabcollapse'));
			};

			TabCollapse.prototype._panelHeadingToTabHeading = function($heading) {
				var href = $heading.attr('href').replace(/Collapse$/g, '');		//vvv24Mar2020	var href = $heading.attr('href').replace(/-collapse$/g, '');
				$heading.attr({
					'data-toggle': 'tab',
					'href': href,
					'data-parent': ''
				});
				return $heading;
			};

			TabCollapse.prototype._tabHeadingToPanelHeading = function($heading, groupId, parentId, active) {
				$heading.addClass('js-tabcollapse-panel-heading ' + (active ? '' : 'collapsed'));
				$heading.attr({
					'data-toggle': 'collapse',
					'data-parent': '#' + parentId,
					'href': '#' + groupId
				});
				return $heading;
			};

			TabCollapse.prototype._checkStateOnResize = function(){
				var view = this;
				$(window).resize(function(){
					clearTimeout(view._resizeTimeout);
					view._resizeTimeout = setTimeout(function(){
						view.checkState();
					}, 100);
				});
			};


			TabCollapse.prototype._initAccordion = function(){
				var randomString = function() {
					var result = "",
						possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
					for( var i=0; i < 5; i++ ) {
						result += possible.charAt(Math.floor(Math.random() * possible.length));
					}
					return result;
				};

				var srcId = this.$tabs.attr('id'),
					accordionId = (srcId ? srcId : randomString()) + '-accordion';

				this.$accordion = $('<div class="panel-group ' + this.options.accordionClass + '" id="' + accordionId +'"></div>');
				this.$tabs.after(this.$accordion);
				this.$tabs.addClass(this.options.tabsClass);
				this.getTabContentElement().addClass(this.options.tabsClass);
			};

			TabCollapse.prototype._createAccordionGroup = function(parentId, $heading){
				var tabSelector = $heading.attr('data-target'),
					active = $heading.data('bs.tabcollapse.parentLi').is('.active');

				if (!tabSelector) {
					
					
					tabSelector = $heading.attr('href');
					tabSelector = tabSelector && tabSelector.replace(/.*(?=#[^\s]*$)/, ''); //strip for ie7
				}

				var $tabPane = $(tabSelector),
					groupId = $tabPane.attr('id') + 'Collapse',		//vvv24Mar2020	groupId = $tabPane.attr('id') + '-collapse',
					$panel = $(this.options.accordionTemplate($heading, groupId, parentId, active));
				$panel.find('.panel-heading > .panel-title').append(this._tabHeadingToPanelHeading($heading, groupId, parentId, active));
				$panel.find('.panel-body').append($tabPane.contents().detach())
					.data('bs.tabcollapse.tabpane', $tabPane);

				return $panel;
			};



			// TABCOLLAPSE PLUGIN DEFINITION
			// =======================

			$.fn.tabCollapse = function (option) {
				return this.each(function () {
					var $this   = $(this);
					var data    = $this.data('bs.tabcollapse');
					var options = $.extend({}, TabCollapse.DEFAULTS, $this.data(), typeof option === 'object' && option);

					if (!data) $this.data('bs.tabcollapse', new TabCollapse(this, options));
				});
			};

			$.fn.tabCollapse.Constructor = TabCollapse;


		}(window.jQuery);


		$('#myTab').tabCollapse();
		
		
		//vvv 	calling from here
		function getOutForSignatureData(){
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
	   		$.ajax({
	   			type : "GET",
	   			async: false,
	   			//url : appUrl+"/app/history/newoutforSignature_serversideDatatable2",	//VVV example 2
	   			url : appUrl+"/app/history/newoutforSignature",	//VVV example 2
	   			beforeSend : function(xhr) {
	   		 		xhr.setRequestHeader(header, token);
	   		 	$("#loader2").show();
	   			},
	   			complete: function () {
	   		 		setTimeout(function(){ $("#loader2").hide(); }, 1000);
	 			    },
		        success : function(response) { 	 	   				
	   		 			//for phone devices set href value to display and show table	   		 		
    		 			if(window.screen.availWidth<768){ 
	   		 				href=DOMPurify.sanitize("#OutForSignatureCollapse"); 
			    		}else{
	   		 				href=DOMPurify.sanitize("#OutForSignature");
	   		 			}
	   			
	   					if(href=="#OutForSignature"){
	   						
	   						
	   						$("#OutForSignature").html("");
	   			    		$("#OutForSignature").html(<c:out value='response'></c:out>);
	   			    		$("#OutForSignature").show();
	   			    	}else if(href=="#OutForSignatureCollapse"){
	   			    		$("#OutForSignatureCollapse .panel-body").html("");
	   			        	$("#OutForSignatureCollapse .panel-body").html(<c:out value='response'></c:out>);
	   			    	}		   					 
	   		 	}
	  		 		
	   		});
	     	
	    	//$("#OutForSignature").show();
	   }
		
		var myVar ="";
		function myTimer() {
			var check = $("#SignedTable")[0].childNodes[5].childNodes[2].className;
			if( check == "odd"){
				clearInterval(myVar);
				setTimeout(function(){ $("#loader2").hide(); }, 1000);
				//console.log("adf");
			}
		}

			
	function getSignData(){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");

		$("#Signed").show();
		$.ajax({
			type : "GET",
			url : appUrl+"/app/signeddocview",		
			beforeSend : function(xhr) {
		 		xhr.setRequestHeader(header, token);
		 		$("#loader2").show();
			},
			complete: function () {
   		 		//setTimeout(function(){ $("#loader2").hide(); }, 1000);
				myVar = setInterval(myTimer, 100);
 			    },
			success : function(response) {	
		 		if(window.screen.availWidth<768){
					href=DOMPurify.sanitize("#SignedCollapse");
		    	}else{
		    		href=DOMPurify.sanitize("#Signed");
		    	}
				if(href=="#Signed"){	
					//$("#Signed").show();
					$("#Signed").html("");
					$("#Signed").html(<c:out value="response"></c:out>);
				}else if(href=="#SignedCollapse"){
					$("#SignedCollapse .panel-body").html("");
					$("#SignedCollapse .panel-body").html(<c:out value="response"></c:out>);
			}
		 }

		});
	}

// 	calling from here 	 
	function getPendingData_ServerSidePagination(){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");

		$("#Pending").show();
    	$.ajax({
    			type : "GET",
    			url : appUrl+"/app/getPending_ServerSidePagination",  			
    			beforeSend : function(xhr) {
    		 			xhr.setRequestHeader(header, token);
    		 			$("#loader2").show();
    			},
    			complete: function () {
       		 		setTimeout(function(){ $("#loader2").hide(); }, 1000);
     			    },
    			success : function(response) {
    					if(window.screen.availWidth<768){
    		 				href=DOMPurify.sanitize("#PendingCollapse");        			    		
       			    	}else{
       			    		href=DOMPurify.sanitize("#Pending");
       			    	}				
    					if(href=="#Pending"){	
    						$("#Pending").html("");
    						$("#Pending").html(<c:out value="response"></c:out>);
    					}else if(href=="#PendingCollapse"){
    						$("#PendingCollapse .panel-body").html("");
        					$("#PendingCollapse .panel-body").html(<c:out value="response"></c:out>);
    					}
    					
    					//setData(response);
    		 	}

    		});
     }
	
// 	calling from here 	 
	function getCompletedDocuments_ServerSidePaginationData(){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$("#CompletedDocuments").show();
    	
     	
    	$.ajax({
    			type : "GET",
    			url : appUrl+"/app/history/getCompletedDocuments_ServerSidePaginationData",	//TESTING VVV example 2 			
    		beforeSend : function(xhr) {
    		 	xhr.setRequestHeader(header, token);
    		 	$("#loader2").show();
    		},
    		complete: function () {
   		 		setTimeout(function(){ $("#loader2").hide(); }, 1000);
 			    },
    		 success : function(response) { 
    			 
    		 			if(window.screen.availWidth<768){
        			    	href=DOMPurify.sanitize("#CompletedDocumentsCollapse");
        			    }else{
        			    	href=DOMPurify.sanitize("#CompletedDocuments");
        			    }
    					if(href=="#CompletedDocuments"){
    						$("#CompletedDocuments").html("");
    						$("#CompletedDocuments").html(<c:out value="response"></c:out>);
    					}else if(href="#CompletedDocumentsCollapse"){
    						$("#CompletedDocumentsCollapse .panel-body").html("");
        					$("#CompletedDocumentsCollapse .panel-body").html(<c:out value="response"></c:out>);
    					}
    					
    					//setData(response);
    		 	}

    		});
     }

	//vvv 	calling from here
	function getDraftData(){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
   		$.ajax({
   			type : "GET",
   			//async: false,
   			url : appUrl+"/app/history/newdraft",	//VVV
   			beforeSend : function(xhr) {
   		 		xhr.setRequestHeader(header, token);
   		 	$("#loader2").show();
   			},
   			complete: function () {
   		 		setTimeout(function(){ $("#loader2").hide(); }, 1000);
 			    },
   		 	success : function(response) {
   		 			
   					//for phone devices set href value to display and show table 
   		 			if(window.screen.availWidth<768){
   		 				href=DOMPurify.sanitize("#DraftsCollapse");
		    		}else{
   		 				href=DOMPurify.sanitize("#Drafts");
   		 			}
   					if(href=="#Drafts"){
   						$("#Drafts").html("");
   			    		$("#Drafts").html(<c:out value="response"></c:out>);
   			    		$("#Drafts").show();
   			    	}else if(href=="#DraftsCollapse"){
   			    		$("#DraftsCollapse .panel-body").html("");
   			        	$("#DraftsCollapse .panel-body").html(<c:out value="response"></c:out>);
   			    	}		   					 
   		 	}/* ,complete : function() {
   		 		$("#loader2").hide();
   		 		//$("#Drafts").show();
   			} */
  		 		
   		});
     	
    	
   }

	function rejectTimer() {
		var check = $("#RejectedlistTable")[0].childNodes[5].childNodes[2].className;
		if( check == "odd"){
			clearInterval(myVar);
			setTimeout(function(){ $("#loader2").hide(); }, 1000);
			//console.log("adf");
		}
	}
	
	//Mahesh Gund 	calling from here
	function getRejectedData(){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$("#Rejectedlist").show();
   		$.ajax({
   			type : "GET",
			url : appUrl+"/app/rejecteddocview",	
   			beforeSend : function(xhr) {
   		 		xhr.setRequestHeader(header, token);
   		 	$("#loader2").show();
   			},
   			complete: function () {
   		 		//setTimeout(function(){ $("#loader2").hide(); }, 3000);
   				myVar = setInterval(rejectTimer, 100);
 			    },
   		 	success : function(response){
   		 			
   					//for phone devices set href value to display and show table 
   		 			if(window.screen.availWidth<768){
   		 				href=DOMPurify.sanitize("#RejectedlistCollapse");
		    		}else{
   		 				href=DOMPurify.sanitize("#Rejectedlist");
   		 			}
   		 			if(href=="#Rejectedlist"){
   						$("#Rejectedlist").html("");
   			    		$("#Rejectedlist").html(<c:out value="response"></c:out>);
   			    	}else if(href=="#RejectedlistCollapse"){
   			    		$("#RejectedlistCollapse .panel-body").html("");
   			        	$("#RejectedlistCollapse .panel-body").html(<c:out value="response"></c:out>);
   			    	}		   					 
   		 	}
  		 		
   		});
     	
    	
   }
	
	
	window.addEventListener("resize", function() {
		if(href=="#Signed" || href=="#SignedCollapse"){
			$("#Signed").show().addClass('in');
	 	}
	  	else if(href=="#CompletedDocuments" || href=="#CompletedDocumentsCollapse"){
		  	$("#CompletedDocuments").show().addClass('in');
	  	}
	 	else if(href=="#OutForSignature" || href=="#OutForSignatureCollapse"){
		  	$("#OutForSignature").show().addClass('in');
	  	}
	 	else if(href=="#Pending" || href=="#PendingCollapse"){
		  	$("#Pending").show().addClass('in');
		}
	  	else  if(href=="#Drafts" || href=="#DraftsCollapse"){
		  	$("#Drafts").show().addClass('in');
	 	}
		else if(href=="#Rejectedlist" || href=="#RejectedlistCollapse"){
			$("#Rejectedlist").show().addClass('in');
	 	}
			 
	}, true);
	
</script>



