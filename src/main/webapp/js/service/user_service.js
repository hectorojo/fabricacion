'use strict';

angular.module('myApp').factory('UserService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8080/fabricacion/bike/';

    var factory = {
        fetchAllUsers: fetchAllUsers,
        createUser: createUser,
        updateUser:updateUser,
        deleteUser:deleteUser
    };

    return factory;

    function fetchAllUsers() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Bikes');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function createUser(bike) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, bike)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating Bike');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }


    function updateUser(bike, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+id, bike)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating Bike');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function deleteUser(id) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI+'delete/',id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting Bike');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

}]);
