<%--
  Created by IntelliJ IDEA.
  User: b14
  Date: 2023-05-04
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <title>Title</title>
</head>
<%@ include file="../header/header.jsp"%>
<style>
  @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
  @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}
  /*.container {*/
  /*  display: flex;*/
  /*  flex-wrap: wrap;*/
  /*  justify-content: center;*/
  /*  align-items: center;*/
  /*  max-width: 800px;*/
  /*  margin: 0 auto;*/
  /*}*/
  label {
    margin-left: 10px;
  }

  input[type="text"], button {
    margin-left: 10px;
  }
  #form{
    width: 500px;
    height: 300px;
    text-align: center;
    margin-left: 300px;
    justify-content: center;

  }
</style>
</head>
<body>
<br>
<div class="container">
  <form id="form">
  <h1 >장바구니</h1>
  <div>
    <input type="checkbox" id="item1" name="item1" value="item1">
    <label for="item1">아이템 1</label>
    <input type="text" id="quantity1" name="quantity1" value="1">
    <button type="button" id="delete1">삭제</button>
  </div>
  <div>
    <input type="checkbox" id="item2" name="item2" value="item2">
    <label for="item2">아이템 2</label>
    <input type="text" id="quantity2" name="quantity2" value="1">
    <button type="button" id="delete2">삭제</button>
  </div>
  <div>
    <input type="checkbox" id="item3" name="item3" value="item3">
    <label for="item3">아이템 3</label>
    <input type="text" id="quantity3" name="quantity3" value="1">
    <button type="button" id="delete3">삭제</button>
  </div>
  <div>
    <input type="checkbox" id="item4" name="item4" value="item4">
    <label for="item4">아이템 4</label>
    <input type="text" id="quantity4" name="quantity4" value="1">
    <button type="button" id="delete4">삭제</button>
  </div>
  </form>
</div>

</body>
<%@ include file="../footer/footer.jsp"%>
</html>
