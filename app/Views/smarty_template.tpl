<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Welcome to CodeIgniter 4!</title>
</head>
<body>
<header>
	<h1>Hello {$user}</h1>
</header>

<!-- CONTENT -->

<section>
	<ul>
		<li>Phone: {$info.tel}</li>
		<li>Email: {$info.email}</li>
		<li>Birthday: {$info.dob}</li>
	</ul>
</section>
<section>
	<ul>
		<li>Site: {site_url()}</li>
	</ul>
</section>

<!-- FOOTER: DEBUG INFO + COPYRIGHTS -->

<footer></footer>

</body>
</html>
