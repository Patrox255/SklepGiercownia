<?php

    function buyProduct()
    {
        include('conn.php');
        
        $id = $_GET['id'];
        $count = $_GET['count'];

        $query = "SELECT stan_magazynowy FROM produkt WHERE id={$id};";

        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        else {
            $row = $result->fetch_assoc();
            $stock = $row['stan_magazynowy'];
            if ($count<=$stock)
            {
                $query = "SELECT produkt.cena, rabat.mnoznik FROM produkt JOIN rabat on produkt.rabat_id = rabat.id WHERE produkt.id={$id};";
                $result = $conn->query($query);
                if (!$result)
                {
                    return -1;
                }
                else
                {
                    $product = $result->fetch_assoc();
                    $price = round($product['cena']*$product['mnoznik']*100)/100;
                    session_start();
                    if (!isset($_SESSION['uid']) || empty($_SESSION['uid']))
                    {
                        return -4;
                    }
                    if (!isset($_SESSION['uAddress']) || empty($_SESSION['uAddress']) || is_null($_SESSION['uAddress']))
                    {
                        return -5;
                    }
                    $query = "INSERT INTO zamowienia (adres_id, uzytkownik_id) VALUES ({$_SESSION['uAddress']}, {$_SESSION['uid']});";
                    $result = $conn->query($query);
                    if (!$result)
                    {
                        return -1;
                    }
                    $orderId = $conn->insert_id;
                    $query = "INSERT INTO zamowienia_has_produkt (zamowienia_id, produkt_id, ilosc_produktu, cena) VALUES ({$orderId}, {$id}, {$count}, {$price});";
                    $result = $conn->query($query);
                    if (!$result)
                    {
                        return -1;
                    }

                    $difference = $stock-$count;
                    $query = "UPDATE produkt SET stan_magazynowy={$difference} WHERE id={$id}";
                    $result = $conn->query($query);
                    if (!$result)
                    {
                        return -1;
                    }
                    else {
                        if ($difference<=0)
                        {
                            return -3;
                        }
                        else {
                            echo $difference;
                        }
    
                    }   
                }
            }
            else
            {
                return -2;
            }
        }
        $conn->close();
    }
    echo buyProduct();

?>