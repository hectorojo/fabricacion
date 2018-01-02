<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>

</head>
<body>
<h2>List of available products</h2>
	
    <!-- div for apply styling to table  -->
	<div class="datagrid">
		<table>
			<tr>
				<th>Product ID</th>
                <th>Product Name</th>
                <th>Cost($)</th> 
			</tr>
 
			<!-- loop over and print our customers -->
			<c:forEach var="bike" items="${bikes}">
 
				<tr>
				<td>${bike.id}</td>
				<td>${bike.model}</td>
				<td>${bike.manufacturer}</td>
				</tr>
 
			</c:forEach>
		</table>
	</div>

</body>
</html>