
<?php
session_start();
include "config/database.php";

$message = "";

if (isset($_POST['login'])) {

    $mobile = trim($_POST['mobile']);
    $password = $_POST['password'];

    $sql = "SELECT * FROM farmers WHERE mobile = ?";
    $stmt = mysqli_prepare($conn, $sql);

    mysqli_stmt_bind_param($stmt, "s", $mobile);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);

    if ($farmer = mysqli_fetch_assoc($result)) {

        if (password_verify($password, $farmer['password'])) {

            session_regenerate_id(true);

            $_SESSION['farmer_id'] = $farmer['id'];
            $_SESSION['farmer_name'] = $farmer['name'];

            header("Location: farmer/dashboard.php");
            exit();

        } else {
            $message = "Incorrect Password!";
        }

    } else {
        $message = "Mobile Number Not Registered!";
    }

    mysqli_stmt_close($stmt);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Farmer Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="register-box">

    <h2>Farmer Login</h2>

    <p><?php echo htmlspecialchars($message); ?></p>

    <form method="POST">

        <input type="tel" name="mobile"
        placeholder="Enter Mobile Number" required>

        <input type="password" name="password"
        placeholder="Enter Password" required>

        <button type="submit" name="login">
            Login Now
        </button>

    </form>

    <p>New Farmer?
    <a href="register.php">Register Here</a></p>

</div>

</body>
</html>
