(function(){
 "use strict";
 
 angular.module("app").controller("mapsCtrl", function($scope){
  var names = ["Avondale", "Lakeview", "Roscoe Village", "Logan Square", "Bucktown", "Clyborn Corridor", "Lincoln Park", "Humboldt Park", "Wicker Park", "Goose Island", "Old Town", "Gold Coast", "Ukrainian Village", "River West", "River North", "Streeterville", "West Town", "Little Italy", "West Loop", "Loop", "South Loop", "Pilsen", "Bridgeport", "Chinatown", "Bronzeville"];
  
     //add more models here

  var paths = document.getElementsByTagName('path');
  for (var i=0, length = paths.length; i < length; i++) {
     paths[i].className = "newclass"; //this will go through all of them to change the class but i'll leave this here for reference..
     //     var searchKey = paths[i]; < try something like that to make the clicked item's id th new search/sort term
  }

  window.scope = $scope;
 });
}());