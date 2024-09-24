<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Booking System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- Header -->
<header>
    <h1>Vehicle Booking System</h1>
    <img src="image/car.png" alt="Car Banner" class="banner-image">
</header>

<!-- Booking Form -->
<section class="booking-section">
    <h2>Book Your Vehicle</h2>
    <form action="php/process_booking.php" method="POST" id="bookingForm">
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="phone">Phone Number:</label>
        <input type="text" id="phone" name="phone" required>

        <label for="vehicle">Select Vehicle:</label>
        <select id="vehicle" name="vehicle" required>
            <option value="Sedan">Sedan</option>
            <option value="SUV">SUV</option>
            <option value="Truck">Truck</option>
        </select>

        <label for="pickup_date">Pickup Date:</label>
        <input type="date" id="pickup_date" name="pickup_date" required>

        <label for="return_date">Return Date:</label>
        <input type="date" id="return_date" name="return_date" required>

        <button type="submit" class="submit-btn">Book Now</button>
    </form>
</section>

<!-- Payment Section -->
<section class="payment-section">
    <h2>Payment Details</h2>
    <form action="php/process_payment.php" method="POST" id="paymentForm">
        <label for="card_name">Name on Card:</label>
        <input type="text" id="card_name" name="card_name" required>

        <label for="card_number">Card Number:</label>
        <input type="text" id="card_number" name="card_number" maxlength="16" required>

        <label for="expiry_date">Expiry Date:</label>
        <input type="text" id="expiry_date" name="expiry_date" placeholder="MM/YY" required>

        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" maxlength="3" required>

        <button type="submit" class="submit-btn">Make Payment</button>
    </form>
</section>

<script src="js/script.js"></script>
</body>
</html>
