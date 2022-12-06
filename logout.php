<?php

    function logout() {
        session_start();
        if (isset($_SESSION['uid']) && !empty($_SESSION['uid']))
        {
            unset($_SESSION['uid']);
        }
        header("Location: index.html");    
    }
    logout();

?>