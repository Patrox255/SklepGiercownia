<?php

    function addProduct()
    {
        $name = $_POST['product-name'];
        $price = $_POST['product-price'];
        $discount = $_POST['product-discount'];
        $platformId = $_POST['product-platforms'];
        $genre = $_POST['product-genre'];
        $publisher = $_POST['product-publisher'];
        $producer = $_POST['product-producer'];
        $releaseDate = $_POST['product-release-date'];
        $stock = $_POST['product-stock'];
        $description = $_POST['product-description'];
        $tags = json_decode($_POST['product-tags']);
        $minCpu = $_POST['min-cpu'];
        $minGpu = $_POST['min-gpu'];
        $diskSpace = $_POST['disk-space'];
        $minRam = $_POST['min-ram'];
        $sugCpu = $_POST['sug-cpu'];
        $sugGpu = $_POST['sug-gpu'];
        $sugRam = $_POST['sug-ram'];
        $os = $_POST['os'];
        
        include('conn.php');

        $query = "SELECT id FROM produkt WHERE nazwa='{$name}';";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {
            $target_dir = 'Grafiki/';
            $target_file = $target_dir.basename(strtolower(str_replace(' ', '-', str_replace(':', '-', $name)))).'.jpg';
            $upload = 1;
            $target_file_type = $target_dir.basename($_FILES['product-img']['name']);
            $imgType = strtolower(pathinfo($target_file_type, PATHINFO_EXTENSION));
            if (file_exists($target_file) || $imgType!='jpg')
            {
                $upload = 0;
            }
            if ($upload)
            {
                move_uploaded_file($_FILES["product-img"]['tmp_name'], $target_file);
            }
            else {
                return -3;
            }
            return -2;
        }

        $query = "SELECT id from gatunek where nazwa = '{$genre}'";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {    
            $genreRow = $result->fetch_assoc();
            $genreId = $genreRow['id'];
        } 
        else {
            $query = "INSERT INTO gatunek (nazwa) VALUES ('{$genre}');";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $genreId = $conn->insert_id;
        }

        $discountRatio = 1-$discount/100;
        $query = "select id from rabat where mnoznik={$discountRatio};";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {
            $discountRow = $result->fetch_assoc();
            $discountId = $discountRow['id'];
        }
        else {
            $query = "INSERT INTO rabat (mnoznik) VALUES ({$discountRatio});";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $discountId = $conn->insert_id;
        }

        $query = "SELECT id FROM wydawca WHERE nazwa='{$publisher}';";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {
            $publisherRow = $result->fetch_assoc();
            $publisherId = $publisherRow['id'];
        }
        else {
            $query = "INSERT into wydawca (nazwa) VALUES ('{$publisher}');";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $publisherId = $conn->insert_id;
        }
        $query = "SELECT id FROM producent WHERE nazwa='{$producer}';";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {
            $producerRow = $result->fetch_assoc();
            $producerId = $producerRow['id'];
        }
        else {
            $query = "insert into producent (nazwa) values ('{$producer}');";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $producerId = $conn->insert_id;
        }
        
        // ---Specyfikacja---
        $query = "SELECT id FROM procesor WHERE nazwa='{$minCpu}';";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {
            $cpuRow = $result->fetch_assoc();
            $minCpuId = $cpuRow['id'];
        }
        else {
            $query = "INSERT INTO procesor (nazwa) VALUES ('{$minCpu}');";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $minCpuId = $conn->insert_id;
        }
        
        $query = "SELECT id FROM procesor WHERE nazwa='{$sugCpu}';";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {
            $cpuRow = $result->fetch_assoc();
            $sugCpuId = $cpuRow['id'];
        }
        else {
            $query = "INSERT INTO procesor (nazwa) VALUES ('{$sugCpu}');";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $sugCpuId = $conn->insert_id;
        }

        $query = "SELECT id FROM karta_graficzna WHERE nazwa='{$minGpu}';";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {
            $gpuRow = $result->fetch_assoc();
            $minGpuId = $gpuRow['id'];
        }
        else {
            $query = "INSERT INTO karta_graficzna (nazwa) VALUES ('{$minGpu}');";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $minGpuId = $conn->insert_id;
        }
        
        $query = "SELECT id FROM karta_graficzna WHERE nazwa='{$sugGpu}';";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {
            $gpuRow = $result->fetch_assoc();
            $sugGpuId = $gpuRow['id'];
        }
        else {
            $query = "INSERT INTO karta_graficzna (nazwa) VALUES ('{$sugGpu}');";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $sugGpuId = $conn->insert_id;
        }
        
        $query = "SELECT id FROM system_operacyjny WHERE nazwa='{$os}';";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {
            $osRow = $result->fetch_assoc();
            $osId = $osRow['id'];
        }
        else {
            $query = "INSERT INTO system_operacyjny (nazwa) VALUES ('{$os}');";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $osId = $conn->insert_id;
        }
        
        $query = "SELECT id FROM wymagania_sprzetowe_minimalne WHERE procesor_id = {$minCpuId} && karta_graficzna_id = {$minGpuId} && system_operacyjny_id = {$osId} && miejsce_na_dysku_gb={$diskSpace} && ilosc_gb_ram = {$minRam};";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {
            $minRow = $result->fetch_assoc();
            $minId = $minRow['id'];
        }
        else {
            $query = "INSERT INTO wymagania_sprzetowe_minimalne (procesor_id, karta_graficzna_id, system_operacyjny_id, miejsce_na_dysku_gb, ilosc_gb_ram) VALUES ({$minCpuId}, {$minGpuId}, {$osId}, {$diskSpace}, {$minRam});";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $minId = $conn->insert_id;
        }

        $query = "SELECT id FROM wymagania_sprzetowe_zalecane WHERE procesor_id = {$sugCpuId} && karta_graficzna_id = {$sugGpuId} && ilosc_gb_ram = {$sugRam};";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        if ($result->num_rows>0)
        {
            $sugRow = $result->fetch_assoc();
            $sugId = $sugRow['id'];
        }
        else {
            $query = "INSERT INTO wymagania_sprzetowe_zalecane (procesor_id, karta_graficzna_id, ilosc_gb_ram) VALUES ({$sugCpuId}, {$sugGpuId}, {$sugRam});";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            $sugId = $conn->insert_id;
        }
        // --- Specyfikacja ---

        $query = "INSERT INTO produkt (nazwa, cena, gatunek_id, platforma_id, rabat_id, popularnosc, wydawca_id, producent_id, opis, stan_magazynowy, data_wydania, wymagania_sprzetowe_minimalne_id, wymagania_sprzetowe_zalecane_id) VALUES ('{$name}', {$price}, {$genreId}, {$platformId}, {$discountId}, 0, {$publisherId}, {$producerId}, '{$description}', {$stock}, '{$releaseDate}', {$minId}, {$sugId});";
        $result = $conn->query($query);
        if (!$result)
        {
            return -1;
        }
        $productId = $conn->insert_id;

        foreach($tags as $tag)
        {
            $query = "SELECT id FROM tagi WHERE nazwa='{$tag}';";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
            if ($result->num_rows>0)
            {
                $tagRow = $result->fetch_assoc();
                $tagId = $tagRow['id'];
            }
            else {
                $query = "INSERT INTO tagi (nazwa) VALUES ('{$tag}');";
                $result = $conn->query($query);
                if (!$result)
                {
                    return -1;
                }
                $tagId = $conn->insert_id;
            }
            $query = "INSERT INTO produkt_has_tagi VALUES ({$productId}, {$tagId});";
            $result = $conn->query($query);
            if (!$result)
            {
                return -1;
            }
        }
    
        $conn->close();

        $target_dir = 'Grafiki/';
        $target_file = $target_dir.basename(strtolower(str_replace(' ', '-', str_replace(':', '-', $name)))).'.jpg';
        $upload = 1;
        $target_file_type = $target_dir.basename($_FILES['product-img']['name']);
        $imgType = strtolower(pathinfo($target_file_type, PATHINFO_EXTENSION));
        if (file_exists($target_file) || $imgType!='jpg')
        {
            $upload = 0;
        }
        if ($upload)
        {
            move_uploaded_file($_FILES["product-img"]['tmp_name'], $target_file);
        }
        else {
            return -3;
        }

        return 1;
    }
    
    echo addProduct();
?>