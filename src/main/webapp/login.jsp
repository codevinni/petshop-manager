<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>

	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
		<title>Petshop Manager</title>
		
		<!-- Bulma CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css">
	</head>
	
	<body>
		
		<div class="container is-fluid">
	
			<div class="field">
				<p class="control has-icons-left has-icons-right">
					<input class="input" type="email" placeholder="Email">
					<span class="icon is-small is-left">
						<i class="fas fa-user"></i>
					</span>
					<span class="icon is-small is-right">
						<i class="fas fa-check"></i>
					</span>
				</p>
			</div>
			
			<div class="field">
				<p class="control has-icons-left">
					<input class="input" type="password" placeholder="Password">
					<span class="icon is-small is-left">
					<i class="fas fa-lock"></i>
					</span>
				</p>
			</div>
			
			<div class="field">
				<p class="control">
					<button class="button is-success">
						Login
					</button>
				</p>
			</div>
		
		</div>
		
	</body>
	
	<script src="https://kit.fontawesome.com/42a12cf5f7.js"></script>
	
</html>