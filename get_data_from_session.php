<?php

    function getDataFromSession() {
        session_start();

        $result = array();

        if (isset($_SESSION['searchData']) && !empty($_SESSION['searchData']))
        {
            $result['searchData'] = $_SESSION['searchData'];
            if (isset($_SESSION['uid']) && !empty($_SESSION['uid']))
            {
                $result['uid'] = $_SESSION['uid'];
            }
            else 
            {
                $result['uid']=-1;
            }
            return json_encode($result);
        }
        else
        {
            return -1;
        }
    }
    echo getDataFromSession();

?>