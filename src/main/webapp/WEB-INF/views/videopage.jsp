<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>videopage</title>

    <meta charset="utf-8">
    <title> OMFG </title>
    <link rel="stylesheet" href="/resources/css/style_for_video.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>


    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>

<body background="/resources/content/bckg_img.png">

    <div class="header">
        <div class = "logo"><a href="/index"><img src="/resources/content/logo.png"></a></div>
    </div>


    <div class="menu" align="center">
        <div class="search_butt"><a href="/search">SEARCH</a></div>

        <c:if test="${pageContext.request.userPrincipal != null}">
            <div class="fav_butt"><a href="/favourite">FAVOURITE</a></div>

            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <a onclick="document.forms['logoutForm'].submit()"><div class="exit_butt"></div></a>
        </c:if>
        <c:if test="${pageContext.request.userPrincipal == null}">
            <a href="/login"><div class="login_butt"></div></a>
        </c:if>
    </div>


    <div class="center">

        <video id="video1"  controls preload> <!--16/9-->
            <source src="${video.src}" type="video/mp4">
            Your browser does not support HTML5 video.
         </video>

        <script>
            var v= document.getElementById("video1");
            v.onclick = function() {
                 if (v.paused) {
                     v.play();
                 } else {
                     v.pause();
                 }
            };
        </script>
        <br><br>

        <c:if test="${pageContext.request.userPrincipal != null}">
            <div class="like">
                <c:if test="${ifLiked == false}">
                    <a href="/like/${video.id}"><img src="/resources/content/like_button.png"></a>
                </c:if>
                <c:if test="${ifLiked == true}">
                    <a href="/dislike/${video.id}"><img src="/resources/content/like_button_yes.png"></a>
                 </c:if>
            </div>
        </c:if>

        <div class="description">${video.description}</div>

        <br>
        <div class="separator"></div>

        <div class="tags">
             <c:forEach items="${tags}" var="tag">
                 <div class="nonchosen_tag">${tag.name}</div>
             </c:forEach>
        </div>
    </div>

</body>
</html>
