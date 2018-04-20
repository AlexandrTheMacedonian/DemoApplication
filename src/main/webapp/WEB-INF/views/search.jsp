<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <title> OMFG Search</title>
    <link rel="stylesheet" href="/resources/css/style_for_search.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
</head>

<body background="/resources/content/bckg_img.png">

<div class="header">
    <div class = "logo"><a href="index"><img src="/resources/content/logo.png"></a></div>
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



<form method="post" action="result">
    <div class = "wrapper">
        <div class="tags">

            <div class="instruction">All Tags :</div>
            <br>

            <c:forEach items="${tags}" var="tag">
                <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                <input type="checkbox" name="${tag.id}" id="${tag.id}" class="hide-checkbox" value="${tag.name}">
                <label for="${tag.id}">${tag.name}</label>
            </c:forEach>

        </div>
        <div class="getit">
            <input type="submit" value="Search" id="get_button">
            <label for="get_button">
                <div class="button" align="center">
                    Search
                </div>
            </label>
        </div>
    </div>
</form>


<%--<form:form method="POST" modelAttribute="ctags">--%>
    <%--<c:forEach items="${tags}" var="tag">--%>
        <%--<spring:bind path="PRESENT">--%>
            <%--<form:input type="checkbox" path="PRESENT" placeholder="PRESENT"--%>
                        <%--autofocus="true" name="${tag.name}" id="${tag.id}" class="hide-checkbox" value="${tag}"/>--%>
            <%--<label for="${tag}.id">${tag.name}</label>--%>
        <%--</spring:bind>--%>
    <%--</c:forEach>--%>
    <%--<button class="button" type="submit">Search</button>--%>
<%--</form:form>--%>



</body>
</html>
