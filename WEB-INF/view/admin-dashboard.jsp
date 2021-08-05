<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication" %>
<% Authentication auth = SecurityContextHolder.getContext().getAuthentication(); %>
<% Registration registration = (Registration)auth.getPrincipal(); %>
 <% 
String port = request.getServerPort()+"";
 if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
  <jsp:include page="admin-header.jsp"></jsp:include>

<!-- <link rel="stylesheet" href="<%=appUrl %>/css/style.css"/>
<link rel="stylesheet" href="<%=appUrl %>/css/inner_page.css"/>  -->

 <style>
	canvas {
			position: relative;
			margin: 1px;
			margin-left: 0px;
			 border: 3px solid #2C3D4F;
			border-radius: 3px;
	}
	
	.loader2 {
    position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 99999;
	/* background: url('<%=appUrl %>/images/ajax-loader_1.gif') 50% 50% no-repeat rgba(43, 40, 40, 0.37);*/
 }
	
	.selected {
    box-shadow: 9px 11px 28px -12px #080808;
}


</style>
<div id="loader2" class="loader2" style="display:none">
	<div class="loaderdiv">
		<p><img src="<%=appUrl %>/images/drysign_logo_mono.svg"></p>
		<p><img src="<%=appUrl %>/images/drysign-logo-line_only.gif" ></p>
		<p><spring:message code="label.wait"/></p>
	</div>
</div>
  <!-- Content Wrapper. Contains page content -->
  
  <div class="content-wrapper bg_wrap">
            <section>
                <div class="row mt-20">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <div class="thumbnail thumbnail-card">
                                <div>
                                    <img src="<%=appUrl %>/images/total-users-icon.png" class="mb-16">
                                    <span class="super-label">${totalUsers}</span>
                                    <label class="label-heading ml-5"><spring:message code="label.total_users"/></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail thumbnail-card">
                                <div>
                                    <img src="<%=appUrl %>/images/portal-icon.png" class="mb-16">
                                    <span class="super-label">${totalPortalUsers}</span>
                                    <label class="label-heading ml-5"><spring:message code="label.portal_users"/></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail thumbnail-card">
                                <div>
                                    <img src="<%=appUrl %>/images/api-icon.png" class="mb-16">
                                    <span class="super-label">${totalApiUsers}</span>
                                    <label class="label-heading ml-5"><spring:message code="label.api_users"/></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail thumbnail-card">
                                <div>
                                    <img src="<%=appUrl %>/images/api-icon.png" class="mb-16">
                                    <span class="super-label">${totalAdmins}</span>
                                    <label class="label-heading ml-5"><spring:message code="label.administrator"/></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-6 margin-t">
                            <div class="card card-style">
                                <div class="heading-1" style="text-align: center;">
                                    <spring:message code="label.api_user_vs_application"/>
                                </div>
                                <div id="container-pie" style="min-width: 170px; height: 290px; max-width: 600px; margin: 0 auto"></div>
                            </div>
                        </div>
                        <div class="col-md-6 margin-t">
                            <div class="card card-style">
                                <div class="heading-1" style="text-align: center;">
                                   <spring:message code="label.api_userDistributionByCompany"/>
                                </div>
                                <div id="container" style="min-width: 170px; height: 290px; max-width: 600px; margin: 0 auto"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-20">
                    <div class="col-md-12">
                        <div class="col-md-6 margin-t">
                            <!-- <div id="container-purchase" style="min-width: 310px; height: 290px; max-width: 600px; margin: 0 auto"></div> -->
                            <div class="card card-style">
                                <div class="heading-1" style="text-align: center;">
                                    <spring:message code="label.purchase_plan"/>
                                </div>
                                <div id="container-purchase" style="min-width: 170px; height: 290px; margin: 0 auto"></div>
                            </div>
                        </div>
                        <div class="col-md-6 margin-t">
                            <!-- <div id="container-consumption" style="min-width: 310px; height: 290px; margin: 0 auto"></div> -->

                            <div class="card card-style">
                                <div class="heading-1" style="text-align: center;">
                                    <spring:message code="label.top_50_credits"/>
                                </div>
                                <div id="container-consumption" style="min-width: 170px; height: 290px; margin: 0 auto"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Main content -->
            <div class="container-fluid">
     
            </div>
        </div>
  

<jsp:include page="footer.jsp"></jsp:include>


 <div class="overlay-bg"></div>
 <input type="hidden" id="myType" value=""/>
<script src="<%=appUrl %>/js/highcharts.js"></script>
<script src="<%=appUrl %>/js/custom-file-input.js"></script> 
<script src="<%=appUrl %>/js/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.12/d3.min.js"></script> 
<%-- <script src="<%=appUrl %>/js/D3.js"></script> --%>
<script src="<%=appUrl %>/js/materialize.js"></script>
 <script>

        $(function () {
            $(document).ready(function () {
            	var role = "<c:out value="${role}"></c:out>";
        		if("ROLE_ADMIN"== role){
        			$("#admindashboard").hide();		//$("#admindashboard").show(); //28Oct - new requirement to hide admin dashboard from menu
        			$("#adminuser").show();
        			$("#drysignadminclient").show();
        		}

                // Build the chart
                $('#container-pie').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    legend: {
                        labelFormatter: function() {
                            return this.name + " (" + this.y + "%)";
                        }
                    },
                     title: {
                         text: '',
                    //     align: 'left',
                    //     verticalAlign: 'top',
                    //     floating: true,
                    //     x: 20,
                    //     y: 30
                     },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                           
                            dataLabels: {
                                enabled: false,
                                fontWeight: "normal"
                            },
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: false
                            },
                            showInLegend: true
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: 'Users Distribution',
                        data: [{
                            name: 'Application Users ',
                            y: parseInt("${portalUsersDistribution}"),
                            sliced: true,
                            selected: true,
                            color: "#7cb5ec"

                        }, {
                            name: 'API Users ',
                            y: parseInt("${apiUsersDistribution}"),
                            color: "#ffce9d"

                        }]
                    }]
                });
            });
        });
    </script>

    <script>
        $(function () {
        	
			/*var series =  [{
                "type": 'pie',
                "name": 'Browser share',
                "data": [{
                    "name": 'FOA',
                    "y": 26.2
                }, {
                    "name": 'Talento',
                    "y": 83.8
                }]
            }];*/
        
        
            var series =  [{
            "type": 'pie',
            "name": 'API Users',
            "data": ${apiUsersDistributionByCompany}
        }];
            
            //var dt = "${apiUsersDistributionByCompany}";
            //alert(dt);
          //  console.log('Sereis : ' + series.data);
			
            $(document).ready(function () {

                // Build the chart
                $('#container').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
             
                    legend: {
                        labelFormatter: function() {
                            return this.name + " (" + this.y + "%)";
                        }
                    },
                    title: {
                        text: '',
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            dataLabels: {
                                enabled: false
                            },
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: false
                            },
                            showInLegend: true
                        }
                    },
                    series: series
                });
            });
        });

    //      $(window).resize(function(){
    //     var chart = $('#container').highcharts();

    //     console.log('redraw');
    //     var w = $('#container').closest(".wrapper").width()

    //     chart.setSize(       
    //         w,w * (1/4),false
    //     ); 
    //  });

    </script>

    <script>
        $(function () {
        	//console.log(${portalPlansDist});
            $(document).ready(function () {
            	 var series =  [{
                     "type": 'pie',
                     "name": 'Purchase Plans',
                     "data": ${portalPlansDist}
                 }];
                // Build the chart
                $('#container-purchase').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    
                    legend: {
                        labelFormatter: function() {
                            return this.name + " (" + this.y + "%)";
                        }
                    },
                     title: {
                        text: '',
                    //     align: 'left',
                    //     verticalAlign: 'top',
                    //     floating: true,
                    //     x: 20,
                    //     y: 30
                     },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            
                            dataLabels: {
                                enabled: false
                            },
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: false
                            },
                            showInLegend: true
                        }
                    },
                    series: series
                });
            });

        });


    </script>

    <script>
        // Create the column chart
        console.log('usage' + JSON.stringify(${creditUsage}));
        var series = {
            "name": "Users",
            "colorByPoint": true,
            "data":${creditUsage}
        };
            	
        Highcharts.chart('container-consumption', {
            chart: {
                type: 'column'
            },
             title: {
                 text: '',
            //     align: 'left',
            //     floating: true,
            //     x: 20
            // },
            // subtitle: {
            //     text: 'Click the columns to view versions. Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>'
             },
            xAxis: {
                type: 'category',
                title: 'User'
            },
            yAxis: {
                title: {
                    text: 'Usages (%)'
                }

            },
            legend: {
                enabled: false
            },
            plotOptions: {
            	column: {colorByPoint: true},
                series: {
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.1f}%'
                    }
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b><br/>'
            },

            "series": [series]
        });


    </script>


<script>
//script of days chart


(function () {
    var Needle, arc, arcEndRad, arcStartRad, barWidth, chart, chartInset, degToRad, el, endPadRad, height, i, margin, needle, numSections, padRad, percToDeg, percToRad, percent, radius, ref, sectionIndx, sectionPerc, startPadRad, svg, totalPercent, width;
    percent = ${daysLeftPercent};
    barWidth = 40;
    numSections = 3;
    sectionPerc = 1 
    / numSections / 2;
    padRad = 0.05;
    chartInset = 10;
    totalPercent = 0.75;
    el = d3.select('.chart-gauge');
    margin = {
        top: 20,
        right: 20,
        bottom: 30,
        left: 20
    };
    width = el[0][0].offsetWidth - margin.left - margin.right;
    height = width;
    radius = Math.min(width, height) / 2;
    percToDeg = function (perc) {
        return perc * 360;
    };
    percToRad = function (perc) {
        return degToRad(percToDeg(perc));
    };
    degToRad = function (deg) {
        return deg * Math.PI / 180;
    };
    svg = el.append('svg').attr('width', width + margin.left + margin.right).attr('height', height + margin.top + margin.bottom);
    chart = svg.append('g').attr('transform', 'translate(' + (width + margin.left) / 2 + ', ' + (height + margin.top) / 2 + ')');
    for (sectionIndx = i = 1, ref = numSections; 1 <= ref ? i <= ref : i >= ref; sectionIndx = 1 <= ref ? ++i : --i) {
        /*if (window.CP.shouldStopExecution(1)) {
            break;
        }*/
        arcStartRad = percToRad(totalPercent);
        arcEndRad = arcStartRad + percToRad(sectionPerc);
        totalPercent += sectionPerc;
        startPadRad = sectionIndx === 0 ? 0 : padRad / 2;
        endPadRad = sectionIndx === numSections ? 0 : padRad / 2;
        arc = d3.svg.arc().outerRadius(radius - chartInset).innerRadius(radius - chartInset - barWidth).startAngle(arcStartRad + startPadRad).endAngle(arcEndRad - endPadRad);
        chart.append('path').attr('class', 'arc chart-color' + sectionIndx).attr('d', arc);
    }
   /* window.CP.exitedLoop(1);*/
    Needle = function () {
        function Needle(len, radius1) {
            this.len = len;
            this.radius = radius1;
        }
        Needle.prototype.drawOn = function (el, perc) {
            el.append('circle').attr('class', 'needle-center').attr('cx', 0).attr('cy', 0).attr('r', this.radius);
            return el.append('path').attr('class', 'needle').attr('d', this.mkCmd(perc));
        };
        Needle.prototype.animateOn = function (el, perc) {
            var self;
            self = this;
            return el.transition().delay(500).ease('elastic').duration(3000).selectAll('.needle').tween('progress', function () {
                return function (percentOfPercent) {
                    var progress;
                    progress = percentOfPercent * perc;
                    return d3.select(this).attr('d', self.mkCmd(progress));
                };
            });
        };
        Needle.prototype.mkCmd = function (perc) {
            var centerX, centerY, leftX, leftY, rightX, rightY, thetaRad, topX, topY;
            thetaRad = percToRad(perc / 2);
            centerX = 0;
            centerY = 0;
            topX = centerX - this.len * Math.cos(thetaRad);
            topY = centerY - this.len * Math.sin(thetaRad);
            leftX = centerX - this.radius * Math.cos(thetaRad - Math.PI / 2);
            leftY = centerY - this.radius * Math.sin(thetaRad - Math.PI / 2);
            rightX = centerX - this.radius * Math.cos(thetaRad + Math.PI / 2);
            rightY = centerY - this.radius * Math.sin(thetaRad + Math.PI / 2);
            return 'M ' + leftX + ' ' + leftY + ' L ' + topX + ' ' + topY + ' L ' + rightX + ' ' + rightY;
        };
        return Needle;
    }();
    needle = new Needle(90, 15);
    needle.drawOn(chart, 0);
    needle.animateOn(chart, percent);
    
    
    
}.call(this));


</script>