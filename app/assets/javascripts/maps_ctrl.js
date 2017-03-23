(function(){
 "use strict";
 
 angular.module("app").controller("mapsCtrl", function($scope, $http){
  $scope.setup = function(){
    getApts();
  };
  
  function getApts() {
      $http.get("/apartments.json").then(function(response){
        $scope.apartments = response.data;
      });
    }

  $scope.sortApts = function(neighborhood)
    {
      $scope.neighborhoodSelection = neighborhood;
    };
  

  window.scope = $scope;
 });
}());