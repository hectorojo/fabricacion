<!DOCTYPE html ng-app="myApp">
<html ng-controller="UsersController">
<!-- header code -->
<body>
 
<div ng-repeat="user in bikes">{{bike.model}} {{bike.manufacturer}}</div>
 
<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular-resource.min.js"></script>
<script src="view/app.js"></script>
</body>
</html>