<?php
    function register()
    {
        $login = $_POST['login'];
        $password = $_POST['password'];
        $email = $_POST['email'];
        $birthDate = $_POST['birth-date'];
        $withAddress = false;
        $withFlat = false;
        $userId = 0;
        if (isset($_POST['first-name']))
        {
            $withAddress=true;
            $firstName = $_POST['first-name'];
            $lastName = $_POST['last-name'];
            $phoneNr = $_POST['phone-nr'];
            $city = $_POST['city'];
            $postalCode = $_POST['postal-code'];
            $street = $_POST['street'];
            $houseNr = $_POST['house-nr'];
            if (isset($_POST['flat-nr']))
            {
                $withFlat=true;
                $flatNr = $_POST['flat-nr'];
            }
        }
        include('conn.php');
        if (!$conn)
        {
            return 0; 
        }
        $password = hash('sha256', $password);
        $query ="SELECT id FROM uzytkownik WHERE login='{$login}' || email='{$email}';";
        
        $result = $conn->query($query);
        if (!$result)
        {
            return 0;
        }
        else
        {
            if ($result->num_rows>0)
            {
                return -1;
            }
            else
            {
                $query = "INSERT INTO uzytkownik (login, haslo, data_urodzenia, email) VALUES ('{$login}', '{$password}', '{$birthDate}', '{$email}');";

                $result = $conn->query($query);
                if (!$result)
                {
                    return 0;
                }
                else {
                    if (!$withAddress && !$withFlat)
                    {
                        return 1;
                    }
                    else
                    {
                        $user_id = $conn->insert_id;

                        $street_id = -1;
                        $city_id = -1;
                        $query = "SELECT id FROM miasto where nazwa='{$city}';";
                        $result = $conn->query($query);
                        if (!$result)
                        {
                            return 0;
                        }
                        else
                        {
                            if ($result->num_rows>0)
                            {
                                $row = $result->fetch_assoc();
                                $city_id = $row['id'];
                            }
                            else
                            {
                                $query = "INSERT INTO miasto (nazwa) VALUES ('{$city}');";
                                $result = $conn->query($query);
                                if (!$result)
                                {
                                    return 0;
                                }
                                else
                                {
                                    $city_id = $conn->insert_id;
                                }
                            }
                        }

                        $query = "SELECT id FROM ulica where nazwa='{$street}';";
                        $result = $conn->query($query);
                        if (!$result)
                        {
                            return 0;
                        }
                        else
                        {
                            if ($result->num_rows>0)
                            {
                                $row = $result->fetch_assoc();
                                $street_id = $row['id'];
                            }
                            else
                            {
                                $query = "INSERT INTO ulica (nazwa) VALUES ('{$street}');";
                                $result = $conn->query($query);
                                if (!$result)
                                {
                                    return 0;
                                }
                                else
                                {
                                    $street_id = $conn->insert_id;
                                }
                            }
                        }

                        $query = "SELECT id FROM adres WHERE imie='{$firstName}' && nazwisko='{$lastName}' && ulica_id={$street_id} && numer_telefonu='48{$phoneNr}' && kod_pocztowy='{$postalCode}' && miasto_id={$city_id} && numer_domu={$houseNr}";
                        if ($withFlat)
                        {
                            $query.=" && numer_mieszkania={$flatNr};";
                        }
                        else
                        {
                            $query.=';';
                        }
                        $result = $conn->query($query);
                        if (!$result)
                        {
                            return 0;
                        }
                        else {
                            if ($result->num_rows>0)
                            {
                                $row = $result->fetch_assoc();
                                $address_id = $row["id"];
                            }
                            else
                            {
                                $query = "INSERT INTO adres (imie, nazwisko, ulica_id, numer_telefonu, kod_pocztowy, miasto_id, numer_domu";
                                if ($withFlat)
                                {
                                    $query.=', numer_mieszkania';
                                }
                                $query.=") VALUES ('{$firstName}', '{$lastName}', {$street_id}, '48{$phoneNr}', '{$postalCode}', {$city_id}, {$houseNr}";
                                if ($withFlat)
                                {
                                    $query.=", {$flatNr}";
                                }
                                $query.=");";
                                $result = $conn->query($query);
                                if (!$result)
                                {
                                    return 0;
                                }
                                else {
                                    $address_id = $conn->insert_id;
                                }
                            }
                            $query = "UPDATE uzytkownik SET adres_id={$address_id} WHERE id={$user_id};";
                            $result = $conn->query($query);
                            if (!$result)
                            {
                                return 0;
                            }
                            else {
                                return 1;
                            }
                        }
                    }
                }
            }
        }
        $conn->close();
    }
    echo register();

?>