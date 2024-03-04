<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MP
K8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<form method="post" action="addUser.jsp">
			<div class="mb-3">
				<br>
				<br> <label for="uid" class="form-label">Enter UID</label> <input
					type="text" class="form-control" id="uid" name="uid">
			</div>
			<div class="mb-3">
				<label for="pwd" class="form-label">Enter Password</label> <input
					type="password" class="form-control" id="pwd" name="pwd">
			</div>
			<div class="mb-3">
				<label for="role" class="form-label">Enter Role</label> <input
					type="text" class="form-control" id="role" name="role">
			</div>
			<div class="mb-3">
				<label for="name" class="form-label">Enter Name</label> <input
					type="text" class="form-control" id="name" name="name">
			</div>
			<div class="mb-3">
				<input type="submit" class="btn btn-primary" value="Add User"
					name="addUserBtn">
			</div>
			div class="row mb-3">
			<div class="col-6">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="displayall"
						name="displayall"> <label class="form-check-label"
						for="displayall">Display All</label>
				</div>
			</div>
			<div class="col-6">
				<input type="submit" class="btn btn-primary" value="Display">
			</div>
	</div>
	</form>
	<hr>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq
46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>