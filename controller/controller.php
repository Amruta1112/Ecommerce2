<?php
include_once("model\model.php");
class UserController{

    private $userModel;

    public function __construct($pdo)
    {
        $this->userModel = new UserModel($pdo);
    }

    public function showlogin(){

        include("view/login.php");
    }
    public function showregister(){

        include("view/register.php");
    } 
    public function showhome(){
        $categories = $this->userModel->getAllCategories();
         $products = $this->userModel->getAllProducts();
        include("view/home.php");
    }
    public function register()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $username = $_POST['username'];
            $email = $_POST['email'];
            $password = $_POST['password'];

            // Validate input (basic example)
            if (!empty($username) && !empty($email) && !empty($password)) {
                // Register the user using the model
                if ($this->userModel->register($username, $email, $password)) {
                    echo "<script>
                    window.alert('Registration Successful');
                     window.location = '?action=showlogin';
                    </script>";
                    // Redirect or show a success message
                } else {
                    echo "Registration failed";
                    // Handle failure (e.g., show an error message)
                }
            } else {
                echo "Please fill all fields";
                // Handle validation error
            }
        } else {
            echo "Invalid request method";
            // Handle invalid request method
        }
    }

    public function login()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $email = $_POST['email'];
            $password = $_POST['password'];

            if (!empty($email) && !empty($password)) {
                // Sanitize input
                $email = htmlspecialchars($email);
                $password = htmlspecialchars($password);

                // Call model to validate user
                $user = $this->userModel->login($email, $password);
                if ($user) {
                    // Successful login
                    $_SESSION['loggedin'] = true;
                    $_SESSION['id'] = $user['id']; // Store user ID in session
                    header('Location: ?action=home');
                    exit(); // Ensure no further code is executed
                } else {
                    echo "<script>
                            window.alert('Invalid email or password.');
                             window.location = '?action=showlogin';
                            </script>";
                    // Display user data for debugging
                }
            } else {
                echo "Please fill all fields";
            }
        } else {
            echo "Invalid request method";
        }
    }
    // public function showCategories() {
       
    //     include 'views/home.php';
    // }
    public function logout()
    {
        // Unset all of the session variables.
        $_SESSION = array();

        // If the session was propagated using a cookie, delete that cookie.
        if (ini_get("session.use_cookies")) {
            $params = session_get_cookie_params();
            setcookie(
                session_name(),
                '',
                time() - 42000,
                $params["path"],
                $params["domain"],
                $params["secure"],
                $params["httponly"]
            );
        }

        // Destroy the session.
        session_destroy();

        // Redirect to the login page or any other page
        echo "<script>
                alert('Logged out successfully');
                window.location.href = 'index.php?action=showlogin';
              </script>";
        exit;
    }
}




