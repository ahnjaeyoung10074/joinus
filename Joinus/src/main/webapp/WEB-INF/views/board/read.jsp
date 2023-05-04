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
  /* slider__wrap */
  .slider__wrap {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    height: 150px;
    box-shadow: 0 50px 100px rgba(0, 0, 0, 0.4);
  }
  .slider__img {
    position: relative;
    width: 100%;
    height: 100%;
    overflow: hidden;
  }
  .slider__img img {
    position: absolute;
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0;
    transform: scale(1.1);
    transition: all 500ms ease-in-out;
  }
  .slider__img img.active {
    opacity: 1;
    transform: scale(1);
  }
  .slider__thumb {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, 140px);
    width: 100px;
    display: flex;
    justify-content: center;
    gap: 10px;
  }
  .slider__thumb img {
    cursor: pointer;
    border: 2px solid transparent;
  }
  .slider__thumb img.active {
    cursor: pointer;
    border: 2px solid #fff;
  }
  .slider__btn a {
    position: absolute;
    top: 0;
    width: 40px;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 12px;
    color: #fff;
    background-color: rgba(0, 0, 0, 0.2);
    transition: all 300ms ease-in-out;
  }
  .slider__btn a.next {
    right: 0;
  }
  .slider__btn a:hover {
    background-color: rgba(0, 0, 0, 0.5);
    font-size: 14px;
  }

</style>
<%@ include file="../header.jsp"%>
<body class="sub_page about_page">
<table id="datatable-scroller"
       class="table table-bordered tbl_Form">
  <caption></caption>
  <colgroup>
    <col width="250px" />
    <col />
  </colgroup>
  <tbody>
  <tr>
    <th class="active" >제목</th>
    <td>
      ${productVO.p_subtitle }
    </td>
  </tr>
  <tr>
    <th class="active">작성자</th>
    <td>
      ${productVO.p_name }
    </td>
  </tr>
  <tr>
    <th class="active" >내용</th>
    <td>
      ${productVO.p_content }
    </td>
  </tr>
  </tbody>
  <main id="main">
    <div class="slider__wrap">
      <div class="slider__img"></div>
      <div class="slider__thumb"></div>
      <div class="slider__btn">
        <a href="#" class="prev" title="이전이미지">prev</a>
        <a href="#" class="next" title="다음이미지">next</a>
      </div>
    </div>
  </main>
</table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- info section -->
<section class="info_section layout_padding2-top">
  <div class="container">
    <div class="info_form">
      <h4>Our Newsletter</h4>
      <form action="">
        <input type="text" placeholder="Enter your email" />
        <div class="d-flex justify-content-end">
          <button>subscribe</button>
        </div>
      </form>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <h6>About Energym</h6>
        <p>
          consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
          labore et dolore magna aliqua. Ut enim ad minim veniam, quis
          nostrud exercitation u
        </p>
      </div>
      <div class="col-md-2 offset-md-1">
        <h6>Menus</h6>
        <ul>
          <li class="active">
            <a class="" href="index.jsp"
            >Home <span class="sr-only">(current)</span></a
            >
          </li>
          <li class="">
            <a class="" href="../about.jsp">About </a>
          </li>
          <li class="">
            <a class="" href="service.jsp">Services </a>
          </li>
          <li class="">
            <a class="" href="#contactSection">Contact Us</a>
          </li>
          <li class="">
            <a class="" href="#">Login</a>
          </li>
        </ul>
      </div>
      <div class="col-md-3">
        <h6>Useful Links</h6>
        <ul>
          <li>
            <a href=""> Adipiscing </a>
          </li>
          <li>
            <a href=""> Elit, sed </a>
          </li>
          <li>
            <a href=""> do Eiusmod </a>
          </li>
          <li>
            <a href=""> Tempor </a>
          </li>
          <li>
            <a href=""> incididunt </a>
          </li>
        </ul>
      </div>
      <div class="col-md-3">
        <h6>Contact Us</h6>
        <div class="info_link-box">
          <a href="">
            <img src="../../../resources/images/location-white.png" alt="" />
            <span> No.123, loram ipusm</span>
          </a>
          <a href="">
            <img src="../../../resources/images/call-white.png" alt="" />
            <span>+01 12345678901</span>
          </a>
          <a href="">
            <img src="../../../resources/images/mail-white.png" alt="" />
            <span> demo123@gmail.com</span>
          </a>
        </div>
        <div class="info_social">
          <div>
            <a href="">
              <img src="../../../resources/images/facebook-logo-button.png" alt="" />
            </a>
          </div>
          <div>
            <a href="">
              <img src="../../../resources/images/twitter-logo-button.png" alt="" />
            </a>
          </div>
          <div>
            <a href="">
              <img src="../../../resources/images/linkedin.png" alt="" />
            </a>
          </div>
          <div>
            <a href="">
              <img src="../../../resources/images/instagram.png" alt="" />
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- end info section -->

<!-- footer section -->
<section class="container-fluid footer_section">
  <p>
    &copy; 2019 All Rights Reserved. Design by
    <a href="https://html.design/">Free Html Templates</a>
  </p>
</section>
<!-- footer section -->

<script type="text/javascript" src="../../../resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../../../resources/js/bootstrap.js"></script>

<script>
  function openNav() {
    document.getElementById("myNav").classList.toggle("menu_width");
    document
            .querySelector(".custom_menu-btn")
            .classList.toggle("menu_btn-style");
  }
</script>
<script>
  let images = [
    "img/sliderEffect06-min.jpg",
    "img/sliderEffect07-min.jpg",
    "img/sliderEffect08-min.jpg",
    "img/sliderEffect09-min.jpg",
    "img/sliderEffect10-min.jpg"
  ]

  function imageSlider(parent, images){
    let currentIndex = 0;

    // 선택자
    let slider = {
      parent : parent,
      images : parent.querySelector(".slider__img"),
      thumnails : parent.querySelector(".slider__thumb"),
      prevBtn : parent.querySelector(".slider__btn .prev"),
      nextBtn : parent.querySelector(".slider__btn .next")
    };

    // 이미지 출력하기
    slider.images.innerHTML = images.map((image, index) => {
      return `<img src="${image}" alt="이미지${index}">`
    }).join("");

    // 이미지 활성화(active) 하기
    let imageNodes = slider.images.querySelectorAll("img");
    imageNodes[currentIndex].classList.add("active");

    // 썸네일 이미지 출력하기
    slider.thumnails.innerHTML = slider.images.innerHTML

    // 썸네일 활성화(active) 하기
    let thumnailNodes = slider.thumnails.querySelectorAll("img");
    thumnailNodes[currentIndex].classList.add("active");

    // 썸네일 이미지 클릭하기
    thumnailNodes.forEach((e, i) => {
      e.addEventListener("click", () => {
        slider.thumnails.querySelector("img.active").classList.remove("active");
        thumnailNodes[i].classList.add("active");

        imageNodes[currentIndex].classList.remove("active");
        currentIndex = i;
        imageNodes[i].classList.add("active");
      });
    });


    // 왼쪽 버튼 클릭
    slider.prevBtn.addEventListener("click", () => {
      // active 지우기
      imageNodes[currentIndex].classList.remove("active");
      thumnailNodes[currentIndex].classList.remove("active");

      // 순서 설정
      currentIndex--;
      if(currentIndex < 0) currentIndex = images.length - 1;

      // 이미지 active
      imageNodes[currentIndex].classList.add("active");

      // 썸네일 active
      thumnailNodes[currentIndex].classList.add("active");

    });

    // 오른쪽 버튼 클릭
    slider.nextBtn.addEventListener("click", () => {
      // active 지우기
      imageNodes[currentIndex].classList.remove("active");
      thumnailNodes[currentIndex].classList.remove("active");

      // 순서 설정
      currentIndex = (currentIndex + 1) % images.length;

      // 이미지 active
      imageNodes[currentIndex].classList.add("active");

      // 썸네일 active
      thumnailNodes[currentIndex].classList.add("active");
    });
  };

  imageSlider(document.querySelector(".slider__wrap"), images)
</script>
</body>
</html>