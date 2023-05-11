<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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

  <!-- slider stylesheet -->
  <link
          rel="stylesheet"
          type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css"
  />
  <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.css" />

  <!-- fonts style -->
  <link
          href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Dosis:400,600,700|Poppins:400,600,700&display=swap"
          rel="stylesheet"
  />
  <!-- Custom styles for this template -->
  <link href="../../../resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="../../../resources/css/responsive.css" rel="stylesheet" />
</head>
<style>
  .tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
  }
  .tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
  }
  .tab button:hover {
    background-color: #ddd;
  }
  .tab button.active {
    background-color: #ccc;
  }
  .tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
  }
</style>
<%@ include file="../header/header.jsp"%>
<body class="sub_page about_page">
<table id="datatable-scroller"
       class="table table-bordered tbl_Form">
  <colgroup>
    <col width="250px" />
    <col />
  </colgroup>
  <tbody>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-6">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="../../resources/images/JOINUSLOGO3.png" class="d-block w-100" width="50%" alt="...">
            </div>
            <div class="carousel-item">
              <img src="../../resources/images/JOINUSLOGO3.png" class="d-block w-100" width="50%" alt="...">
            </div>
            <div class="carousel-item">
              <img src="../../resources/images/JOINUSLOGO3.png" class="d-block w-100" width="50%" alt="...">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>

      <div class="col-md-6">
        <h4>${productVO.p_subtitle }</h4>
        <p>${productVO.p_content}</p>
        <form>
          <div class="form-group">
            <label for="colorSelect">종류</label>
            <select class="form-control" id="colorSelect">
              <option>${productVO.p_category}</option>
            </select>
          </div>
          <div class="form-group">
            <label for="sizeSelect">선택</label>
            <select class="form-control" id="sizeSelect">
              <option>${productVO.p_period}</option>
            </select>
          </div>
          <div class="form-group">
            <label for="quantityInput">수량</label>
            <input type="number" class="form-control" id="quantityInput" value="1" onchange="updateTotalPrice()">
          </div>
          <div class="form-group">
            <label for="totalPrice">총 가격</label>
            <input type="number" class="form-control" id="totalPrice" value="${productVO.p_price}" readonly>
          </div>
          <c:choose>
            <c:when test="${like == 1}">
              <button type="button" class="btn btn-warning" id="wishBtn" data-a='${productVO.pno}' data-b='${customerUserVO.u_id}'>❤️</button>
            </c:when>
            <c:otherwise>
              <button type="button" class="btn btn-warning" id="wishBtn" data-a='${productVO.pno}' data-b='${customerUserVO.u_id}'>🤍</button>
            </c:otherwise>
          </c:choose>

          <c:choose>
            <c:when test="${cart == 1}">
              <button type="button" class="btn btn-primary" id="cartBtn" data-c='${productVO.pno}' data-d='${customerUserVO.u_id}'>🛒</button>
            </c:when>
            <c:otherwise>
              <button type="button" class="btn btn-primary" id="cartBtn" data-c='${productVO.pno}' data-d='${customerUserVO.u_id}'>장바구니담기</button>
            </c:otherwise>
          </c:choose>
          <button type="submit" class="btn btn-success">구매</button>
        </form>
      </div>

    </div>
    <br>
    <!-- 탭 버튼 -->
    <div class="tab">
      <button class="tablinks" onclick="openTab(event, 'product_info')">상품 상세 정보</button>
      <button class="tablinks" onclick="openTab(event, 'reviews')">구매후기</button>
      <button class="tablinks" onclick="openTab(event, 'qna')">상품문의</button>
      <button class="tablinks" onclick="openTab(event, 'refuand')">환불</button>
    </div>
    <!-- 탭 내용 -->
    <div id="product_info" class="tabcontent">
      <h3>상품 상세 정보</h3>
      <p>상품의 상세 정보</p>
    </div>

    <div id="reviews" class="tabcontent">
      <h3>구매후기</h3>
      <p>구매후기</p>
    </div>

    <div id="qna" class="tabcontent">
      <h3>상품문의</h3>
      <p>상품문의 내용</p>
    </div>

    <div id="refund" class="tabcontent">
      <h3>환불</h3>
      <p>환불 규정 </p>
    </div>
  </div>
  </tbody>
</table>

<script>
  function openNav() {
    document.getElementById("myNav").classList.toggle("menu_width");
    document
            .querySelector(".custom_menu-btn")
            .classList.toggle("menu_btn-style");
  }
</script>
<script>
  <!-- 탭 스크립트 -->
  function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
  }
</script>
<script>
  // 총금액 카운트
  function updateTotalPrice() {
    const quantity = document.getElementById("quantityInput").value;
    const price = ${productVO.p_price};
    const totalPrice = quantity * price;
    document.getElementById("totalPrice").value = totalPrice;
  }
</script>
<script>
    // 로그인 여부 확인 함수
  function isLoggedIn() {
    // 로그인 여부를 확인하는 코드 작성
    // 로그인되어 있으면 true 반환, 아니면 false 반환
    // 예시:
    if (${customerUserVO == null || customerUserVO.u_id == null}) {
      return false;
    } else {
      return true;
    }
  }
  $(document).ready(function (e) {
    $('#wishBtn').click(function (e) {
      var data_like = $("#wishBtn").text()
      // console.log("data_like : " + data_like)
      var f1 = $('#wishBtn').data('a');
      var f2 = $('#wishBtn').data('b');
      var flag = false
      if(data_like == "❤️"){
        deleteWishlist();
        if (${customerUserVO != null || customerUserVO.u_id != null}){
          flag = !flag
          $('#wishBtn').text("🤍");
          console.log('여기는 삭제');
        }
      } else {
        addWishlist(f1, f2);
        if (${customerUserVO != null || customerUserVO.u_id != null}){
          flag = !flag
          $('#wishBtn').text("❤️");
          console.log('여기는 추가');
        }
      }
    });
  });
  function addWishlist(pno, b_id) {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }

    $.ajax({
      type: 'POST',
      url: "/wishlist/add",
      data: {
        pno,
        b_id,

      },
      success: function(data) {
        alert("찜 목록에 추가되었습니다.");
      },
      error: function(request, status, error) {
        console.log("에러")
        alert(error);
      }
    });
  }

  function deleteWishlist() {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }

    $.ajax({
      type: "GET",
      url: "/wishlist/delete?pno="+${productVO.pno},
      success: function(data) {
        console.log("삭제 들어오나");
        alert("찜 목록에서 삭제되었습니다.");
      },
      error: function (xhr, status, error) {
        alert(error);
      },
    });
  }
</script>
<script>
  $(document).ready(function (e) {
    $('#cartBtn').click(function (e) {
      var data_cart = $("#cartBtn").text()
      // console.log("data_like : " + data_like)
      var f3 = $('#cartBtn').data('c');
      var f4 = $('#cartBtn').data('d');
      var flag = false
      if(data_cart == "🛒"){
        deleteCart();
        if (${customerUserVO != null || customerUserVO.u_id != null}){
          flag = !flag
          $('#cartBtn').text("장바구니담기");
          console.log('여기는 삭제');
        }
      } else {
        addCart(f3, f4);
        if (${customerUserVO != null || customerUserVO.u_id != null}){
          flag = !flag
          $('#cartBtn').text("🛒");
          console.log('여기는 추가');
        }
      }
    });
  });
  function addCart(pno, b_id) {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }

    // 수량 가져오기
    const quantity = document.getElementById("quantityInput").value;

    $.ajax({
      type: 'POST',
      url: "/cart/add",
      data: {
        pno,
        b_id,
        quantity // 수량 추가
      },
      success: function(data) {
        alert("장바구니에 추가되었습니다.");
      },
      error: function(request, status, error) {
        console.log("에러")
        alert(error);
      }
    });
  }


  function deleteCart() {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }

    $.ajax({
      type: "GET",
      url: "/cart/delete?pno="+${productVO.pno},
      success: function(data) {
        console.log("삭제 들어오나");
        alert("장바구니에서 삭제되었습니다.");
      },
      error: function (xhr, status, error) {
        alert(error);
      },
    });
  }
</script>
</body>
<%@ include file="../footer/footer.jsp"%>

</html>