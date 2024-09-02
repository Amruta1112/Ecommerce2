<?php
session_start();
require_once("config.php"); // Include database file
require_once("controller\controller.php"); // Include controller file

// Create a new instance of the Database class
$database = new Database();
$pdo = $database->connect(); // Get the PDO instance

// Create a new instance of the UserModel class
$userModel = new UserModel($pdo); // Pass the PDO instance

// Create a new instance of the UserController class
$controller = new UserController($pdo);

// Determine the action to perform
$action = isset($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) ? $_GET['id'] : null;

switch ($action) {
    case 'showlogin':
        $controller->showlogin();
        break;
    case 'showregister':
        $controller->showregister();
        break;
    case 'login':
        $controller->login();
        break;
    case 'logout':
        $controller->logout();
        break;
    case 'register':
        $controller->register();
        break;
    case 'home':
        if (isset($_SESSION['id'])) {
            $controller->showhome();
        } else {
            header('Location: ?action=showlogin');
        }
        break;
    default:
         $controller->showregister();

    break;
   
}
?>
