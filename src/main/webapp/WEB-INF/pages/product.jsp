<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/Product.css">

	
</head>
<body>
	<jsp:include page="header.jsp" />
	
    <!-- Starting of Product Section -->
     
    <div class="small-container">
        <h2>Featured Products</h2>
        <div class="row">
            <div class="col-3">
                <img src="${pageContext.request.contextPath}/images/Chinese-Elm-Bonsai-Care-2.jpg" alt="Bonsai">
                <h4>Chinese Elm Bonsai</h4>
                <p>Beautiful and low-maintainance Bonsai tree</p>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o" aria-hidden="true"></i>
                </div>
                <p>$25.50</p>
                <button class="btn">Buy Now</button>
                <button class="btn cart">Add to Cart</button>
            </div>
            <div class="col-3">
                <img src="${pageContext.request.contextPath}/images/Ficus Ginseng.jpg" alt="Bonsai">
                
                <h4>Fiscus Ginseng</h4>
                <p>Beautiful and low-maintainance Bonsai tree</p>
                
                <p>$25.50</p>
                <button class="btn">Buy Now</button>
                <button class="btn cart">Add to Cart</button>
            </div>
            <div class="col-3">
                <img src="${pageContext.request.contextPath}/images/japanese maple acer palmatum.jpg" alt="Bonsai">
                <h4>Japanese Maple Acer Palmatum</h4>
                <p>Beautiful and low-maintainance Bonsai tree</p>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o" aria-hidden="true"></i>
                </div>
                <p>$25.50</p>
                <button class="btn">Buy Now</button>
                <button class="btn cart">Add to Cart</button>
            </div>
            <div class="col-3">
                <img src="${pageContext.request.contextPath}/images/japanese maple acer palmatum.jpg" alt="Bonsai">
                <h4>Japanese Maple Acer Palmatum</h4>
                <p>Beautiful and low-maintainance Bonsai tree</p>
               
                <p>$25.50</p>
                <button class="btn">Buy Now</button>
                <button class="btn cart">Add to Cart</button>
            </div>
            <div class="col-3">
                <img src="${pageContext.request.contextPath}/images/japanese maple acer palmatum.jpg" alt="Bonsai">
                <h4>Japanese Maple Acer Palmatum</h4>
                <p>Beautiful and low-maintainance Bonsai tree</p>
               
                <p>$25.50</p>
                <button class="btn">Buy Now</button>
                <button class="btn cart">Add to Cart</button>
            </div>
            <div class="col-3">
                <img src="${pageContext.request.contextPath}/images/japanese maple acer palmatum.jpg" alt="Bonsai">
                <h4>Japanese Maple Acer Palmatum</h4>
                <p>Beautiful and low-maintainance Bonsai tree</p>
                
                <p>$25.50</p>
                <button class="btn">Buy Now</button>
                <button class="btn cart">Add to Cart</button>
            </div>
        </div>
    </div>





<!--Staring of Latest products-->
<div class="small-container">
    <h2>Latest Products</h2>
    <div class="row">
        <div class="col-3">
            <img src="${pageContext.request.contextPath}/images/Chinese-Elm-Bonsai-Care-2.jpg" alt="Bonsai">
            <h4>Chinese Elm Bonsai</h4>
            <p>Beautiful and low-maintainance Bonsai tree</p>
            
            <p>$25.50</p>
            <button class="btn">Buy Now</button>
            <button class="btn cart">Add to Cart</button>
        </div>
        <div class="col-3">
            <img src="${pageContext.request.contextPath}/images/Ficus Ginseng.jpg" alt="Bonsai">
            <h4>Fiscus Ginseng</h4>
            <p>Beautiful and low-maintainance Bonsai tree</p>
            
            <p>$25.50</p>
            <button class="btn">Buy Now</button>
            <button class="btn cart">Add to Cart</button>
        </div>
        <div class="col-3">
            <img src="${pageContext.request.contextPath}/images/japanese maple acer palmatum.jpg" alt="Bonsai">
            <h4>Japanese Maple Acer Palmatum</h4>
            <p>Beautiful and low-maintainance Bonsai tree</p>
            
            <p>$25.50</p>
            <button class="btn">Buy Now</button>
            <button class="btn cart">Add to Cart</button>
        </div>
        <div class="col-3">
            <img src="${pageContext.request.contextPath}/images/japanese maple acer palmatum.jpg" alt="Bonsai">
            <h4>Japanese Maple Acer Palmatum</h4>
            <p>Beautiful and low-maintainance Bonsai tree</p>
            
            <p>$25.50</p>
            <button class="btn">Buy Now</button>
            <button class="btn cart">Add to Cart</button>
        </div>
        <div class="col-3">
            <img src="${pageContext.request.contextPath}/images/japanese maple acer palmatum.jpg" alt="Bonsai">
            <h4>Japanese Maple Acer Palmatum</h4>
            <p>Beautiful and low-maintainance Bonsai tree</p>
            
            <p>$25.50</p>
            <button class="btn">Buy Now</button>
            <button class="btn cart">Add to Cart</button>
        </div>
        <div class="col-3">
            <img src="${pageContext.request.contextPath}/images/japanese maple acer palmatum.jpg" alt="Bonsai">
            <h4>Japanese Maple Acer Palmatum</h4>
            <p>Beautiful and low-maintainance Bonsai tree</p>
            
            <p>$25.50</p>
            <button class="btn">Buy Now</button>
            <button class="btn cart">Add to Cart</button>
        </div>
    </div>
</div>

<jsp:include page="Footer.jsp" />
     
</body>

</html>