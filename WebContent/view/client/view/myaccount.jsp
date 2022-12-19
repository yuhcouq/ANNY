<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add to Cart</title>
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">
<c:url value="/view/client/static" var="url"></c:url>

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="${url}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${url}/css/shop.style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="${url}/css/headers/header-v5.css">
<link rel="stylesheet" href="${url}/css/footers/footer-v4.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="${url}/plugins/animate.css">
<link rel="stylesheet" href="${url}/plugins/line-icons/line-icons.css">
<link rel="stylesheet"
	href="${url}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${url}/plugins/jquery-steps/css/custom-jquery.steps.css">
<link rel="stylesheet"
	href="${url}/plugins/scrollbar/css/jquery.mCustomScrollbar.css">

<!-- Style Switcher -->
<link rel="stylesheet" href="${url}/css/plugins/style-switcher.css">

<!-- CSS Theme -->
<link rel="stylesheet" href="${url}/css/theme-colors/default.css"
	id="style_color">

<!-- CSS Customization -->
<link rel="stylesheet" href="${url}/css/custom.css">
</head>
<body>
	<div class="header-v5 header-static">
		<!-- Topbar v3 -->
		<jsp:include page="/view/client/view/topbar.jsp"></jsp:include>
		<!-- End Topbar v3 -->

		<!-- Navbar -->
		<jsp:include page="/view/client/view/navbar.jsp">
			<jsp:param name="category" value="0"/>
		</jsp:include>
		<!-- End Navbar -->
	</div>
	<div class="container bootstrap snippet">
	<br>
	<br>
	<br>
		<div class="row">
			<div class="col-sm-10">
				<h1 style="text-transform: uppercase"><b>${sessionScope.account.username }</b></h1>
			</div>
			<div class="col-sm-2">
				<a href="${pageContext.request.contextPath }" class="pull-right"><img
					title="profile image" class="img-circle img-responsive"
					src="http://www.gravatar.com/avatar/28fd20ccec6865e2d5f0e1f4446eb7bf?s=100"></a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<!--left col-->
				<c:url value="/member/myaccount" var="myaccount"></c:url>
				<form class="form" action="${myaccount }" method="post"
					id="registrationForm" enctype="multipart/form-data">
					<input name="role" value="${sessionScope.account.roleId }" hidden="" >
					<input name="id" value="${sessionScope.account.id }" hidden="">
					<div class="text-center">
						<c:url value="/image?fname=${sessionScope.account.avatar }"
							var="imgUrl"></c:url>
						<img src="${imgUrl }" class="avatar img-circle img-thumbnail"
							alt="avatar">
						<h6>Upload a different photo...</h6>
						<input type="file" name="avatar" class="text-center center-block file-upload">
					</div>
					</hr>
					<br>
			</div>
			<!--/col-3-->
			<div class="col-sm-9">



				<div class="tab-content">
					<div class="tab-pane active" id="home">
						<hr>

						<div class="form-group">

							<div class="col-xs-6">
								<label for="first_name"><h4>User Name:</h4></label> <input
									type="text" class="form-control" name="username"
									id="first_name" value="${sessionScope.account.username }"
									title="enter your first name if any.">
							</div>
						</div>

						<div class="form-group">

							<div class="col-xs-6">
								<label for="first_name"><h4>Email:</h4></label> <input
									type="text" class="form-control" name="email" id="first_name"
									value="${sessionScope.account.email }"
									title="enter your first name if any.">
							</div>
						</div>
						<div class="form-group">

							<div class="col-xs-6">
								<label for="phone"><h4>Password</h4></label> <input
									type="password" class="form-control" name="password" id="phone"
									value="${sessionScope.account.password }"
									title="enter your phone number if any.">
							</div>
						</div>

						<div class="form-group">

							<div class="col-xs-6">
								<label for="last_name"><h4>Website</h4></label> <input
									type="text" class="form-control" name="website" id="last_name"
									value="http://anny.com" title="enter your last name if any."
									disabled="disabled">
							</div>
						</div>

						<div class="form-group">
							<div class="col-xs-12">
								<br>
								<button class="btn btn-lg btn-success" type="submit">
									<i class="glyphicon glyphicon-ok-sign"></i> Save
								</button>
								<button class="btn btn-lg" type="reset">
									<i class="glyphicon glyphicon-repeat"></i> Reset
								</button>
							</div>
						</div>
						</form>

						<hr>

					</div>
					<!--/tab-pane-->
					<div class="tab-pane" id="messages">

						<h2></h2>

						<hr>


					</div>
					<!--/tab-pane-->
					<div class="tab-pane" id="settings">


						<hr>
						<form class="form" action="" method="post" id="registrationForm">
							<div class="form-group">

								<div class="col-xs-6">
									<label for="first_name"><h4>First name</h4></label> <input
										type="text" class="form-control" name="first_name"
										id="first_name" placeholder="first name"
										title="enter your first name if any.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="last_name"><h4>Last name</h4></label> <input
										type="text" class="form-control" name="last_name"
										id="last_name" placeholder="last name"
										title="enter your last name if any.">
								</div>
							</div>

							<div class="form-group">

								<div class="col-xs-6">
									<label for="phone"><h4>Phone</h4></label> <input type="text"
										class="form-control" name="phone" id="phone"
										placeholder="enter phone"
										title="enter your phone number if any.">
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-6">
									<label for="mobile"><h4>Mobile</h4></label> <input type="text"
										class="form-control" name="mobile" id="mobile"
										placeholder="enter mobile number"
										title="enter your mobile number if any.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="email"><h4>Email</h4></label> <input type="email"
										class="form-control" name="email" id="email"
										placeholder="you@email.com" title="enter your email.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="email"><h4>Location</h4></label> <input
										type="email" class="form-control" id="location"
										placeholder="somewhere" title="enter a location">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="password"><h4>Password</h4></label> <input
										type="password" class="form-control" name="password"
										id="password" placeholder="password"
										title="enter your password.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="password2"><h4>Verify</h4></label> <input
										type="password" class="form-control" name="password2"
										id="password2" placeholder="password2"
										title="enter your password2.">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12">
									<br>
									<button class="btn btn-lg btn-success pull-right" type="submit">
										<i class="glyphicon glyphicon-ok-sign"></i> Save
									</button>
									<!--<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>-->
								</div>
							</div>
						</form>
					</div>

				</div>
				<!--/tab-pane-->
			</div>
			<!--/tab-content-->

		</div>
		<!--/col-9-->
	</div>
	<!--/row-->

</body>
</html>