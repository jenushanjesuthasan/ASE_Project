<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FashionHub - Trendy Clothing Store</title> <!--Title Can be chabnged-->
  <link rel="stylesheet" href="styles.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<style>
    .logoimg {
  display: flex; /* Aligns items in a row */
  align-items: center; /* Vertically center-aligns items */
}

.logo {
  width: 80px; /* Adjust the size of the logo */
  height: auto; /* Keep the aspect ratio */
  margin-right: 10px; /* Adds some space between the logo and the title */
}

.site-title {
  font-size: 24px; /* Adjust the title size */
  font-weight: bold; /* Make the title bold */
  margin: 0; /* Remove default margins */
}

</style>

<body>



  <header>
    <div class="container">
      <div class="logo">
        <div class="logoimg">
            <img src="Image/log.jfif" class="logo">
        </div>
        <h1 class="site-title">City<span>Taxi</span></h1> <!--Logo Text Can be change-->
      </div>
      <nav>
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#products">Book Taxi</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#contact">Contact</a></li>
        </ul>
      </nav>
    </div>
  </header>




  <section class="hero">
    <div class="hero-content">
      <h2>Find Your Perfect Vehicle</h2>
      <p>Your Journey, Your Way!</p>
      <a href="#products" class="cta-button">Explore Now</a>
    </div>
  </section>





  <section id="products" class="products">
    <h3>Select your Preference</h3>
    <div class="product-grid">


      <div class="product-item">
        <img src="Image/benze1.png" alt="Casual T-shirt">
        <h4>Casual T-shirt</h4>
        <p>Rs. 1800.00</p>
        <button onclick="addToCart('Casual T-shirt')">Add to Cart</button>
      </div>



      <div class="product-item">
        <img src="Image/benze2.png" alt="Summer Dress">
        <h4>Summer Dress</h4>
        <p>Rs. 2400.00</p>
        <button onclick="addToCart('Summer Dress')">Add to Cart</button>
      </div>


      <div class="product-item">
        <img src="Image/van.png" alt="Denim Jacket">
        <h4>Denim Jacket</h4>
        <p>Rs. 2800.00</p>
        <button onclick="addToCart('Denim Jacket')">Add to Cart</button>
      </div>


      <div class="product-item">
        <img src="Image/auto1.png" alt="Sneakers">
        <h4>Classic Sneakers</h4>
        <p>Rs. 3600.00</p>
        <button onclick="addToCart('Classic Sneakers')">Add to Cart</button>
      </div>

    </div>



    <div class="product-grid">
      <div class="product-item">
        <img src="Image/vehicle1.jpg" alt="Casual T-shirt">
        <h4>Office Kit</h4>
        <p>Rs. 4000.00</p>
        <button onclick="addToCart('Office Suit')">Add to Cart</button>
      </div>

      <div class="product-item">
        <img src="Image/bus.jpg" alt="Summer Dress">
        <h4>Sports Suit</h4>
        <p>$35</p>
        <button onclick="addToCart('Sports Suit')">Add to Cart</button>
      </div>

      <div class="product-item">
        <img src="Image/bus2.jpeg" alt="Denim Jacket">
        <h4>Silk Saree</h4>
        <p>$55</p>
        <button onclick="addToCart('Saree')">Add to Cart</button>
      </div>


      <div class="product-item">
        <img src="Image/bus3.jpg" alt="Sneakers">
        <h4>Churidhar</h4>
        <p>$40</p>
        <button onclick="addToCart('Churidhar')">Add to Cart</button>
      </div>
    </div>

  </section>





  <section id="about" class="about">
    <h3>About Us</h3>
    <p>FashionHub brings the latest styles to you at the best prices. We focus on providing a variety of stylish and comfortable clothes for men and women alike.</p>
  </section>




  <section id="contact" class="contact">
    <h3>Contact Us</h3>
    <p>Email: contact@fashionhub.com</p>
    <p>Phone: 123-456-7890</p>
  </section>


  <footer>
    <p>&copy; 2024 FashionHub. All rights reserved.</p>
  </footer>


  
  <script src="scripts.js"></script>
</body>
</html>
