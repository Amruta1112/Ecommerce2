<?php


class UserModel
{
    private $conn;

    public function __construct($pdo)
    {
        $this->conn = $pdo;

    }
    public function register($username, $email, $passwordHash)
    {
        // Hash the password
        $passwordHash = password_hash($passwordHash, PASSWORD_BCRYPT);

        // Prepare and bind
        $sql = "INSERT INTO user (username, email, password_hash) VALUES (:username, :email, :password_hash)";
        $stmt = $this->conn->prepare($sql);

        // Bind parameters
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':password_hash', $passwordHash);

        // Execute the query
        return $stmt->execute();
    }
    public function login($email, $passwordHash)
    {
        $sql = "SELECT id, email, password_hash FROM user WHERE email = :email";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':email', $email);
        $stmt->execute();

        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Debug output
     

        if ($user && password_verify($passwordHash, $user['password_hash'])) {
            return $user; // Return user data
        }

        return false; // Invalid email or password
    }
    public function getAllCategories() {
        $query = "SELECT * FROM categories";
        $statement = $this->conn->prepare($query);
        $statement->execute();
        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }
     public function getAllProducts() {
        $query = "SELECT p.*, c.name AS category_name FROM products p
                  JOIN categories c ON p.category_id = c.id";
        $statement = $this->conn->prepare($query);
        $statement->execute();
        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }
}

?>