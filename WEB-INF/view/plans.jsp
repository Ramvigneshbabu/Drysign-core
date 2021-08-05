<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <jsp:include page="plan_header.jsp" />
<% 

String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.5.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.5.2/jquery-confirm.min.js"></script> 
 
    <style>
    .panel-group .panel+.panel{
    margin-top:0 !important;}
    #noplans{
    min-height:480px;
    }
    
 @media (min-width: 767px) {
    .panel-default{
    border:none;
    }
    }
     @media (max-width: 767px) {
    #noplans{
    min-height:auto;
    }
    }
    .parent {
  display: flex;
    display: -webkit-flex;
 flex-direction: row;
  -webkit-flex-direction: row;
 justify-content: center;
 -webkit-justify-content: center;
  height: 100%;
}
.parent .modules {
  background-color: #e3f5fd;
  width: 300px;
  max-width: 90%;
  margin: 10px;
  text-align: center;
  line-height: 75px;
  font-size: 30px;
  position: relative
}
    
 @media (max-width: 767px) {
.btn-primary{
padding: 10px 9px !important;
}
.bottom-20{
padding-top:0px !important;
}
h1{
    font-size:26px;}
    .padding-l h4{
     font-size:26px;
    }
    .parent {
    display: block !important;  
}
    .parent .modules {
    background-color: #e3f5fd;
    width: 400px !important;;
   
    text-align: center;
    line-height: 75px;
    font-size: 30px;
    max-width: 100% !important;;
    margin: 0 auto 20px !important;;
    padding: 15px !important;;
}
  .tab-content .tab-pane {
    display: block;
  }
  .nav-tabs {
    display: none;
  }
  .panel-title a {
    display: block;
    color: #141821;
  }
  .panel {
    margin: 0;
    box-shadow: none;
    border-radius: 0;
    margin-top: -2px;
  }
  .tab-pane:first-child .panel {
    border-radius: 5px 5px 0 0;
  }
  .tab-pane:last-child .panel {
    border-radius: 0 0 5px 5px;
  }
}
    ul.flexiselDemo3 li {
    float: none;
    display: inline-block;
    list-style: none;
    background-color: #e3f5fd;
    margin:10px;
    width:283px;
    max-width: 90%;
    margin: 10px;
    text-align: center;
    line-height: 75px;
    font-size: 30px;
    position: relative;
}
ul.flexiselDemo3 li:hover{
background:transparent}
 .pricing-page{
 min-height:600px;
 }
 .panel-title a {

    padding: 10px 15px;
    border-bottom: 1px solid transparent;
        border-bottom-color: transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
	display:block;
}

    </style>
<div class="container-fluid pricing_website">
 
 <!-- /.breadcrumb -->
 <ul class="breadcrumb">
    <li><a href="<%=appUrl %>/app/dashboard"><spring:message code="label.cat_home"/></a></li>
    <c:choose>
    	<c:when test="${isUpgradeplan == true }">
    		<li><a href="<%=appUrl %>/upgradeplan?planId=<c:out value="${planId}"/>&category_name=General%20Plans&category=1"><spring:message code="label.pricing"/></a></li>
    	</c:when>
    	<c:otherwise>
    		<li><a href="<%=appUrl %>/plans?category_name=General%20Plans&category=1"><spring:message code="label.pricing"/></a></li>
    	</c:otherwise>
    </c:choose>
    <li class="active"><c:out value="${param.category_name}"/></li>
</ul>

  <div class="row">
	  <div class="col-xs-12 text-center">
		  <h2><c:out value="${param.category_name}"/></h2>
	  </div>   
  </div>
	<div class="row">
		<div class="col-xs-12">
		<ul class="nav nav-tabs responsive" id="myTab">
		
  <li id = "aplan"><a href="#monthly"  data-toggle="tab"><spring:message code="label.aplan"/></a></li>
  
  <li><a href="#annually" id ="mplan"  data-toggle="tab" style="display: none;"><spring:message code="label.mplan"/></a></li>
 

</ul>

<div class="tab-content responsive">
<div class="tab-pane active" id="monthly">
<div class="panel panel-default">
<div id="collapseOne" class="panel-collapse collapse in">
        
              <div class="parent">	  

    
<c:choose>
<c:when test="${not empty plans}">  
<c:forEach items="${plans }" var="plan">
	<c:if test="${plan.duration.time == '365' }">
   <div class="modules"> 
   <input type="hidden" id = "aplanValue" value= "<c:out value = "${plan.duration.time}"/>" >
		  <div class="top-heading"></div>
		  <h2><c:out value = "${plan.name }"/></h2>
		  <div class="price"><div><sup><c:out value = "${plan.currency.name}"/></sup> <fmt:formatNumber value="${plan.price/12}"></fmt:formatNumber></div><span><spring:message code="label.perUserPerMonth"/></span></div>
		  <div class="mid-content">
			  <p>
			  <%-- <c:if test="${not empty plan.noOfUsers}">${plan.noOfUsers} users<br/></c:if> --%>
			  <c:if test="${not empty plan.noOfDocuments}"><c:out value = "${plan.noOfDocuments}"/>  <spring:message code="label.documents"/><br/></c:if>
			  <c:if test="${not empty plan.template}"><c:out value = "${plan.template}"/>  <spring:message code="label.templates"/><br/></c:if>
			  <c:forTokens items="${plan.features }" delims="," var="splitPlan">
			  <c:set var = "splitPlan" scope = "request" value = "${splitPlan}"/>
                        		<c:forEach items='${features1}' var='feature1'>
		                         <c:set var = "fid" scope = "request" value = "${feature1.id}"/>
		                        <% if(request.getAttribute("fid").toString().equals(request.getAttribute("splitPlan"))){ %>${feature1.name}<br/><% } %>
		                        
		                        </c:forEach>
				   <%-- <c:out value="${splitPlan}"/></br> --%>
				   
				</c:forTokens>	
				</p>
		  </div>
	
		  <div class="buy-now">
		  	<button class="btn btn-block buy-nowbtn" onclick="buyPlan('<c:out value = "${plan.token}"/>','<%= request.getParameter("category_name") %>')"><spring:message code="label.plans_buynow"/></button> 
	 	</div>
	 
	 
	</div>
	
	</c:if>
</c:forEach>
</c:when>
	<c:otherwise>
	<p id="noplans"><%-- <spring:message code="label.noplans"/> --%></p>
	</c:otherwise>
</c:choose>
 <div class="modules">
               <!-- <div class="headers">
                          <h1>BUSINESS PREMIUM</h1> 
                         <div class="price"><span>Contact Sales</span></div>
                          <div class="mid-content">
                          <p>This will give us more scope to understand and setup the business preposition and accordingly decide the pricing based on the volume</p>      
                      </div>
                      </div> -->
                  <div class="top-heading"></div>
                         <h2><spring:message code="label.premium"/></h2>
                         <div class="price"><div><sup><spring:message code="label.contactSales"/></sup></div><span><br></span></div>
                         
                         <div class="mid-content" style="margin-bottom:21px"><p><spring:message code="label.customizedPlans"/><br/><spring:message code="label.talkToSalesManager"/></p></div>     
                    	<span id="business_primium"></span>  
                    <div class="buy-now">
		  	<a href="mailto:sales.support@exelaonline.com"><button class="btn btn-block buy-nowbtn"><spring:message code="label.contactSales"/></button></a>
	 	</div>
                  </div>                                        

</div>

</div>
</div>
</div>
  
<div class="tab-pane" id="annually">
<div class="panel panel-default">
<div id="collapseOne" class="panel-collapse collapse in">
         
              <div class="parent">	  
 	 
 	 <c:choose>
	<c:when test="${not empty plans}">  
	<c:forEach items="${plans }" var="plan">
	<c:if test="${plan.duration.time == '30' }">
	  <div class="modules"> 
		  <input type="hidden" id = "mplanValue" value = "<c:out value = "${plan.duration.time}" />">
		  <div class="top-heading"></div>
		  <h2><c:out value= "${plan.name } "/></h2>
		  <div class="price"><div><sup><c:out value= "${plan.currency.name}"/></sup><c:out value= "${plan.price}"/></div> <span><spring:message code="label.perUser"/></span></div>
		  <div class="mid-content">
			  <p>
			  <%-- <c:if test="${not empty plan.noOfUsers}">${plan.noOfUsers} users<br/></c:if> --%>
			  <c:if test="${not empty plan.noOfDocuments}"><c:out value= "${plan.noOfDocuments}"/>  <spring:message code="label.documents"/><br/></c:if>
		 <c:if test="${not empty plan.template}"><c:out value= "${plan.template}"/>  <spring:message code="label.templates"/><br/></c:if>
			  <c:forTokens items="${plan.features }" delims="," var="splitPlan">
				   <c:set var = "splitPlan" scope = "request" value = "${splitPlan}"/>
                        		<c:forEach items='${features1}' var='feature1'>
		                         <c:set var = "fid" scope = "request" value = "${feature1.id}"/>
		                        <% if(request.getAttribute("fid").toString().equals(request.getAttribute("splitPlan"))){ %>${feature1.name}<br/><% } %>
		                        
		                        </c:forEach>
				   <%-- <c:out value="${splitPlan}"/></br> --%>
				</c:forTokens>	
				</p>
		  </div>
		   <div class="buy-now">
		   <button class="btn btn-block buy-nowbtn" onclick="buyPlan('<c:out value = "${plan.token}"/>','<%= request.getParameter("category_name") %>')"><spring:message code="label.plans_buynow"/></button> 

		  </div>
	 
</div>	  </c:if>
</c:forEach>
</c:when>
	<c:otherwise>
	<p style="min-height: 480px;" ><%-- <spring:message code="label.noplans"/> --%></p>
	</c:otherwise>
</c:choose>   	 
	  
	  </div>
	  </div>
	  
	  </div>
  </div>

</div>


</div>
</div>
</div>
<script>
$( document ).ready(function() {
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
	if($("#mplanValue").val() == 30){
		$("#mplan").css("display","block");
	}
	if($("#mplanValue").val() != 30){
		$(".collapse-annually").css("display","none");
	}
	/* if($("#aplanValue").val() == 365){
		$("#aplan").css("display","block");
	}
	
	if($("#mplanValue").val() == 30 || $("#aplanValue").val() == 365){
		$("#myTab").css("display","block");
	} */
});
function buyPlan(token,catgry){
	
	//alert(token+"  "+catgry);
	
	$.ajax({
		type : "GET",
	    url: "checkuserLogin",
	    contentType: "application/json",
	    beforeSend : function(xhr) {
	    	
		},
		complete : function() {
			
		},
		
		success : function(response) {
						
			if("notlogin" == response){
				//alert("test");
				<%-- window.location.href='<%=appUrl %>/login'; --%>
				//confirm("To proceed further, Please Sign In/Sign Up.");
				 var txt;
				  var r = confirm("<spring:message code="label.proceed"/>");
				  if (r == true) {
					  window.location.href='<%=appUrl %>/login?locale=en';
				    //txt = "You pressed OK!";
				  } else {
				    //txt = "You pressed Cancel!";
				  }
				  document.getElementById("demo").innerHTML = txt;
				<%-- $.confirm({
				   title: 'Buy Now!',
				    content: 'To proceed further, Please Sign In/Sign Up.',
				    buttons: {
				        confirm: function () {
				        	window.location.href='<%=appUrl %>/login';
				        	return false;
				        },
				        cancel: {
				        	btnClass: 'btn-light'
				        }
				    }
				}); --%>
			}else{
				window.location.href='<%=appUrl %>/checkout?plan='+token+'&category='+catgry;
			}
			  
		}
	});
	
}
</script>
<jsp:include page="plan_footer.jsp" />



