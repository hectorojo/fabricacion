'use strict';

angular.module('myApp').controller('UserController', ['$scope', 'UserService', function($scope, UserService) {
    var self = this;
    self.bike={id:null,manufacturer:'',model:''};
    self.bikes=[];

    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;


    fetchAllUsers();

    function fetchAllUsers(){
        UserService.fetchAllUsers()
            .then(
            function(d) {
                self.bikes = d;
            },
            function(errResponse){
                console.error('Error while fetching Bikes');
            }
        );
    }

    function createUser(bike){
        UserService.createUser(bike)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while creating Bike');
            }
        );
    }

    function updateUser(bike, id){
        UserService.updateUser(bike, id)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while updating Bike');
            }
        );
    }

    function deleteUser(id){
        UserService.deleteUser(id)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while deleting Bike');
            }
        );
    }

    function submit() {
        if(self.bike.id===null){
            console.log('Saving New Bike', self.bike);
            createUser(self.bike);
        }else{
            updateUser(self.bike, self.bike.id);
            console.log('Bike updated with id ', self.bike.id);
        }
        reset();
    }

    function edit(id){
        console.log('id to be edited', id);
        for(var i = 0; i < self.bikes.length; i++){
            if(self.bikes[i].id === id) {
                self.bike = angular.copy(self.bikes[i]);
                break;
            }
        }
    }

    function remove(id){
        console.log('id to be deleted', id);
        if(self.bike.id === id) {//clean form if the user to be deleted is shown there.
            reset();
        }
        deleteUser(id);
    }


    function reset(){
        self.bike={id:null,manufacturer:'',model:''};
        $scope.myForm.$setPristine(); //reset Form
    }

}]);
