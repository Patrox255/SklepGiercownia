<?php

    function loadProducts()
    {

        $allPOST= file_get_contents('php://input');
        $searchData = json_decode($allPOST);

        session_start();
        $_SESSION['searchData']=$searchData;

        include('conn.php');

        if ($searchData->priceRange->max==='max')
        {
            $query = 'SELECT round(max(produkt.cena*rabat.mnoznik)*100)/100 as max FROM produkt JOIN rabat on produkt.rabat_id = rabat.id;';
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            else {
                $row = $result->fetch_assoc();
                $searchData->priceRange->max=$row['max'];
            }
        }

        $query = 'SELECT produkt.id, produkt.nazwa, produkt.cena, rabat.mnoznik, gatunek.nazwa as gatunek FROM produkt join rabat JOIN gatunek on produkt.rabat_id = rabat.id && produkt.gatunek_id = gatunek.id';
        if (!empty($searchData->selectedCategories))
        {
            $query.=" WHERE (";
            for ($i=0; $i<count($searchData->selectedCategories); $i++)
            {
                $query.=" produkt.gatunek_id = {$searchData->selectedCategories[$i]}";
                if ($i<count($searchData->selectedCategories)-1)
                {
                    $query.=" ||";
                }
            }
            $query.=")";
            if (!empty($searchData->searchBar))
            {
                $query.=" && produkt.nazwa like '%{$searchData->searchBar}%'";
            }
            $query.="  && round(produkt.cena*rabat.mnoznik*100)/100 >= {$searchData->priceRange->min} && round(produkt.cena*rabat.mnoznik*100)/100 <= {$searchData->priceRange->max}";
        }
        else if (!empty($searchData->searchBar))
        {
            $query.=" WHERE produkt.nazwa like '%{$searchData->searchBar}%' && round(produkt.cena*rabat.mnoznik*100)/100 >= {$searchData->priceRange->min} && round(produkt.cena*rabat.mnoznik*100)/100 <= {$searchData->priceRange->max}";
        }
        else {
            $query.=" WHERE round(produkt.cena*rabat.mnoznik*100)/100 >= {$searchData->priceRange->min} && round(produkt.cena*rabat.mnoznik*100)/100 <= {$searchData->priceRange->max}";
        }
        $query.=" ORDER BY {$searchData->sort};";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        else
        {
            $products = array();
            while($row = $result->fetch_assoc())
            {
                array_push($products, $row);
            }
            echo json_encode($products);
        }
        $conn->close();
    }
    echo loadProducts();

?>