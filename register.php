
<?php
include "config/database.php";

$message = "";

if (isset($_POST['register'])) {

    $name = trim($_POST['name']);
    $mobile = trim($_POST['mobile']);
    $village = trim($_POST['village']);
    $password = $_POST['password'];

    if ($name == "" || $mobile == "" ||
        $village == "" || $password == "") {

        $message = "All fields are required!";

    } else {

        $hashed_password = password_hash(
            $password, PASSWORD_DEFAULT
        );

        $sql = "INSERT INTO farmers
        (name, mobile, village, password)
        VALUES (?, ?, ?, ?)";

        $stmt = mysqli_prepare($conn, $sql);

        mysqli_stmt_bind_param(
            $stmt, "ssss",
            $name, $mobile, $village, $hashed_password
        );

        if (mysqli_stmt_execute($stmt)) {
            $message = "Registration Successful!";
        } else {
            $message = "Registration Failed! Mobile may already exist.";
        }

        mysqli_stmt_close($stmt);
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Farmer Registration</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="register-box">

    <h2>Farmer Registration</h2>

    <p><?php echo htmlspecialchars($message); ?></p>

    <form method="POST">

        <input type="text" name="name"
        placeholder="Enter Your Name" required>

        <input type="tel" name="mobile"
        placeholder="Mobile Number" required>

        <input type="text" name="village"
        placeholder="Village Name" required>

        <input type="password" name="password"
        placeholder="Create Password" required>

        <button type="submit" name="register">
            Register Now
        </button>

    </form>

</div>

</body>
</html>
