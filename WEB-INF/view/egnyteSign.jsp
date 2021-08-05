<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication" %>

<% 
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title><spring:message code="label.filepikerWigdget"/> | DrySign</title>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>
    <script src="<%=appUrl %>/egnyte/dist/egnyte.js"></script>
    <script src="<%=appUrl %>/egnyte/spec/conf/apiaccess.js"></script>
    <script src="<%=appUrl %>/js/jquery.min.js"></script>
</head>

<body>
    
    <div id="there">


    </div>
    <div id="andback">


    </div>
    <div id="loading" style="display:none;'"><spring:message code="label.lding"/></div>
    
<!-- <a href="http://kanishkkunal.in"  target="popup"   onclick="window.open('http://kanishkkunal.in','popup','width=300,height=300'); return false;">
    Open Link in Popup
</a> -->
   
    <script>
    $(document).ready(function(){
    	requestToken()
    });
    var eg;
    var adomain;
    var akey;
    function requestToken() {
       
    	if (window.location.hash.length < 3) {
    		  var domain =prompt("Enter your Egnyte domain address,\n eg-https://your_subdomain.egnyte.com", "https://");//"https://drysignglobal.egnyte.com";
            //    var someVarName = domain;
                //localStorage.setItem("someVarKey", someVarName);
               // var key = "edwj4c4ryhw8whs3gpvjhuww";
    	}
    	else{
            //if a hash is set, it contains the token and domain/key pair is not needed anymore
            //prompting for them would just annoy you as you use the example :)
           // var someVarName = localStorage.getItem("someVarKey");
         //   var domain = someVarName;
            //var key = "edwj4c4ryhw8whs3gpvjhuww";
        }
             eg = Egnyte.init(domain, {
                key: key,
                mobile: true
            });
            eg.API.auth.requestTokenReload(function() {
               // document.getElementById("token").innerHTML = "Your token: "+eg.API.auth.getToken();
            	openPicker();

            });
            
        
    }
    	var base64;
    	var fileName;
        var node = document.getElementById("there");
        var node2 = document.getElementById("andback");

      /*   eg = Egnyte.init(egnyteDomain, {
            token: APIToken
        }); */

        function openPicker() {

            eg.filePicker(node, {
                selection: function (list) {
                    workWithImage(list[0]);
                },
                cancel: function () {
                    console.warn("cancelled");
                },
                select: {
                    folder: false,
                    file: true,
                    multiple: false
                },
                filterExtensions: function(ext3chars, mime){
                	   return ext3chars==="png","jpg"; //show only htm* files
                	}
            });

        }


        function workWithImage(fileData) {
            node2.innerHTML = '';
            //create a link for anybody to access the file
            eg.API.link.createLink({
                path: fileData.path,
                type: "file",
                accessibility: "password"
            }).then(function (newLink) {
            	$("#loading").show();
                //var linkBox = document.createElement("div");
               // linkBox.innerHTML += ' Share: <a href="' + newLink.links[0].url + '">' + newLink.links[0].url + '</a>' + '<p>password: ' + newLink.password + '</p>';
               // node2.appendChild(linkBox);
            });

            // download and use the file
            // in modern browsers you can even work with binary data
         
            eg.API.storage.fileId(fileData.group_id).download(fileData.entry_id,true).then(function (xhr) {			
                var arrayBuffer = xhr.body; // Note: not oReq.responseText
                var binaryString = '';
                if (arrayBuffer) {
                    var byteArray = new Uint8Array(arrayBuffer);
                    for (var i = 0; i < byteArray.byteLength; i++) {
                        binaryString += String.fromCharCode(byteArray[i]); //extracting the bytes
                    }
                    base64 = window.btoa(binaryString); //creating base64 string
				    fileName = fileData.name;
					CloseMySelf();
                    img.src = "data:image/png;base64," + base64; //creating a base64 uri
                    console.log("test-->"+img.src);
                    node2.appendChild(img);

                }
            });
        }
        
        function CloseMySelf() {
            try {
                
              window.opener.HandlePopupResultPic(base64,fileName);
              $("#loading").hide();
            }
            catch (err) {}
            window.close();
            return false;
        }
    </script>
</body>



</html>
