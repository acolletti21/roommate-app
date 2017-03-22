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

  $scope.filterByPath = function(path) {
    $scope.PathFilterId = path ? path.id : null;    
  };

  $scope.showMatch = function(path){
    var paths = document.getElementsByTagName('path');
      for (var i=0, length = paths.length; i < length; i++) {
        var searchKey = paths[i];
          if (searchKey.id == apartment.neighborhood){
          apartment.style.display = '';
        } else {
          apartment.style.display = 'none';
        }
      }
    };


  window.scope = $scope;
 });
}());
  
     //add more models here
  // function showList(){
  //   var paths = document.getElementsByTagName('path');
  //     for (var i=0, length = paths.length; i < length; i++) {
  //       var searchKey = paths[i];
  //         if (path.id == listing.neighborhood);

  //    //paths[i].className = "newclass"; //this will go through all of them to change the class but i'll leave this here for reference..
  //    //    var searchKey = paths[i]; < try something like that to make the clicked item's  id th new search/sort term
  //   }
  // } 