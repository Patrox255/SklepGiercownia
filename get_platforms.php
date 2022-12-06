<?php

    function getPlatforms()
    {
        include('conn.php');
        $query = 'SELECT * FROM platforma';
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        else {
            $platforms = array();
            while ($platform = $result->fetch_assoc())
            {
                array_push($platforms, $platform);
            }
            $conn->close();
            return json_encode($platforms);
        }
    }
    echo getPlatforms();

?>