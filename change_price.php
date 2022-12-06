<?php

    function changePrice()
    {
        include('conn.php');

        $id = $_GET['id'];
        $count = $_GET['count'];
        $query = "SELECT produkt.cena, rabat.mnoznik FROM produkt join rabat on produkt.rabat_id = rabat.id WHERE produkt.id = {$id};";

        $result = $conn->query($query);

        if (!$result)
        {
            return -1;
        }
        else {
            $product = $result->fetch_assoc();
            $results = array();
            $price = number_format(round($product['cena']*$product['mnoznik']*100)/100*$count, 2);
            array_push($results, $price);
            array_push($results, $product['mnoznik']);
            return json_encode($results);
        }
    }

    echo changePrice();

?>