<!DOCTYPE html ng-app="myApp">
<html ng-controller="UsersController">
<!-- header code -->
<body>
 
<div ng-repeat="user in bikes">{{bike.model}} {{bike.manufacturer}}</div>
 
<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.js"></script>
<script type="text/javascript" src="webjars/angularjs/1.3.8/angular.min.js"></script>
<script type="text/javascript" src="webjars/angularjs/1.3.8/angular-resource.min.js"></script>
</body>
</html>