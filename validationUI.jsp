<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MP
K8M2HN"
crossorigin="anonymous">

</head>
<body class="p-4">
<form class="row g-3">
<input type="hidden" name="submitType">
<div class="row g-3 align-items-center">
<div class="col-2">
<label for="" class="col-form-label">UID</label>
</div>
<div class="col-3">
<input type="text" id="uid" name="uid" class="form-control">
</div>
</div>
<div class="row g-3 align-items-center">
<div class="col-2">
<label for="" class="col-form-label">Name</label>
</div>
<div class="col-3">
<input type="text" id="name" name="name" class="form-control">
</div>
</div>
<div class="row g-3 align-items-center">
<div class="col-2">
<label for="inputPassword6"
class="col-form-label">Password</label>
</div>
<div class="col-3">
<input type="password" name="pwd" id="pwd"
class="form-control"
aria-describedby="passwordHelpInline">
</div>
<div class="col-auto">
<span id="passwordHelpInline" class="form-text"> Must be 8-20
characters long. </span>
</div>
</div>
<div class="row g-3 align-items-center">
<div class="col-2">
<label for="" class="col-form-label">Role</label>
</div>
<div class="col-3">
<select class="form-select" aria-label="Default select example"
id='userrole'>
<option value="" id="currentRole" selected
disabled></option>
<option value="admin">Admin</option>
<option value="user">User</option>
<option value="other">Other</option>
</select>
</div>
</div>
<div class="row g-3 align-items-center">
<div class="col-auto">
<button type="button" class="btn btn-primary"
onclick="searchprocess()">Search</button>
</div>
<div class="col-auto">
<button type="button" class="btn btn-primary"
onclick="addUser()">Add</button>
</div>
<div class="col-auto">
<button type="button" class="btn btn-primary"
onclick="deleteUser()">Delete</button>
</div>
<div class="col-auto">
<button type="button" class="btn btn-primary"
onclick="editUser()">Edit</button>
</div>
<br><br>
<div id="responseMsg"></div>
</div>
</form>
<div id="output"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE
2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous"
referrerpolicy="no-referrer"></script>
<script type="text/javascript">
function searchprocess() {
$.ajax({
type: "post",
url: "process.jsp",
data: "op=search&uid=" + $('#uid').val(),
success: function (msg) {
var res = msg.split("&");
console.log(res);
$('#uid').val(res[0]);
$('#name').val(res[1]);
$('#pwd').val(res[2]);
$('#currentRole').html(res[3]);
}
});
}
function deleteUser() {
$.ajax({
type: "post",
url: "process.jsp",
data: "op=delete&uid=" + $('#uid').val(),
success: function (msg) {
$('#responseMsg').html(msg); // Update HTML element with id "responseMsg"
}
});
}
function editUser() {
$.ajax({
type: "post",
url: "process.jsp",
data: "op=edit&uid=" + $('#uid').val() + "&name=" + $('#name').val() + "&pwd=" +
$('#pwd').val() + "&role=" + $('#userrole').val(),
success: function (msg) {
$('#responseMsg').html(msg); // Update HTML element with id "responseMsg"
}
});
}
function addUser() {
$.ajax({
type: "post",
url: "process.jsp",
data: "op=add&uid=" + $('#uid').val() + "&name=" + $('#name').val() + "&pwd=" +
$('#pwd').val() + "&role=" + $('#userrole').val(),
success: function (msg) {
$('#responseMsg').html(msg); // Update HTML element with id "responseMsg"
}
});
}
</script>
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq
46cDfL"
crossorigin="anonymous"></script>

</body>
</html>