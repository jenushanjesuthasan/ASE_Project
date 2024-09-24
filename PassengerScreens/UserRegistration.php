<?php
// Start session if needed for logging in users after registration
session_start();

// Database connection settings
$servername = "localhost";
$username = "root"; // Default username (XAMPP/WAMP)
$password = "";     // Default password
$dbname = "citytaxidb";  // Change to your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Capture form data
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $phone = mysqli_real_escape_string($conn, $_POST['phone']);
    $birthdate = mysqli_real_escape_string($conn, $_POST['birthdate']);
    $gender = mysqli_real_escape_string($conn, $_POST['gender']);
    $address = mysqli_real_escape_string($conn, $_POST['address']);
    $city = mysqli_real_escape_string($conn, $_POST['city']);
    $region = mysqli_real_escape_string($conn, $_POST['region']);
    $postal = mysqli_real_escape_string($conn, $_POST['postal']);
    $country = mysqli_real_escape_string($conn, $_POST['country']);

    // Optionally add role (Passenger/Driver)
    $role = 'passenger'; // or 'driver', based on your logic

    // Check if email is already registered
    $checkEmail = "SELECT * FROM users WHERE email='$email'";
    $result = $conn->query($checkEmail);

    if ($result->num_rows > 0) {
        echo "This email is already registered!";
    } else {
        // Insert user data into the database
        $sql = "INSERT INTO users (name, email, phone, birthdate, gender, address, city, region, postal, country, role)
                VALUES ('$name', '$email', '$phone', '$birthdate', '$gender', '$address', '$city', '$region', '$postal', '$country', '$role')";

        if ($conn->query($sql) === TRUE) {
            echo "Registration successful!";
            // Optionally log in the user
            $_SESSION['user_id'] = $conn->insert_id;
            header("Location: passenger_dashboard.php");
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Registration Form</title>
    <link rel="stylesheet" href="../Styles/UserRegistration.css" />
  </head>
  <body>
    <section class="container">
      <header>Registration Form</header>
      <form action="index.php" method="POST" class="form">
        <div class="input-box">
          <label>Full Name</label>
          <input type="text" name="name" placeholder="Enter full name" required />
        </div>

        <div class="input-box">
          <label>Email Address</label>
          <input type="email" name="email" placeholder="Enter email address" required />
        </div>

        <div class="column">
          <div class="input-box">
            <label>Phone Number</label>
            <input type="number" name="phone" placeholder="Enter phone number" required />
          </div>
          <div class="input-box">
            <label>Birth Date</label>
            <input type="date" name="birthdate" placeholder="Enter birth date" required />
          </div>
        </div>

        <div class="gender-box">
          <h3>Gender</h3>
          <div class="gender-option">
            <div class="gender">
              <input type="radio" id="check-male" name="gender" value="male" checked />
              <label for="check-male">Male</label>
            </div>
            <div class="gender">
              <input type="radio" id="check-female" name="gender" value="female" />
              <label for="check-female">Female</label>
            </div>
            <div class="gender">
              <input type="radio" id="check-other" name="gender" value="other" />
              <label for="check-other">Other</label>
            </div>
          </div>
        </div>

        <div class="input-box address">
          <label>Address</label>
          <input type="text" name="address" placeholder="Enter street address" required />
          <input type="text" name="address_line_2" placeholder="Enter street address line 2" required />
          <div class="column">
            <div class="select-box">
              <select name="country" required>
                <option hidden>Country</option>
                <option value="America">America</option>
                <option value="Japan">Japan</option>
                <option value="India">India</option>
                <option value="Nepal">Nepal</option>
              </select>
            </div>
            <input type="text" name="city" placeholder="Enter your city" required />
          </div>
          <div class="column">
            <input type="text" name="region" placeholder="Enter your region" required />
            <input type="number" name="postal" placeholder="Enter postal code" required />
          </div>
        </div>
        <button type="submit">Submit</button>
      </form>
    </section>
  </body>
</html>
