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
	<h1 class="text-center display-1 bg-dark text-white">DOJO FEST</h1>
	<h1 class="text-center display-5">Brought to you by GROUP 7!!!</h1>
	<h1 class="text-center">Welcome, <c:out value="${user.userName}"/></h1>
	
	<div class="mainTop">
            <table class="table table-hover table-bordered table-dark">
                <tr>
                    <th> </th>
                    <th>6-7</th>
                    <th>7-8</th>
                    <th>8-9</th>
                    <th>9-10</th>
                    <th>10-11</th>
                    <th>11-12</th>
                </tr>
                <tr>
                    <th>Stage 1</th>
                    <th>Hall & Oates</th>
                    <th>Thomas Rhett</th>
                    <th>iann dior</th>
                    <th>Mayday Parade</th>
                    <th>Two Door Cinema</th>
                    <th><a href="/taylor" type="button" class="btn btn-outline-info" >TAYLOR SWIFT</button></a></th>
                </tr>
                <tr>
                    <th>Stage 2</th>
                    <th>Billy Joel</th>
                    <th>MOMOLAND</th>
                    <th>The Weeknd</th>
                    <th>Blake Shelton</th>
                    <th>Incubus</th>
                    <th><a href="/elton" type="button" class="btn btn-outline-info" >ELTON JOHN</button></a></th>
                </tr>
                <tr>
                    <th>Stage 3</th>
                    <th>Motion City Soundtrack</th>
                    <th>ILLENIUM</th>
                    <th>Phil Collins</th>
                    <th>Death Cab For Cutie</th>
                    <th>blink-182</th>
                    <th><a href="/cash" type="button" class="btn btn-outline-info" >CASH CASH</button></a></th>
                </tr>
            </table>
           
	<div class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	
			<div class="btn-group" role="group" aria-label="Basic example">
  			<a href="/addLineup" type="button" class="btn btn-outline-info" >Make Your Lineup</button></a>
  			<a href="/logout" button type="button" class="btn btn-outline-info">Logout</button></a>
		</div>
	
		</div>

	

	
	<div class="fst-italic">
	
		<h1 class="text-center">Your Music Fest Lineup!</h1>
	</div>
	


         <div class="card text-white bg-dark mb-3 style="max-width: 18rem;">
         <div class="card-body">
			<h4 class="text-center">Posted by: <c:out value="${user.userName}"/></h4>
		<div class="text-center">
				<c:forEach var="lineup" items="${lineups}">	
			<a href="view/${lineup.id}"class="btn btn-outline-info" ><c:out value="${lineup.name}"/></a>
			</c:forEach>	
		</div>
		</div>


		</div>
		
		<div class="text-center"> <a href="/credit" button type="button" class="btn btn-outline-info">Collaborators!</button></a></div>

        



</body>
</html>