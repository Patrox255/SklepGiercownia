<?php

    function checkIfLogged()
    {
        session_start();
        $userProperties = array("id"=>-1, "isAdmin"=>false);
        // session_destroy();
        if (isset($_SESSION['uid']) && !empty($_SESSION['uid']))
        {
            $userProperties['id']=$_SESSION['uid'];
            include('conn.php');
            $query = "select is_admin, login from uzytkownik where id={$_SESSION['uid']};";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $userRow = $result->fetch_assoc();
            $userProperties["isAdmin"]=$userRow['is_admin'];
            $userProperties['login']=$userRow['login'];
        }
        return json_encode($userProperties);
    }
    echo checkIfLogged();

?>