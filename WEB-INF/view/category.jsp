
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="plan_header.jsp" />
<% 

String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
<style>
 
.module_api{
    margin-top: 50px !important;
    margin-bottom: 0 !important;
 }

    </style>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-102458969-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-102458969-1');
</script>

<div class="container-fluid pricing-page" style="padding-top: 100px;">
 
 <!-- /.breadcrumb -->
 <ul class="breadcrumb">
    <li><a href="index"><spring:message code="label.cat_home"/></a></li>
    <li class="active"><spring:message code="label.pricing"/></li>
</ul>
 
  <div class="row">
	  <div class="col-xs-12 text-center">
	  	  
	  	  
 <c:choose>
	<c:when test="${not empty categories}">


	<c:forEach items="${categories }" var="category">
	 	<c:if test="${category.name ne 'API Plans'}">
	  	  	<div class="module_api">
		  	<!--<img src="<%=appUrl %>/images/1.0/api_GP.png" width=" 70px;"/>-->
			  <div class="heading-text">
				  <spring:message code="label.drysignName"/><span>${category.name}</span>
			  </div>
			  <button type="submit" value="ViewPlan" escapeXml="true" class="btn btn-primary" onclick="window.location.href='<%=appUrl %>/plans?category_name=${category.name}&category=${category.category_id} '"><spring:message code="label.view_plan"/></button>
		  	</div>
	  	 </c:if>
	  	  </c:forEach>
		
    </c:when>
	<c:otherwise>
	<tr><td><spring:message code="label.no_cat_available"/></td></tr>
	</c:otherwise>
</c:choose>
	  	  
	  	  
	  	  
	  	  
	  	  
		  
		  
		  <%-- <div class="module_api">
		  	<img src="<%=appUrl %>/images/1.0/api_.png" width=" 70px;"/>
			  <div class="heading-text">
				  DrySign<span>API Plans</span>			  	
			  </div>
			  <button type="submit" value="ViewPlan" class="btn btn-api red" onclick="window.location.href='<%=appUrl %>/plans?plan=api-plans'">View Plans</button>
		  </div> --%>
	  </div>
   
  </div>



</div>
<script>
$(window).on("load resize", function(e) {
            var windowHeight = $(window).innerHeight();
            //alert("windowHeight");
            $('.container-fluid.pricing-page').css({
                'height': windowHeight - 60
            });

        });
</script>

<jsp:include page="plan_footer.jsp" />