<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<meta charset="UTF-8">
	<title>Music fest!</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> 
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1 class="text-center display-1 bg-dark text-white">Your Music Fest Lineup!</h1>

         <div class="mainTop">
			<h1 class="text-center display-5">Posted by: <c:out value="${user.userName}"/></h1>
		
			
			<p>6-7: <span>  </span> <c:out value="${lineup.timeslot1}"/></p>
			<p>7-8: <span>  </span> <c:out value="${lineup.timeslot2}"/></p>
			<p>8-9: <span>  </span> <c:out value="${lineup.timeslot3}"/></p>
			<p>9-10: <span>  </span> <c:out value="${lineup.timeslot4}"/></p>
			<p>10-11: <span>  </span> <c:out value="${lineup.timeslot5}"/></p>
			<p>11-12: <span>  </span> <c:out value="${lineup.timeslot6}"/></p>


		<div class="btn-group" role="group" aria-label="Basic example">
  			<a href="/home" type="button" class="btn btn-secondary">Home</button></a>
  			<a href="/lineup/edit/${lineup.id}" button type="button" class="btn btn-outline-info"><c:out value="Make Changes"></c:out></a>
  			<a href="/logout" button type="button" class="btn btn-secondary">Logout</button></a>
		</div>
</div>
</body>

</html>
	
	
	
	
	
	
	
	
	
	
	
	
	
	


