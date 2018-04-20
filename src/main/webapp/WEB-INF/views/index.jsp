<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>

<html>
 <head>
     <meta charset="utf-8">
     <title> OMFG Video Hosting</title>
     <link rel="stylesheet" href="/resources/css/style_for_index.css">
     <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
 </head>
    
 <body background="/resources/content/bckg_img.png">
        
     <div class="header">
         <div class = "logo"><a href="index"><img src="/resources/content/logo.png"></a></div>
     </div>  
    
     
     <div class="menu" align="center">

         <div class="search_butt"><a href="search">SEARCH</a></div>

         <c:if test="${pageContext.request.userPrincipal != null}">
             <div class="fav_butt"><a href="favourite">FAVOURITE</a></div>

             <form id="logoutForm" method="POST" action="${contextPath}/logout">
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
             </form>
             <a onclick="document.forms['logoutForm'].submit()"><div class="exit_butt"></div></a>
         </c:if>
         <c:if test="${pageContext.request.userPrincipal == null}">
             <a href="login"><div class="login_butt"></div></a>
         </c:if>
     </div>
     
     
     
     <div class="content">

        <c:forEach items="${listvideo}" var="video">

            <div class = "col_wrapper">
                <a href="videopage/${video.id}"><div class="col${video.id}"></div></a>
            </div>

          <style type="text/css">
              .col${video.id} {
                  margin: auto;
                  width: 250px;
                  height: 200px;
                  padding-left: 0px;
                  display: inline-block;
                  background-size: 100%;
                  background-image: url("${video.file}");
              }
              .col${video.id} img{
                  width: 250px;
                  height: 200px;
              }
              .col${video.id}:hover img{
                  visibility: hidden;
              }
              .col${video.id} a{
                  display: block;
              }
          </style>
        </c:forEach>
     </div>

 </body>
</html>
        