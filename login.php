<?php
    function login()
    {
        $userLogin = $_POST["login"];
        $userPassword = $_POST['password'];
        $hash = hash('sha256', $_POST['password']);
    
        include('conn.php');

        if (!$conn)
        {
            return -1;
        }
        else 
        {
            $query = 'SELECT login, id, email, adres_id  FROM uzytkownik WHERE login="'.$userLogin.'" && haslo="'.$hash.'";';

            $result = mysqli_query($conn, $query);

            if ($result)
            {

                if (mysqli_num_rows($result)==0)
                {
                    return 0;
                }
                else
                {
                    $user = $result->fetch_assoc();
                    session_start();
                    $_SESSION['uid']=$user['id'];
                    $_SESSION['uLogin']=$user['login'];
                    $_SESSION['uAddress']=$user['adres_id'];
                    $user['haslo'] = $userPassword;
                    return json_encode($user);
                }
            }
            else
            {
                echo $result;
            }
        }
        $conn->close();
    }
    echo login();
?>