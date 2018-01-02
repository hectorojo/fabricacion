<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <head>
        <title>Maquinas</title>
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.7/angular.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.7/angular-route.js"></script>
    </head> 
</head>
 <body ng-app="ng-centroDeCosto" class="head-box2-center">
        <div class="container">
            <div ng-view></div>
        </div>

        <script type="text/javascript">
            
            angular.module('ng-centroDeCosto', ['ng-centroDeCosto.filters', 'ng-centroDeCosto.services', 'ng-centroDeCosto.directives', 'ng-centroDeCosto.controllers']).
                config(['$routeProvider', function ($routeProvider) {
                    $routeProvider.when('/centroDeCostos/nuevo', {templateUrl: 'partials/nuevo-centroDeCosto.html', controller: 'CentroDeCostoCreationCtrl'});
                    $routeProvider.otherwise({redirectTo: '/centroDeCostos'});
                    /* $routeProvider.otherwise({redirectTo: function(){
                    	window.location = "campos";
                    }}); */
                }]);
            
            angular.module('ng-centroDeCosto.filters', []).
            filter('interpolate', ['version', function(version) {
              return function(text) {
                return String(text).replace(/\%VERSION\%/mg, version);
              }
            }]);
            
            var services = angular.module('ng-centroDeCosto.services', ['ngResource']);
            
            services.factory('CentroDeCostosFactory', function ($resource) {
                return $resource('/agropecuaria-erp/ajax/centroDeCostos', {}, {
                    query: { method: 'GET', isArray: true },
                    create: { method: 'POST', params: {nombre: '@nombre'}}
                },{},function(error){
                	alert('error');
                })
                
            
            });
            
            services.factory('CentroDeCostoFactory', function ($resource) {
                return $resource('/agropecuaria-erp/ajax/centroDeCostos/:id', {}, {
                    show: { method: 'GET' },
                    update: { method: 'PUT', params: {id: '@id'} },
                    delete: { method: 'DELETE', params: {id: '@id'} }
                })
            });
            
            services.factory('CentroDeCostoSelectFactory', function ($resource) {
                return $resource('/agropecuaria-erp/ajax/centroDeCostos/select/:id', {}, {
                    select: { method: 'PUT', params: {id: '@id'} }
                })
            });
            
            services.factory('CentroDeCostoShareFactory', function ($resource) {
                return $resource('/agropecuaria-erp/ajax/centroDeCostos/compartir/:id', {}, {
                	getRoles: { method: 'GET', isArray: true },
                	share: { method: 'POST', params: {id: '@id', email: '@email', role: '@role'} }
                })
            });
            
            angular.module('ng-centroDeCosto.directives', []).
            directive('appVersion', ['version', function(version) {
              return function(scope, elm, attrs) {
                elm.text(version);
              };
            }]);

            
            var app = angular.module('ng-centroDeCosto.controllers', []);
        
            // Clear browser cache (in development mode)
            //
            // http://stackoverflow.com/questions/14718826/angularjs-disable-partial-caching-on-dev-machine
            app.run(function ($rootScope, $templateCache) {
                $rootScope.$on('$viewContentLoaded', function () {
                    $templateCache.removeAll();
                });
            });
        
            app.controller('CentroDeCostoListCtrl', ['$scope', 'CentroDeCostosFactory', 'CentroDeCostoFactory', 'CentroDeCostoSelectFactory','$location',
                function ($scope, CentroDeCostosFactory, CentroDeCostoFactory, CentroDeCostoSelectFactory, $location) {
        
                    $scope.editCentroDeCosto = function (centroDeCostoId) {
                        $location.path('/centroDeCostos/' + centroDeCostoId);
                    };
                    
                    $scope.selectCentroDeCosto = function (centroDeCostoId) {
                    	CentroDeCostoSelectFactory.select({ id: centroDeCostoId });
                    	window.location = "campos";
                    };
        
                    $scope.deleteCentroDeCosto = function (centroDeCostoId) {
                    	CentroDeCostoFactory.delete({ id: centroDeCostoId });
                    	CentroDeCostosFactory.query(function(data) {
                            $scope.centroDeCostos = data;
                        });
                    };
        
                    $scope.createNewCentroDeCosto = function () {
                        $location.path('/centroDeCostos/nuevo');
                    };
                    
                    $scope.shareCentroDeCosto = function (centroDeCostoId) {
                        $location.path('/centroDeCostos/'+ centroDeCostoId + '/compartir');
                    };
        
                    CentroDeCostosFactory.query(function(data) {
                        $scope.centroDeCostos = data;
                    });
                }]);
        
            app.controller('CentroDeCostoDetailCtrl', ['$scope', '$routeParams', 'CentroDeCostoFactory', '$location',
                function ($scope, $routeParams, CentroDeCostoFactory, $location) {
        
                    $scope.updateCentroDeCosto = function () {
                        CentroDeCostoFactory.update($scope.centroDeCosto);
                        $location.path('/centroDeCostos');
                    };
        
                    // callback for ng-click 'cancel':
                    $scope.cancel = function () {
                        $location.path('/centroDeCostos');
                    };
        
                    $scope.centroDeCosto = CentroDeCostoFactory.show({id: $routeParams.id});
                }]);
        
            app.controller('CentroDeCostoCreationCtrl', ['$scope', 'CentroDeCostosFactory', '$location',
                function ($scope, CentroDeCostosFactory, $location) {
        
                    $scope.createNewCentroDeCosto = function() {
                    	CentroDeCostosFactory.create(
                                $scope.centroDeCosto, 
                                function() {
                                	$scope.submitError = false;
                                    $location.path('/centroDeCostos');
                                },
                                function() {
                                    $scope.submitError = true;
                                }
                        );
                    }
                }]);
            
            app.controller('CentroDeCostoShareCtrl', ['$scope', '$routeParams', 'CentroDeCostoShareFactory', '$location',
                                                 function ($scope, $routeParams, CentroDeCostoShareFactory, $location) {
                                         
                                                     $scope.shareCentroDeCosto = function() {
                                                    	 CentroDeCostoShareFactory.share(
                                                     			{id: $routeParams.id, email: $scope.email, role: $scope.selectedRole},
                                                     			function(){
                                                     				$scope.submitError = false;
                                                                    $location.path('/centroDeCostos');
                                                     			},
                                                     			function(){
                                                     				$scope.submitError = true;
                                                     			}
                                                     			
                                                                 
                                                         );
                                                     }
                                                     
                                                     CentroDeCostoShareFactory.getRoles({id: $routeParams.id},
                                                    		 function(data) {
                                                         $scope.roles = data;
                                                     });
                                                     
                                                     $scope.cancel = function(){
                                                     	$location.path('/centroDeCostos');
                                                     };
                                                 }]);
    
        </script>
</body>
</html>