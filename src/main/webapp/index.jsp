<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>


<script type="text/javascript">
            var app = angular.module("userManagement", []);
         
            //Controller Part
            app.controller("userController", function($scope, $http) {
         
               
                $scope.userlist = [];
                
                /*
                $scope.userForm = {
                    id : -1,
                    userName : "",
                    age : ""
                };*/
         
                //load the data from server
                _refreshuserData();
         
                //HTTP POST/PUT methods for add/edit user 
             
                /*
                $scope.submituser = function() {
         
                    var method = "";
                    var url = "";
                    if ($scope.userForm.id == -1) {
                        //Id is absent in form data,create new user operation
                        method = "POST";
                        url = 'rest/userlist';
                    } else {
                        //Id is present in form data, edit user operation
                        method = "PUT";
                        url = 'rest/userlist';
                    }
                    
                    console.log("criado: " + userForm.userName);
         
                    $http({
                        method : method,
                        url : url,
                        data : angular.toJson($scope.userForm),
                        headers : {
                            'Content-Type' : 'application/json'
                        }
                    }).then( _success, _error );
                };
         
                //HTTP DELETE- delete user by Id
                $scope.deleteuser = function(user) {
                    $http({
                        method : 'DELETE',
                        url : 'rest/userlist/' + user.id
                    }).then(_success, _error);
                };
 
             // In case of edit, populate form fields and assign form.id with user id
                $scope.edituser = function(user) {
                  
                    $scope.userForm.userName = user.userName;
                    $scope.userForm.age = user.age;
                    $scope.userForm.id = user.id;
                };
                
                */
         
                // Private Methods 
                //HTTP GET- get all userlist collection
                function _refreshuserData() {
                    $http({
                        method : 'GET',
                        url : 'http://localhost:8080/CRUDAngularJSJersey/api/crud'
                    }).then(function successCallback(response) {
                        $scope.userlist = response.data;
                    }, function errorCallback(response) {
                        console.log(response.statusText);
                    });
                }
         
                function _success(response) {
                    _refreshuserData();
                    //_clearFormData()
                }
         
                /*
                function _error(response) {
                    console.log(response.statusText);
                }
         
                //Clear the form
                function _clearFormData() {
                    $scope.userForm.id = -1;
                    $scope.userForm.userName = "";
                    $scope.userForm.age = "";
                
                };
                */
                
            });
        </script>


</head>
<body>

	<h2>Minha aplicação Jersey RESTful!</h2>

	<p>
		<a href="api/myresource">Jersey resource</a>
	<p>
		<a href="api/crud">CRUD</a>
	<div class="container" ng-app="userManagement" ng-controller="userController">
		<h2>Vertical (basic) form</h2>
		<form action="/action_page.php">
			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" placeholder="Enter email"
					name="email">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" placeholder="Enter password"
					name="pwd">
			</div>
			<div class="checkbox">
				<label><input type="checkbox" name="remember">
					Remember me</label>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>

		<h2>Bordered Table</h2>
		<p>The .table-bordered class adds borders to a table:</p>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>Usuário</th>
					<th>Idade</th>
					<th>Ação</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="user in userlist">
               
    <td> {{user.userName}}</td>
    <td >{{user.age}}</td>  
                
                <td><a ng-click="edituser(user)" >Edit</a> | <a ng-click="deleteuser(user)">Delete</a></td>
            </tr>
			</tbody>
		</table>

	</div>

</body>
</html>
