'use strict';

/* Controllers */

var blogControllers = angular.module('blogControllers', []);
var a, b, c;


blogControllers.controller('BlogCtrl', ['$scope', 'BlogList',
    function BlogCtrl($scope, BlogList) {
        $scope.blogList = [];
        BlogList.get({},
            function success(response) {
                //alert($scope.challenge.question);
                console.log("Success:" + JSON.stringify(response));
                $scope.blogList = response;

            },
            function error(errorResponse) {
                console.log("Error:" + JSON.stringify(errorResponse));
            }
        );
    }]);

blogControllers.controller('BlogViewCtrl', ['$scope', '$routeParams', 'BlogPost', 'BlogPost2', 'Axis',
    function BlogViewCtrl($scope, $routeParams, BlogPost, BlogPost2, Axis) {
        var blogId = $routeParams.id;
        $scope.blg = 1;
        Axis.index({id: blogId},// not necessary
            function success(response) {
                $scope.blogList = angular.fromJson(response)
            },
            function error(errorResponse) {
                console.log("Error:" + JSON.stringify(errorResponse));
            }
        );

        $scope.update = function update(id, name) {
            console.log(id);
            console.log('updateing');
            Axis.update({id: id, name: name},
                function success(response) {
//                    $scope.blogList = angular.fromJson(response)
                },
                function error(errorResponse) {
                    console.log("Error:" + JSON.stringify(errorResponse));
                }
            );
        };

        $scope.create = function create(name) {
            if ($scope.add) {

                Axis.create({name: name},
                    function success(response) {
                    },
                    function error(errorResponse) {
                        console.log("Error:" + JSON.stringify(errorResponse));
                    })

            }
            else
                $scope.add = true;


        };

    }]);
