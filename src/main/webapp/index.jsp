<!DOCTYPE html>
<html lang="en">
<head>
<title>Jersey RESTful CRUD web application</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>


<script type="text/javascript">
	var app = angular.module("userManagement", []);

	//Controller Part
	app.controller("userController", function($scope, $http) {

		$scope.userlist = [];

		$scope.userForm = {
			id : -1,
			userName : "",
			age : ""
		};

		//load the data from server
		_refreshuserData();

		//HTTP POST/PUT methods for add/edit user 
		$scope.submituser = function() {

			var method = "";
			var url = "";
			if ($scope.userForm.id == -1) {
				//Id is absent in form data,create new user operation
				method = "POST";
				url = 'api/crud';
			} else {
				//Id is present in form data, edit user operation
				method = "PUT";
				url = 'api/crud';
			}

			$http({
				method : method,
				url : url,
				data : angular.toJson($scope.userForm),
				headers : {
					'Content-Type' : 'application/json'
				}
			}).then(_success, _error);
		};

		//HTTP DELETE- delete user by Id
		$scope.deleteuser = function(user) {
			$http({
				method : 'DELETE',
				url : 'api/crud/' + user.id
			}).then(_success, _error);
		};

		// In case of edit, populate form fields and assign form.id with user id
		$scope.edituser = function(user) {

			$scope.userForm.userName = user.userName;
			$scope.userForm.age = user.age;
			$scope.userForm.id = user.id;
		};

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
			_clearFormData()
		}

		function _error(response) {
			console.log(response.statusText);
		}

		//Clear the form
		function _clearFormData() {
			$scope.userForm.id = -1;
			$scope.userForm.userName = "";
			$scope.userForm.age = "";

		}
		;

	});
</script>


</head>
<body>

	<div class="container" ng-app="userManagement"
		ng-controller="userController">
		
		<h1>Jersey RESTful CRUD web application</h1>
		
		<h2>User's form</h2>
		<form ng-submit="submituser()">
			<div class="form-group">
				<label for="name">Name:</label> <input type="text"
					class="form-control" id="name" placeholder="Enter name" name="name"
					ng-model="userForm.userName">
			</div>
			<div class="form-group">
				<label for="pwd">Age:</label> <input type="text"
					class="form-control" id="pwd" placeholder="Enter age" name="age"
					ng-model="userForm.age">
			</div>

			<button type="submit" class="btn btn-default">Save</button>
		</form>

		<h2>List of users</h2>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>Name</th>
					<th>Age</th>
					<th>Action</th>
				</tr>	
			</thead>
			<tbody>
				<tr ng-repeat="user in userlist">

					<td>{{user.userName}}</td>
					<td>{{user.age}}</td>

					<td><a ng-click="edituser(user)">Edit</a> | <a
						ng-click="deleteuser(user)">Delete</a></td>
				</tr>
			</tbody>
		</table>

	</div>

</body>
</html>
