-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2024 at 12:52 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `citytaxidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_ID` int(11) NOT NULL,
  `Passenger_ID` int(11) DEFAULT NULL,
  `Driver_ID` int(11) DEFAULT NULL,
  `Pickup_Location` varchar(255) NOT NULL,
  `Dropoff_Location` varchar(255) NOT NULL,
  `Booking_Date` date NOT NULL,
  `Booking_Time` time NOT NULL,
  `Fare` decimal(10,2) NOT NULL,
  `Payment_Status` enum('Paid','Pending') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Booking_ID`, `Passenger_ID`, `Driver_ID`, `Pickup_Location`, `Dropoff_Location`, `Booking_Date`, `Booking_Time`, `Fare`, `Payment_Status`) VALUES
(1, 1, 1, '123 Main St, Colombo', '456 High St, Kandy', '2024-08-15', '09:00:00', 2500.00, 'Pending'),
(2, 2, 2, '789 Park Ave, Galle', '123 Main St, Colombo', '2024-08-16', '10:00:00', 3000.00, 'Pending'),
(3, 3, 3, '456 High St, Kandy', '789 Park Ave, Galle', '2024-08-17', '11:00:00', 3500.00, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `Driver_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Vehicle_ID` int(11) DEFAULT NULL,
  `License_Number` varchar(20) NOT NULL,
  `Rating` float DEFAULT 0,
  `Status` enum('Available','Busy') DEFAULT 'Available',
  `Location` point DEFAULT NULL,
  `Registration_Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`Driver_ID`, `Name`, `Email`, `Phone_Number`, `Password`, `Vehicle_ID`, `License_Number`, `Rating`, `Status`, `Location`, `Registration_Date`) VALUES
(1, 'Robert Brown', 'robert@drivers.com', '2233445566', 'driverpass123', 1, 'LIC12345', 0, 'Available', NULL, '2024-08-12 22:45:44'),
(2, 'Emily Davis', 'emily@drivers.com', '3344556677', 'driverpass456', 2, 'LIC67890', 0, 'Available', NULL, '2024-08-12 22:45:44'),
(3, 'Michael Clark', 'michael@drivers.com', '4455667788', 'driverpass789', 3, 'LIC11223', 0, 'Available', NULL, '2024-08-12 22:45:44');

-- --------------------------------------------------------

--
-- Table structure for table `manual_booking`
--

CREATE TABLE `manual_booking` (
  `Manual_Booking_ID` int(11) NOT NULL,
  `Operator_ID` int(11) DEFAULT NULL,
  `Passenger_Name` varchar(100) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Pickup_Location` varchar(255) NOT NULL,
  `Dropoff_Location` varchar(255) NOT NULL,
  `Booking_Date` date NOT NULL,
  `Booking_Time` time NOT NULL,
  `Fare` decimal(10,2) NOT NULL,
  `Payment_Status` enum('Paid','Pending') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manual_booking`
--

INSERT INTO `manual_booking` (`Manual_Booking_ID`, `Operator_ID`, `Passenger_Name`, `Phone_Number`, `Pickup_Location`, `Dropoff_Location`, `Booking_Date`, `Booking_Time`, `Fare`, `Payment_Status`) VALUES
(1, 1, 'Mark Wilson', '9988776655', '345 Lake Rd, Colombo', '678 River St, Kandy', '2024-08-18', '12:00:00', 4000.00, 'Pending'),
(2, 2, 'Lucy Adams', '8877665544', '789 Mountain Ave, Galle', '123 Ocean Dr, Colombo', '2024-08-19', '13:00:00', 4500.00, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `Operator_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`Operator_ID`, `Name`, `Email`, `Phone_Number`, `Password`) VALUES
(1, 'Anna Wilson', 'anna@operators.com', '5566778899', 'operatorpass123'),
(2, 'David Thomas', 'david@operators.com', '6677889900', 'operatorpass456');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `Passenger_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Registration_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Registration_Method` enum('Online','Manual') NOT NULL DEFAULT 'Online',
  `Contact_Person` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`Passenger_ID`, `Name`, `Email`, `Phone_Number`, `Password`, `Address`, `Registration_Date`, `Registration_Method`, `Contact_Person`) VALUES
(1, 'John Doe', 'john@example.com', '1234567890', 'password123', '123 Main St, Colombo', '2024-08-12 22:45:22', 'Online', NULL),
(2, 'Jane Smith', 'jane@example.com', '0987654321', 'password456', '456 High St, Kandy', '2024-08-12 22:45:22', 'Manual', 'Operator Name'),
(3, 'Alice Johnson', 'alice@example.com', '1122334455', 'password789', '789 Park Ave, Galle', '2024-08-12 22:45:22', 'Manual', 'Operator Name'),
(4, 'John Doe', 'john.doe@example.com', '0771234567', 'password123', NULL, '2024-08-12 22:50:26', 'Online', NULL),
(5, 'Jane Smith', NULL, '0779876543', NULL, NULL, '2024-08-12 22:50:26', 'Manual', 'Operator Name'),
(6, 'Alice Johnson', NULL, '0771112223', NULL, NULL, '2024-08-12 22:50:26', 'Manual', 'Operator Name');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Booking_ID` int(11) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Payment_Method` enum('Credit Card','PayPal','Cash') NOT NULL,
  `Payment_Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Booking_ID`, `Amount`, `Payment_Method`, `Payment_Date`) VALUES
(1, 1, 2500.00, 'Credit Card', '2024-08-12 22:46:07'),
(2, 2, 3000.00, 'PayPal', '2024-08-12 22:46:07'),
(3, 3, 3500.00, 'Cash', '2024-08-12 22:46:07'),
(4, 1, 2500.00, 'Credit Card', '2024-08-12 22:46:15'),
(5, 2, 3000.00, 'PayPal', '2024-08-12 22:46:15'),
(6, 3, 3500.00, 'Cash', '2024-08-12 22:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `Rating_ID` int(11) NOT NULL,
  `Passenger_ID` int(11) DEFAULT NULL,
  `Driver_ID` int(11) DEFAULT NULL,
  `Booking_ID` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL CHECK (`Rating` >= 1 and `Rating` <= 5),
  `Comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`Rating_ID`, `Passenger_ID`, `Driver_ID`, `Booking_ID`, `Rating`, `Comments`) VALUES
(1, 1, 1, 1, 5, 'Excellent service, very punctual and polite.'),
(2, 2, 2, 2, 4, 'Good service, but car could have been cleaner.'),
(3, 3, 3, 3, 3, 'Average experience, driver was a bit late.');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `Vehicle_ID` int(11) NOT NULL,
  `Vehicle_Number` varchar(20) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Type` enum('Sedan','SUV','Hatchback') NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Owner_Name` varchar(100) NOT NULL,
  `Maintenance_Status` enum('Good','Needs Repair') DEFAULT 'Good'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`Vehicle_ID`, `Vehicle_Number`, `Model`, `Type`, `Capacity`, `Owner_Name`, `Maintenance_Status`) VALUES
(1, 'CAB1234', 'Toyota Prius', 'Sedan', 4, 'John Williams', 'Good'),
(2, 'CAB5678', 'Honda Civic', 'Sedan', 4, 'Mike Johnson', 'Good'),
(3, 'CAB9101', 'Nissan Leaf', 'Hatchback', 4, 'Sarah Lee', 'Good');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD KEY `Passenger_ID` (`Passenger_ID`),
  ADD KEY `Driver_ID` (`Driver_ID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`Driver_ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Phone_Number` (`Phone_Number`),
  ADD KEY `Vehicle_ID` (`Vehicle_ID`);

--
-- Indexes for table `manual_booking`
--
ALTER TABLE `manual_booking`
  ADD PRIMARY KEY (`Manual_Booking_ID`),
  ADD KEY `Operator_ID` (`Operator_ID`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`Operator_ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Phone_Number` (`Phone_Number`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`Passenger_ID`),
  ADD UNIQUE KEY `Phone_Number` (`Phone_Number`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Email_2` (`Email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Booking_ID` (`Booking_ID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`Rating_ID`),
  ADD KEY `Passenger_ID` (`Passenger_ID`),
  ADD KEY `Driver_ID` (`Driver_ID`),
  ADD KEY `Booking_ID` (`Booking_ID`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Vehicle_ID`),
  ADD UNIQUE KEY `Vehicle_Number` (`Vehicle_Number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `Booking_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `Driver_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `manual_booking`
--
ALTER TABLE `manual_booking`
  MODIFY `Manual_Booking_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `operator`
--
ALTER TABLE `operator`
  MODIFY `Operator_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `Passenger_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `Rating_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `Vehicle_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Driver_ID`) REFERENCES `driver` (`Driver_ID`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`Vehicle_ID`) REFERENCES `vehicle` (`Vehicle_ID`);

--
-- Constraints for table `manual_booking`
--
ALTER TABLE `manual_booking`
  ADD CONSTRAINT `manual_booking_ibfk_1` FOREIGN KEY (`Operator_ID`) REFERENCES `operator` (`Operator_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`Driver_ID`) REFERENCES `driver` (`Driver_ID`),
  ADD CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
