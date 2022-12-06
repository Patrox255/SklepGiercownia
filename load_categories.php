<?php

    function loadCategories() {
        include('conn.php');
        if (!$conn)
        {
            return -1;
        }
        else
        {
            $query = 'SELECT id, nazwa from gatunek';

            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            else
            {
                $genres = array();
                while($row = $result->fetch_assoc())
                {
                    array_push($genres, $row);
                }
                echo json_encode($genres);
            }
        }
        $conn->close();
    }
    echo loadCategories();

?>