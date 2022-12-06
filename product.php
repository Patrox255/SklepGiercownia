<!DOCTYPE html>
<html lang="pl">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Giercownia</title>
        <link rel="stylesheet" href="style.css" type="text/css" />
        <link rel="stylesheet" href="product.css" type="text/css" />
        <link
         rel="apple-touch-icon"
         sizes="180x180"
         href="/apple-touch-icon.png"
      />
      <link
         rel="icon"
         type="image/png"
         sizes="32x32"
         href="/favicon-32x32.png"
      />
      <link
         rel="icon"
         type="image/png"
         sizes="16x16"
         href="/favicon-16x16.png"
      />
      <link rel="manifest" href="/site.webmanifest" />
        <script
         src="https://kit.fontawesome.com/2b44a7a62f.js"
         crossorigin="anonymous"
      ></script>
    </head>
    <body>
        <header id="banner">
            <div id='header-div'><a href="index.html"><h1>Giercownia</h1></a></div>
            <nav>
                <div id="welcome-user-div">
                <div id="center-user">
                    <div id="user-nav">
                        <a href="login.html" id="user-icon"
                            ><i class="fa-solid fa-user"></i>
                        </a>
                    </div>
                </div>
                </div>
            </nav>
        </header>

        <div id="center">
            <main id="product">
                <?php

                    function loadProduct()
                    {

                        include('conn.php');

                        if (isset($_GET['id']) && !empty($_GET['id']))
                        {
                            $id = $_GET['id'];
                        }
                        else {
                            $id = 1;
                        }
    
                        $query = 'SELECT produkt.id, produkt.nazwa, produkt.cena, rabat.mnoznik, produkt.opis, gatunek.nazwa as gatunek, produkt.stan_magazynowy FROM produkt join rabat JOIN gatunek on produkt.rabat_id = rabat.id && produkt.gatunek_id = gatunek.id WHERE produkt.id='.$id.';';
    
                        $result = $conn->query($query);
    
                        if (!$result)
                        {
                            return -1;
                        }
                        else {
                            while ($row = $result->fetch_assoc())
                            {
                                echo "<header id='product-header'><h2>{$row['nazwa']}</h2></header>";
                                $imgSrc = str_replace(':', '-', str_replace(' ', '-', strtolower($row['nazwa'])));
                                $imgSrc.='.jpg';
                                echo '<div id="product-order"><figure><img src="Grafiki/'.$imgSrc.'"><figcaption>'.$row['nazwa'].'</figcaption></figure>';
                                echo "<div id='right'><div><div id='product-price-div'>";
                                if ($row['mnoznik']!=1)
                                {
                                    $price = number_format(round($row['cena']*$row['mnoznik']*100)/100, 2);
                                    echo "<p id='product-price-old'>{$row['cena']} zł</p><p id='product-price-new'>{$price} zł</p>";
                                }
                                else 
                                {
                                    echo "<p id='product-price'>{$row['cena']} zł</p>";
                                }
                                echo "</div>";
                                if ($row['stan_magazynowy']<=0)
                                {
                                    echo "<p>Brak dostępnych sztuk!</p>";
                                }
                                else {
                                    echo "<div id='count-div'><input type='number' id='count' min='1' step='1' onchange='changePrice({$id})'>z <span id='available'>{$row['stan_magazynowy']}</span><br></div><input type='button' value='Kup teraz' onclick='buyProduct({$id})'</div>";
                                }
                                echo "</div></div></div>";
                                echo "<div id='product-specification'><div id='product-description-tags'><div id='product-description'><h2 id='description-header'>Opis produktu:</h2>{$row['opis']}</div><div id='product-tags'><h2 id='tags-header'>Tagi produktu:</h2><div id='product-tags-div'>";
                                $query = "SELECT tagi.nazwa FROM tagi join produkt_has_tagi join produkt on tagi.id = produkt_has_tagi.tagi_id && produkt_has_tagi.produkt_id = produkt.id WHERE produkt_id={$id};";
                                $pId = $row['id'];
                                $resultTags = $conn->query($query);
                                if (!$resultTags)
                                {
                                    return -1;
                                }
                                else {
                                    while($tag = $resultTags->fetch_assoc())
                                    {
                                        echo "<div class='product-tag'>{$tag['nazwa']}</div>";
                                    }
                                    $query = "SELECT gatunek.nazwa as Gatunek, platforma.nazwa as Platforma, wydawca.nazwa as Wydawca, producent.nazwa as Producent, produkt.wymagania_sprzetowe_minimalne_id as minId, produkt.wymagania_sprzetowe_zalecane_id as sugId FROM produkt JOIN gatunek JOIN platforma JOIN wydawca JOIN producent on produkt.gatunek_id = gatunek.id && produkt.platforma_id = platforma.id && produkt.wydawca_id = wydawca.id && produkt.producent_id = producent.id WHERE produkt.id={$pId};";
                                    $resultTags = $conn->query($query);
                                    $sugId = -1;
                                    $minId = -1;
                                    if (!$resultTags)
                                    {
                                        return -1;
                                    }
                                    else {
                                        while ($tag = $resultTags->fetch_assoc())
                                        {
                                            foreach($tag as $property=>$value)
                                            {
                                                if ($property!='minId' && $property!='sugId')
                                                {
                                                    echo "<div class='product-tag'>{$property}: {$value}</div>";
                                                }
                                                else {
                                                    if ($property=='minId')
                                                    {
                                                        $minId = $value;
                                                    }
                                                    else {
                                                        $sugId = $value;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                echo "</div></div></div>";


                                $query = "SELECT procesor.nazwa as pName, karta_graficzna.nazwa as gName, system_operacyjny.nazwa as osName, wymagania_sprzetowe_minimalne.miejsce_na_dysku_gb as dSize, wymagania_sprzetowe_minimalne.ilosc_gb_ram as rSize FROM wymagania_sprzetowe_minimalne JOIN procesor JOIN karta_graficzna JOIN system_operacyjny ON wymagania_sprzetowe_minimalne.procesor_id = procesor.id &&  wymagania_sprzetowe_minimalne.karta_graficzna_id = karta_graficzna.id && wymagania_sprzetowe_minimalne.system_operacyjny_id = system_operacyjny.id WHERE wymagania_sprzetowe_minimalne.id={$minId};";
                                $result = $conn->query($query);
                                $names = array('pName'=>'Procesor: ', 'gName'=>'Karta graficzna: ', 'osName'=>'System operacyjny: ', 'dSize'=>'Miejsce na dysku: ', 'rSize'=>'Ilość pamięci RAM: ');
                                if (!$result)
                                {
                                    return -1;
                                }
                                else {
                                    $row = $result->fetch_assoc();
                                    echo "<div id='hardware-specification'><div id='min-hardware-specification'><h2 class='hardware-header'>Wymagania minimalne:</h2>";
                                    foreach($row as $key => $value)
                                    {
                                        echo "<span>{$names[$key]}{$value}";
                                        if ($key=='dSize' || $key=='rSize') {
                                            echo " GB";
                                        }
                                        echo "</span>";
                                    }
                                    echo "</div>";
                                }

                                $query = "SELECT procesor.nazwa as pName, karta_graficzna.nazwa as gName, wymagania_sprzetowe_zalecane.ilosc_gb_ram as rSize FROM wymagania_sprzetowe_zalecane JOIN procesor JOIN karta_graficzna ON wymagania_sprzetowe_zalecane.procesor_id = procesor.id &&  wymagania_sprzetowe_zalecane.karta_graficzna_id = karta_graficzna.id WHERE wymagania_sprzetowe_zalecane.id={$sugId};";
                                $result = $conn->query($query);
                                if (!$result)
                                {
                                    return -1;
                                }
                                else {
                                    $row = $result->fetch_assoc();
                                    echo "<div id='sug-hardware-specification'><h2 class='hardware-header'>Wymagania zalecane:</h2>";
                                    foreach($row as $key => $value)
                                    {
                                        echo "<span>{$names[$key]}{$value}";
                                        if ($key=='rSize') {
                                            echo " GB";
                                        }
                                        echo "</span>";
                                    }
                                    echo "</div>";
                                }

                                echo "</div>";
                            }
                        }
                        $conn->close();
                    }
                    loadProduct();

                ?>
            </main>
        </div>
    </body>
    <script>

        function buyProduct(id) {
            const count = document.getElementById("count").value;

            if (count<1)
            {
                if (!document.getElementById("buy-err"))
                {
                    const err = `<span id='buy-err'>Za mała ilość!</span>`;
                    document.getElementById("right").children[0].insertAdjacentHTML('beforeend', err);
                }
                if (document.getElementById('success-message'))
                {
                    document.getElementById('success-message').remove();
                }
            }
            else {
                if (document.getElementById("buy-err"))
                {
                    document.getElementById("buy-err").remove();
                }
                fetch(`buy_product.php?id=${id}&count=${count}`, {
                method: 'GET'
            }).then(response=>{
                if (!response.ok)
                {
                    throw new Error("Problem z połączeniem!");
                }
                else
                {
                    response.text().then(result=>{
                        if (result==-2)
                        {
                            if (document.getElementById('success-message'))
                            {
                                document.getElementById('success-message').remove();
                            }
                            if (!document.getElementById("buy-err"))
                            {
                                const err = `<span id='buy-err'>Za duża ilość!</span>`;
                                document.getElementById("right").children[0].insertAdjacentHTML('beforeend', err);
                            }
                        }
                        else if (result==-3)
                        {
                            if (document.getElementById("buy-err"))
                            {
                                document.getElementById("buy-err").remove();
                            }
                            document.getElementById("right").children[0].innerHTML = "<span id='success-message'>Dziękujemy za zakup!</span><p>Brak dostępnych sztuk!</p>";
                        }
                        else if (result==-4)
                        {
                            if (!document.getElementById("buy-err"))
                            {
                                const err = `<span id='buy-err'>Zaloguj się aby dokonać zakupu!</span>`;
                                document.getElementById("right").children[0].insertAdjacentHTML('beforeend', err);
                            }
                        }
                        else if (result==-5)
                        {
                            if (!document.getElementById("buy-err"))
                            {
                                const err = `<span id='buy-err'>Zakupów możesz dokonać tylko z konta z adresem zamieszkania!</span>`;
                                document.getElementById("right").children[0].insertAdjacentHTML('beforeend', err);
                            }
                        }
                        else
                        {
                            if (document.getElementById("buy-err"))
                            {
                                document.getElementById("buy-err").remove();
                            }
                            if (!document.getElementById('success-message'))
                            {
                                const success = `<span id='success-message'>Dziękujemy za zakup!</span>`;
                                document.getElementById("right").children[0].insertAdjacentHTML('beforeend', success);
                            }
                            document.getElementById("available").innerHTML = result;
                        }
                    });
                }
            }).catch(error=>console.log(error));
            }
            
        }

        function changePrice(id) {
            const count = document.getElementById("count").value || 1;

            fetch(`change_price.php?id=${id}&count=${count}`, {
                method: "GET"
            }).then(result=>{
                if (!result.ok)
                {
                    throw new Error('Problem z połączeniem!');
                }
                else
                {
                    result.json().then(([price, discount])=>{
                        if (discount!=1)
                        {
                            document.getElementById("product-price-new").textContent = price.replaceAll(',', '.')+" zł";
                        }
                        else
                        {
                            document.getElementById("product-price").textContent = price.replaceAll(',', '.')+" zł";
                        }
                    })
                }
            }).catch(err=>{
                console.log("Error: "+err);
            });
        }

        function checkIfLogged() {
         fetch("check_if_logged.php", {
            method: "GET",
         })
            .then((response) => {
               if (!response.ok) {
                  throw new Error("Problem z połączeniem!");
               } else {
                  response.json().then((user) => {
                     if (user['id'] != -1) {
                        if (user["isAdmin"]=='true') {
                           document
                              .getElementById("user-nav")
                              .insertAdjacentHTML(
                                 "beforeend",
                                 `<a href='admin_panel.html' class='slider'>Panel administratora</a>`
                              );
                        }
                        document
                           .getElementById("user-nav")
                           .insertAdjacentHTML(
                              "beforeend",
                              `<a href='logout.php' class='slider'>Wyloguj się</a>`
                           );
                     } else {
                        document.getElementById("user-nav").insertAdjacentHTML(
                           "beforeend",
                           `<a href="register.html" class="slider">Zarejestruj się</a>
                     <a href="login.html" class="slider">Zaloguj się</a>`
                        );
                     }
                  });
               }
            })
            .catch((error) => {
               console.log("Error: " + error);
            });
      }

      checkIfLogged();

    </script>
</html>
