<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Energym</title>
  <link
          rel="stylesheet"
          type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css"
  />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="../../resources/css/bootstrap.css" />

  <!-- fonts style -->
  <link
          href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Dosis:400,600,700|Poppins:400,600,700&display=swap"
          rel="stylesheet"
  />
  <!-- Custom styles for this template -->
  <link href="../../resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="../../resources/css/responsive.css" rel="stylesheet" />
  <link href="../../resources/css/logincss.css" rel="stylesheet" />
</head>
<%@ include file="./header.jsp"%>
<body>
  <div class="main">
    <h1 class="logo">로그인</h1>
    <form action="login" method="post">
    <div class="container">
      <input type="text" placeholder="ID" name="b_id" id="b_id" class="account">
      <input type="password" placeholder="Password" name="b_pwd1" id="b_pwd1" class="account">
      <button type="submit" id="login" class="account">login</button>
      <p id="alert" class="account"> </p>
    </div>
  </form>
</div>
<%@ include file="./footer.jsp"%>
<script src="script.js">
  console.log(b_id);
  console.log(b_pwd1);
</script>
</body>
</html>
