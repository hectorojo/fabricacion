<!DOCTYPE html>
<html ng-app="app">
<head>
<meta charset="ISO-8859-1">
<title>User CRUD</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script src="view/app.js"></script>
<style>
a {
	cursor: pointer;
	background-color: lightblue;
}
</style>
</head>
<body>
	<div ng-controller="UserCRUDCtrl">
			<table>
				<tr>
					<td width="100">ID:</td>
					<td><input type="text" id="id" ng-model="user.id" /></td>
				</tr>
				<tr>
					<td width="100">Name:</td>
					<td><input type="text" id="name" ng-model="user.name" /></td>
				</tr>
				<tr>
					<td width="100">Email:</td>
					<td><input type="text" id="email" ng-model="user.email" /></td>
				</tr>
			</table>
			<br /> <br /> 
			<a ng-click="getUser(user.id)">Get User</a> 
			<a ng-click="updateUser(user.id,user.name,user.email)">Update User</a> 
			<a ng-click="addUser(user.name,user.email)">Add User</a> 
			<a ng-click="deleteUser(user.id)">Delete User</a>

		<br /> <br />
		<p style="color: green">{{message}}</p>
		<p style="color: red">{{errorMessage}}</p>

		<br />
		<br /> 
		<a ng-click="getAllUsers()">Get all Users</a><br /> 
		<br /> <br />
		<div ng-repeat="usr in users">
			{{usr.name}} {{usr.email}}
		</div>
	</div>
</body>
</html>

