<%@ page import="java.sql.*" %>
<%@ page import="com.example.onlineshopping.config.ConnectionProvider" %>
<%@ page import="com.example.onlineshopping.algorithm.RecommendationEngine" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.onlineshopping.algorithm.Product" %>
<%--<%@ page import="com.example.onlineshopping.algorithm.Product" %>--%>
<%@include file="header.jsp" %>

<br>
<br>
<br>
<br>

<style>
.product-container {
display: flex;
justify-content: space-between;
align-items: flex-start;
margin: 20px 0;
}
.col-md-110{
    width: 75%;
}
.col-md-7{
    width: 40%;
}
.product {
width: 30%;
}

.related_product {
flex: 1;
padding-left: 30px;
    padding-top: 20px;
}

.vertical-line {
border-left: 1px solid #000;
height: 300px;

}

/*PRODUCT_MENU*/

.product-menu {
    width: 100%;
    padding: 20px;
    box-sizing: border-box;
}

.product-menu h3 {
    margin-bottom: 15px;
}

.products {
    display: flex;
    flex-wrap: wrap;
}

.product-item {
    width: 50%; /* Adjust the width here */
    box-sizing: border-box;
    text-align: center;
    margin-bottom: 20px;
}

.product-item .product-image,
.product-item .product-name {
    width: 100%;
}

.product-item .product-image img {
    width: 100%;
    height: auto;
    display: block;
    margin-bottom: 10px;
}





</style>


<%
            String selectedCategory = null;
            try {
                String productID = request.getParameter("productID");

                Connection con = ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from product where id=" + productID);

                if (rs.next()) {
                    selectedCategory = rs.getString("category");
        %>

<div class="product-container">
    <div class="product">
        <div class="contain">
            <div class="row">
                <div class="col-md-110 col-lg-4 col-xl-3 p-2">
                    <div class="special-img position-relative overflow-hidden">
                        <img src="images/<%=rs.getString(5)%>" alt="Product Image" class="w-100">
                    </div>
                    <div class="text-center">
                        <p class="text-capitalize mt-3 mb-1"><%=rs.getString(2)%></p>
                        <span class="fw-bold d-block"><i class="fa fa-inr"></i><%=rs.getString(4)%></span>
                        <a href="addToCartAction.jsp?id=<%=rs.getString(1)%>" class="btn btn-primary mt-3">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <div class="col-md-7">
        <div class="product-paragraph p-3">
            <h1>Product Description</h1>
            &nbsp;
            <p>This is a sample paragraph about the product. You can add more details and description here. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem.</p>
        </div>
    </div>

<div class="vertical-line"></div>

    <div class="related_product">
        <h2>Related Products</h2>
            <%
            RecommendationEngine recommendationEngine = new RecommendationEngine();
            List<Product> relatedProducts = recommendationEngine.getRelatedProducts(selectedCategory);

            if (relatedProducts != null && !relatedProducts.isEmpty()) {
        %>
        <div class="product-menu">
            <h3><%= selectedCategory %> Recommendations:</h3>
            <div class="products">
                <% for (Product product : relatedProducts) { %>
                <div class="product-item">
                    <div class="product-image">
                        <img src="images/<%= product.getImage() %>" alt="<%= product.getName() %>">
                    </div>
                    <div class="product-name">
                        <p><%= product.getName() %></p>
                    </div>
                </div>
                <% } %>
            </div>
        </div>






        <%
            } else {
            %>
            <div class="product-menu">
                <h3>No recommendations available for <%=selectedCategory%> category.</h3>
            </div>
            <%
                }
            %>



    </div>



    </div>
</div>
</div>


    <%@include file="footer.jsp" %>

