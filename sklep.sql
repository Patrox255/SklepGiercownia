-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2022 at 08:18 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sklep`
--

-- --------------------------------------------------------

--
-- Table structure for table `adres`
--

CREATE TABLE `adres` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `ulica_id` mediumint(8) UNSIGNED NOT NULL,
  `numer_telefonu` varchar(12) NOT NULL,
  `kod_pocztowy` varchar(6) NOT NULL,
  `miasto_id` mediumint(8) UNSIGNED NOT NULL,
  `numer_domu` tinyint(3) UNSIGNED NOT NULL,
  `numer_mieszkania` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adres`
--

INSERT INTO `adres` (`id`, `imie`, `nazwisko`, `ulica_id`, `numer_telefonu`, `kod_pocztowy`, `miasto_id`, `numer_domu`, `numer_mieszkania`) VALUES
(1, 'Andrzej', 'Dobry', 4, ' 48754437384', '41-705', 1, 3, 5),
(2, 'Adam', 'Kowalski', 5, ' 48765890458', '41-717', 2, 17, NULL),
(11, 'Pan', 'Adres', 1, '48123456789', '41-705', 1, 5, 3),
(17, 'Admin', 'Niezły', 9, '48123456789', '41-905', 1, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `gatunek`
--

CREATE TABLE `gatunek` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nazwa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gatunek`
--

INSERT INTO `gatunek` (`id`, `nazwa`) VALUES
(2, 'Akcja'),
(6, 'FPS'),
(8, 'Horror'),
(10, 'Przygodowa'),
(5, 'Roguelite'),
(3, 'RPG'),
(1, 'RTS'),
(4, 'Souls-like'),
(7, 'Strategiczna'),
(9, 'Survival');

-- --------------------------------------------------------

--
-- Table structure for table `karta_graficzna`
--

CREATE TABLE `karta_graficzna` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nazwa` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `karta_graficzna`
--

INSERT INTO `karta_graficzna` (`id`, `nazwa`) VALUES
(1, 'NVIDIA GTX 1050'),
(2, 'NVIDIA GTX 1080'),
(3, 'NVIDIA GTX 1050 Ti lub AMD RADEON RX 560'),
(4, 'NVIDIA RTX 2060 lub AMD RX Vega 56'),
(5, 'NVIDIA GTX 970 lub AMD Radeon RX 470'),
(6, 'NVIDIA GTX 1060 lub AMD Radeon RX 590'),
(7, 'NVIDIA GTX 660 lub AMD Radeon HD 7870'),
(8, 'NVIDIA GTX 970 lub AMD Radeon RX 480'),
(9, 'NVIDIA GTX 1060 lub AMD Radeon RX 580'),
(10, 'NVIDIA GTX 1070 lub AMD Radeon RX Vega 56'),
(11, 'NVIDIA GTX 770 lub AMD Radeon R9 290'),
(12, 'NVIDIA GTX 680 lub AMD R9 280X'),
(13, 'NVIDIA GTX 760 lub AMD Radeon HD 7950'),
(14, 'NVIDIA GTX 970 lub AMD Radeon RX 570'),
(15, 'NVIDIA GTX 960 lub AMD Radeon R7 370'),
(16, 'NVIDIA GTX 1060'),
(17, 'NVIDIA 450 lub AMD 5570'),
(18, 'NVIDIA 770 lub AMD 7970'),
(19, 'NVIDIA GTX 780 lub AMD Radeon R9 285'),
(20, 'NVIDIA GTX 970 lub AMD R9 290X'),
(21, 'NVIDIA GTX 1070 lub AMD Radeon RX 5700'),
(22, 'NVIDIA 8800'),
(23, 'NVIDIA GTX 560'),
(24, 'NVIDIA GTX 770 lub AMD Radeon R9 280'),
(25, 'NVIDIA GTX 1060 lub AMD Radeon RX 480'),
(45, 'Nvidia® GeForce™ GTX 470 (1.28GB) | AMD® HD 5850 (1GB) | Intel Iris Xe G7 (Tiger Lake) | AMD® Radeon™ RX Vega 11'),
(46, 'Nvidia® GeForce™ GTX 570 (1.28GB) | AMD® Radeon™ HD 7970 (3GB) | Intel Iris Xe G7 (Tiger Lake)');

-- --------------------------------------------------------

--
-- Table structure for table `miasto`
--

CREATE TABLE `miasto` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `nazwa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `miasto`
--

INSERT INTO `miasto` (`id`, `nazwa`) VALUES
(1, 'Bytom'),
(2, 'Katowice'),
(3, 'Ruda'),
(4, 'Ruda Śląska');

-- --------------------------------------------------------

--
-- Table structure for table `platforma`
--

CREATE TABLE `platforma` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nazwa` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `platforma`
--

INSERT INTO `platforma` (`id`, `nazwa`) VALUES
(8, 'Gra planszowa'),
(7, 'Nintendo Switch'),
(1, 'PC'),
(3, 'Playstation 4'),
(2, 'Playstation 5'),
(4, 'Xbox One'),
(5, 'Xbox S'),
(6, 'Xbox X');

-- --------------------------------------------------------

--
-- Table structure for table `procesor`
--

CREATE TABLE `procesor` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nazwa` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `procesor`
--

INSERT INTO `procesor` (`id`, `nazwa`) VALUES
(1, 'Intel Core i5 2.5 GHz'),
(2, 'Intel Core i7 2.8GHz'),
(3, 'Intel Core i3-9100 / AMD Ryzen 3 2300X'),
(4, 'Intel Core i5-8600K lub AMD Ryzen 5 3600X'),
(5, 'Intel Core i5-3570K lub AMD FX-8310'),
(6, 'Intel Core i7-4790 lub AMD Ryzen 3 3200G'),
(7, 'Intel Core i3-2100'),
(8, 'Intel Core i7-3770'),
(9, 'Intel Core i5-8400 lub AMD Ryzen 3 3300X'),
(10, 'Intel Core i7-8700K lub AMD Ryzen 5 3600X'),
(11, 'Intel Core i5-2500K lub AMD Phenom II X4 940'),
(12, 'Intel Core i7 3770 lub AMD FX-8350'),
(13, '2.0 GHz'),
(14, '3.0 GHz'),
(15, 'Intel Core i3-2100 lub AMD FX-6300'),
(16, 'Intel Core i5-2500K lub AMD Ryzen 5 1400'),
(17, 'Intel Core i5-4430 lub AMD FX-6300'),
(18, 'Intel Core i5-7600K lub AMD Ryzen 5-1600'),
(19, 'Intel Core i3 2.5 GHz lub AMD Phenom II'),
(20, 'Intel Core i5 2.5 GHz lub AMD FX8350 4.0 GHz'),
(21, 'Intel Core i5-6600K lub AMD Ryzen 3 1300X'),
(22, 'Intel Core i7-4790 lub AMD Ryzen 5 1500X'),
(23, 'Intel Core i5-7500 lub AMD Ryzen 3 1200'),
(24, 'Intel Core i7-8700 lub AMD Ryzen 5 3600'),
(25, 'Intel Dual-Core 2.4 GHz'),
(26, 'Quad Core Processor'),
(27, 'Intel Core i5-2500K lub AMD FX-6300'),
(28, 'Intel Core i7-4770K lub AMD Ryzen 5 1500X'),
(29, 'Intel® Core™ i5 2500K | AMD® Ryzen 3 2200G'),
(30, 'Intel® Core™ i5 750 | AMD® FX 4300');

-- --------------------------------------------------------

--
-- Table structure for table `producent`
--

CREATE TABLE `producent` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nazwa` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producent`
--

INSERT INTO `producent` (`id`, `nazwa`) VALUES
(37, ' Paradox Development Studio'),
(9, 'Bethesda Game Studios'),
(10, 'CAPCOM Co.'),
(3, 'CD PROJEKT RED'),
(6, 'Cellar Door Games'),
(11, 'Endnight Games Ltd'),
(8, 'Firaxis Games'),
(5, 'FromSoftware Inc.'),
(36, 'Paradox Development Studio'),
(4, 'Rebellion'),
(12, 'Rockstar Games'),
(1, 'Shiro Games'),
(2, 'Techland'),
(7, 'VOID Interactive');

-- --------------------------------------------------------

--
-- Table structure for table `produkt`
--

CREATE TABLE `produkt` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `cena` decimal(6,2) NOT NULL,
  `gatunek_id` tinyint(3) UNSIGNED NOT NULL,
  `platforma_id` tinyint(3) UNSIGNED NOT NULL,
  `rabat_id` tinyint(3) UNSIGNED NOT NULL,
  `popularnosc` smallint(5) UNSIGNED NOT NULL,
  `wydawca_id` smallint(5) UNSIGNED NOT NULL,
  `producent_id` smallint(5) UNSIGNED NOT NULL,
  `opis` longtext NOT NULL,
  `wymagania_sprzetowe_minimalne_id` smallint(5) UNSIGNED DEFAULT NULL,
  `wymagania_sprzetowe_zalecane_id` smallint(5) UNSIGNED DEFAULT NULL,
  `stan_magazynowy` smallint(5) UNSIGNED NOT NULL,
  `data_wydania` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produkt`
--

INSERT INTO `produkt` (`id`, `nazwa`, `cena`, `gatunek_id`, `platforma_id`, `rabat_id`, `popularnosc`, `wydawca_id`, `producent_id`, `opis`, `wymagania_sprzetowe_minimalne_id`, `wymagania_sprzetowe_zalecane_id`, `stan_magazynowy`, `data_wydania`) VALUES
(1, 'Dune: Spice Wars', '69.99', 1, 1, 1, 0, 1, 1, '\r\nStrategia czasu rzeczywistego typu 4X od twórców powszechnie docenionego Northgard. W grze osadzonej w przełomowym uniwersum Diuny, stworzonym przez Franka Herberta, wcielasz się w przywódcę jednej z frakcji walczących o dominację nad surową, pustynną planetą Arrakis.<br><br>\r\n\r\nPrzyprawa to najcenniejsza substancja we wszechświecie. Przedłuża życie, rozszerza świadomość i umożliwia podróże międzygwiezdne. Występuje tylko na Arrakis i pożąda jej każda potęga we wszechświecie. Graj jedną z kilku dostępnych frakcji – rodem Atrydów, rodem Harkonnenów, Przemytnikami i miejscowymi Fremenami – by zapanować nad Diuną i przyprawą.<br><br>\r\n\r\nWypatruj znaku czerwia, inaczej twoje oddziały i żniwiarki przyprawy zostaną połknięte przez gigantyczne pustynne czerwie, wynurzające się spomiędzy wydm. Zniszcz swoich przeciwników w walce, pokonaj ich przy pomocy politycznych intryg i mieszaj im szyki, używając nieuchwytnych szpiegów.', 1, 1, 79, '2022-04-26'),
(2, 'Dying Light 2', '199.99', 2, 1, 2, 0, 2, 2, 'Ponad dwadzieścia lat temu walczyliśmy z wirusem w Harranie. Przegraliśmy. Teraz, w Mieście, przegrywamy ponownie. Konflikt podzielił jedną z ostatnich wielkich osad, a cywilizacja cofnęła się do wieków ciemnych. Mimo to nadzieja nas nie opuszcza..<br><br>\r\n\r\nJesteś wędrowcem dzierżącym moc, dzięki której możesz zmienić losy Miasta. Jednak twoje nadzwyczajne zdolności mają swoją cenę. Przeszłość pozostawiła w tobie niejasne wspomnienia, których nie jesteś w stanie rozszyfrować, a droga ku prawdzie wiedzie cię w sam środek wojny. Doskonal swoje umiejętności, bo, żeby pokonać wrogów oraz zyskać sojuszników, będziesz potrzebować zarówno siły, jak i sprytu. Odkryj mroczne sekrety tych, którzy są u władzy, wybierz, po której stronie chcesz stanąć i stwórz swoje przeznaczenie. Jednak bez względu na to, dokąd zaprowadzą cię twoje czyny, musisz pamiętać o jednym – pozostań człowiekiem.', 2, 2, 3, '2022-02-04'),
(3, 'Cyberpunk 2077', '199.99', 3, 2, 2, 0, 3, 3, 'yberpunk 2077 to rozgrywająca się w otwartym świecie przygoda, w której jako najemnik stajesz do walki z siłami trzęsącymi Night City. Stwórz postać i zdefiniuj własny styl gry, rozsławiaj swoje imię i odblokowuj cybernetyczne ulepszenia. Relacje, które zawiążesz, i wybory, które podejmiesz, wpłyną na twoją opowieść i historię potężnego miasta przyszłości. Tu rodzą się legendy. Jaka będzie twoja?\r\n\r\n\r\n<br><br>\r\nSTWÓRZ WŁASNEGO CYBERPUNKA<br>\r\nZostań wyjętym spod prawa, uzbrojonym w cybernetyczne ulepszenia najemnikiem i zasłuż na miano legendy Night City.\r\n<br><br>\r\n\r\n\r\nODKRYWAJ MIASTO PRZYSZŁOŚCI<br>\r\nW Night City urobisz się po łokcie, odwiedzisz mnóstwo ciekawych miejscówek i poznasz masę interesujących postaci. Tylko od ciebie zależy, gdzie trafisz i w jaki sposób się tam dostaniesz.\r\n<br><br>\r\n\r\n\r\nZBUDUJ WŁASNĄ LEGENDĘ<br>\r\nPrzeżywaj szalone przygody i rozwijaj relacje z barwnymi postaciami, o których losach zadecydują twoje wybory.\r\n<br><br>\r\n\r\n\r\nWYPOSAŻONY W ULEPSZENIA<br>\r\nZagraj w Cyberpunka 2077 wzbogaconego o szereg zmian i ulepszeń m.in. w rozgrywce, ekonomii gry, lokacjach i mapie świata!\r\n', 3, 3, 0, '2020-12-10'),
(4, 'Sniper Elite 4', '214.99', 2, 1, 2, 0, 4, 4, 'Odkryj niespotykaną swobodę w największej i najbardziej zaawansowanej grze snajperskiej osadzonej w realiach II Wojny Światowej. Czekają na Ciebie taktyczne potyczki z perspektywy trzeciej osoby, różne tryby rozgrywki i epickie strzały z dystansu na gigantycznych mapach, na których będziesz wyzwalać Włochy z rąk faszystów.<br><br>\r\n\r\nAkcja gry Sniper Elite 4 rozgrywa się po wydarzeniach z wielokrotnie nagradzanej poprzedniej części. Gracze będą mieli okazję zwiedzić piękny Półwysep Apeniński — od skąpanych w słońcu miasteczek na wybrzeżu Morza Śródziemnego przez prastare lasy i górskie doliny do gigantycznych budowli nazistów.\r\n<br><br>\r\nTajny agent i strzelec wyborowy Karl Fairburne musi walczyć u boku dzielnych mężczyzn i kobiet z włoskiego ruchu oporu, aby zwalczyć nowe, przerażające niebezpieczeństwo zagrażające planowanej ofensywie alianckiej w Europie.<br>\r\nROZLEGŁA KAMPANIA<br>\r\nNa ogromnych mapach znajdziesz setki wrogów, pojazdów i wysokich rangą oficerów nazistowskich, na których będziesz polować w trakcie wielu godzin emocjonującej rozgrywki. Samodzielnie szukaj dróg do wykonania zadań, odkrywaj nowe stanowiska snajperskie i znajduj ukryte misje poboczne, przedmioty do zebrania i nie tylko!<br>\r\nNAGRADZANA MECHANIKA SNAJPERA<br>\r\nPoznaj zasady balistyki, które stały się wyznacznikiem jakości dla całego gatunku gier. Jako snajper musisz brać pod uwagę wiatr, grawitację i bicie serca, aby oddawać celne strzały na odległość setek metrów.<br>\r\nBOGATY ARSENAŁ<br>\r\nDzięki imponującemu wachlarzowi kultowych karabinów snajperskich, pistoletów, pistoletów maszynowych, broni ciężkiej, pułapek, granatów i materiałów wybuchowych z okresu II Wojny Światowej bez problemu poradzisz sobie w każdej sytuacji bojowej.<br>\r\nSZEROKIE MOŻLIWOŚCI DOSTOSOWYWANIA<br>\r\nPopraw swoją skuteczność na polu walki, ulepszając umiejętności i poprawiając współczynniki broni, takie jak powiększenie celownika optycznego, prędkość wylotowa czy stabilność. Twórz i modyfikuj własne zestawy wyposażenia dopasowane do każdej akcji.<br>', 4, 4, 18, '2017-02-14'),
(5, 'ELDEN RING', '249.00', 4, 1, 1, 0, 5, 5, 'NOWE FANTASY RPG AKCJI.<br>\r\nPowstań, zmatowieńcze. Pozwól prowadzić się łasce, by posiąść moc Eldeńskiego Kręgu i zostać władcą na Ziemiach Pomiędzy.<br><br>\r\n\r\n• Olbrzymi świat pełen ekscytujących przygód<br>\r\nRozległy świat, który płynnie łączy rozległe przestrzenie, różnorodne sytuacje oraz olbrzymie lochy ze skomplikowanymi trójwymiarowymi projektami. Jego eksploracja to radość z odkrywania nieznanego i mierzenia się z wielkimi niebezpieczeństwami, a pokonywanie tych trudności dostarcza niemałej satysfakcji.\r\n\r\n<br>• Stwórz własną postać<br>\r\nOprócz określenia wyglądu postaci możesz swobodnie wybierać broń, zbroję i magię, którymi się posługuje. Możesz także rozwijać postać w zgodzie z własnym stylem gry. Na przykład zwiększając siłę jej mięśni, stworzysz potężnego wojownika, możesz też jednak postawić na opanowanie zdolności magicznych.\r\n\r\n<br>• Epicki dramat zrodzony z mitów<br>\r\nWielowarstwowa, stopniowo odsłaniana fabuła. Epicki dramat, w którym najróżniejsze myśli postaci splatają się na Ziemiach Pomiędzy.\r\n\r\n<br>• Wyjątkowa rozgrywka online, w luźny sposób łącząca cię z innymi<br>\r\nPoza grą wieloosobową, w której możesz łączyć się bezpośrednio z innymi graczami i podróżować razem z nimi, rozgrywka zawiera też wyjątkowy asynchroniczny element sieciowy, dzięki któremu poczujesz obecność pozostałych graczy.', 5, 5, 7, '2022-02-25'),
(6, 'Wiedźmin 3: Dziki Gon', '99.99', 3, 1, 2, 0, 3, 3, 'Wiedźmin: Dziki Gon to osadzona w olśniewającym uniwersum fantasy gra RPG nowej generacji, w której nacisk położono na otwarty świat, bogatą fabułę, trudne wybory i rzeczywiste konsekwencje. W grze wcielasz się w Geralta z Rivii — zawodowego łowcę potworów, któremu powierzono zadanie odszukania dziecka z prastarej przepowiedni. Czeka na ciebie ogromny, otwarty świat pełen kupieckich miast, wysp piratów, niebezpiecznych górskich przełęczy i zapomnianych jaskiń.<br>\r\n<h2>GŁÓWNE CECHY GRY</h2>\r\nGRAJ JAKO DOSKONALE WYSZKOLONY ŁOWCA POTWORÓW<br>\r\nWiedźmini — od wczesnego dzieciństwa poddawani mutacjom i rygorystycznym treningom — cechują się nadludzkimi zdolnościami, siłą oraz refleksem. Choć nie cieszą się zaufaniem społeczeństwa, stanowią jedyną przeciwwagę dla mnogości gnębiących świat potworów.<br><br>\r\n\r\nSiej postrach wśród wrogów jako zawodowy łowca potworów uzbrojony w szereg broni, które możesz ulepszać, oraz eliksiry mutagenne i magię bojową.\r\nPoluj na różnorodne niespotykane stwory — od dzikich bestii grasujących na górskich przełęczach po magiczne drapieżniki czające się w zaułkach gęsto zaludnionych miast.<br>\r\nZapłatę wykorzystuj na ulepszanie uzbrojenia i pancerza lub wydawaj na zakłady w wyścigach konnych, grę w karty, pojedynki na pięści i inne nocne rozrywki.<br><br>\r\n\r\n\r\nWKROCZ DO OTWARTEGO, MROCZNEGO ŚWIATA FANTASY<br>\r\nOlbrzymi, otwarty świat Wiedźmina, stworzony z myślą o niekończących się przygodach, wyznacza nowe standardy w zakresie rozmiaru, głębi i złożoności.<br><br>\r\n\r\nPodróżuj przez fantastyczny otwarty świat: badaj zapomniane ruiny, jaskinie i wraki okrętów; odwiedzaj miasta, by handlować z kupcami oraz krasnoludzkimi kowalami; poluj na wielkich równinach, w górach i na morzu.<br>\r\nUtrzymuj kontakty ze zdradzieckimi generałami, przebiegłymi wiedźmami i zepsutymi członkami rodzin królewskich, by otrzymywać zlecenia na swe mroczne usługi.\r\nDokonuj wyborów wykraczających poza prosty podział na dobro i zło, a następnie mierz się z daleko idącymi konsekwencjami.<br>', 6, 6, 16, '2015-05-18'),
(7, 'Rogue Legacy 2', '89.99', 5, 1, 2, 0, 6, 6, 'Rogue Legacy 2 to dwuwymiarowa gra action-RPG z elementami roguelike wyprodukowana i wydana przez niezależne studio Cellar Door Games. Tytuł ukazał się na komputerach, gdzie początkowo dostępny był w programie Early Access, oraz konsolach Xbox One i Xbox Series.', 7, 7, 2, '2022-04-28'),
(8, 'Sekiro: Shadows Die Twice', '254.00', 4, 1, 2, 0, 7, 5, 'Znajdź własną drogę do zemsty w uznanej przez recenzentów grze studia FromSoftware, twórców serii Dark Souls.<br><br>\r\n\r\nW Sekiro™: Shadows Die Twice wcielasz się w rolę \'jednorękiego wilka\' - zhańbionego, okaleczonego wojownika, który cudem uniknął śmierci. Zobowiązany chronić młodego panicza, potomka prastarego rodu, staje się on celem wielu bezlitosnych wrogów, w tym członków klanu Ashina. Gdy panicz zostaje schwytany, nic nie powstrzyma Sekiro™ przed wyruszeniem w niebezpieczną podróż w poszukiwaniu honoru - nawet śmierć.<br><br>\r\n\r\nPoznaj Japonię okresu Sengoku z końca XVI wieku, kiedy to między życiem a śmiercią trwał nieustający konflikt, i staw czoło potężnym przeciwnikom w mrocznym, pokręconym świecie. Wykorzystaj cały arsenał śmiercionośnych narzędzi protetycznych i potężnych umiejętności ninja, przekradając się obok wrogów, przemieszczając się alternatywnymi ścieżkami i biorąc udział w krwawych walkach.<br><br>\r\n\r\nPoznaj smak zemsty. Odzyskaj honor. Nieszablonowo zadawaj śmierć.', 8, 8, 50, '2019-03-21'),
(9, 'Ready Or Not', '139.99', 6, 1, 1, 0, 8, 7, 'Ready or Not to dynamiczna, taktyczna strzelanka FPP przedstawiająca operacje współczesnych oddziałów policyjnych SWAT, które muszą neutralizować przestępców i stawiać czoła niebezpiecznym sytuacjom.\r\nRealizm przede wszystkim<br><br>\r\n\r\n\r\nStudio VOID Interactive konsultowało się z oddziałami policyjnymi na całym świecie, aby stworzyć pełen wyzwań, realistyczny system walki i punktacji. Ready or Not oferuje bezprecedensowy realizm, modelując penetrację, rozszerzanie się i pęd pocisków, rykoszety oraz fizykę kevlaru i pancerza.\r\nIntuicyjne, wygodne sterowanie<br><br>\r\n\r\n\r\nRozwinięty system obsługi broni i ruchu daje funkcjonariuszom niespotykany poziom kontroli nad sytuacją. Ready or Not wykorzystuje prosty, intuicyjny układ sterowania, który pozwala od razu wkroczyć do akcji, bez potrzeby uczenia się na pamięć dziesiątek klawiszy.<br>\r\nSystem planowania<br><br>\r\n\r\n\r\n\r\nAnalizując schematy budynków i rozkazy, przygotuj plan działania, a następnie wykonaj misję w czasie rzeczywistym. Funkcjonariusze mogą używać takich przedmiotów jak tarcze balistyczne, tarany do drzwi czy drabiny taktyczne. Oddział SWAT może także wezwać personel do pomocy, np. snajperów łub negocjatorów.', 9, 9, 50, '2021-12-18'),
(10, 'Sid Meier\'s Civilization VI', '257.99', 7, 1, 2, 0, 9, 8, 'Pierwotnym twórcą tytułu jest legendarny projektant gier, Sid Meier, a jego dzieło to turowa gra strategiczna stawiająca gracza na czele imperium, które ma pod jego wodzą przetrwać próbę czasu. Zostań władcą świata, zakładając swoją cywilizację i przewodząc jej od epoki kamienia aż po informacyjną. Tocz wojny, paraj się dyplomacją, rozwijaj kulturę i stawiaj czoła największym przywódcom historii na swojej drodze ku stworzeniu najwspanialszej cywilizacji, jaką znały wieki.<br><br>\r\n\r\nCivilization VI oferuje całkiem nowe sposoby na interakcję ze światem: teraz miasta w widoczny sposób rozprzestrzeniają się po mapie, aktywny wkład w badania technologiczne i kulturowe otwiera zupełnie nowe możliwości, a konkurujący ze sobą władcy dążą do realizacji agend opartych o przypisywane im historyczne cechy, ścigając się ku jednemu z pięciu dostępnych w grze laurów zwycięstwa.<br>\r\nBEZKRESNE IMPERIA<br>\r\nDzięki nowej mapie możesz podziwiać cuda swojego imperium w nieznany wcześniej sposób. Każde miasto rozprzestrzenia się na wiele pól, więc można kierować ich rozwojem tak, by w pełni wykorzystać otaczający je teren.<br>\r\nAKTYWNE BADANIA<br>\r\nOdblokowuj wzmocnienia przyspieszające historyczny rozwój twojej cywilizacji. Żeby dodatkowo wspierać ten proces, używaj jednostek do czynnej eksploracji, przebudowy otoczenia i odkrywania nowych kultur.<br>\r\nDYNAMICZNA DYPLOMACJA<br>\r\nNatura interakcji z innymi cywilizacjami zmienia się w trakcie gry: od pierwszych, często splamionych krwią kontaktów aż po sojusze i negocjacje w późniejszych etapach.', 10, 10, 67, '2016-10-21'),
(11, 'Fallout 76', '169.99', 3, 1, 2, 0, 10, 9, 'Bethesda Game Studios, nagradzani twórcy Skyrima i Fallouta 4, przedstawiają Fallouta 76. Dwadzieścia pięć lat po wybuchu bomb, w Dniu Powrotu roku 2102, razem z innymi mieszkańcami krypty – wybranymi spośród najwspanialszych i najbardziej inteligentnych obywateli kraju – wychodzisz na powierzchnię wprost w objęcia postnuklearnej Ameryki. Graj w pojedynkę lub z innymi graczami, przemierzając świat, wykonując zadania, budując i pokonując największe zagrożenia pustkowi. Odkrywaj ogromne obszary zniszczone wojną atomową w tej wieloosobowej odsłonie fabuły Fallout.<br><br>\r\n\r\nWyprawy: Dzióra to kolejna duża aktualizacja zawartości Fallouta 76. Wyrusz poza granice Appalachów do Dzióry – ponurego, industrialnego pustkowia targanego konfliktami i skażonego promieniowaniem. Pomożesz Unii – raczkującej grupie bojowników, którzy desperacko walczą o odzyskanie swojego domu przejętego przez żądną władzy frakcję bandytów zwanych Fanatykami. Zawiąż nowe sojusze, podejmij się nowych wyzwań i zdobądź zupełnie nowe nagrody, gdy aktualizacja Wyprawy: Dzióra trafi za darmo w ręce wszystkich grających w Fallouta 76.<br>\r\nWciągające Serie Zadań I Interesujące Postacie<br>\r\nOdkryj tajemnice Wirginii Zachodniej, rozgrywając wciągające zadanie główne, które rozpoczyna się w chwili opuszczenia Krypty 76. Zaprzyjaźnij się lub zdradź nowych sąsiadów, którzy przybyli tu, aby odbudować swój świat. Zobacz Appalachy oczami ich mieszkańców.<br>\r\nSezonowa Plansza S.c.o.r.e.<br>\r\nZaliczaj postępy w sezonie i zdobądź całkowicie bezpłatny zestaw nagród, takich jak przedmioty jednorazowe, elementy C.A.M.P. i inne, podejmując się wyzwań ograniczonych czasowo.', 11, 11, 4, '2020-04-14'),
(12, 'Resident Evil Village', '249.00', 8, 2, 2, 0, 11, 10, 'Oto survival horror, jakiego jeszcze nie było — ósma główna odsłona legendarnej serii Resident Evil, czyli Resident Evil Village.<br><br>\r\n\r\nAkcja dzieje się kilka lat po straszliwych wydarzeniach z uznanego przez krytyków Resident Evil 7 Biohazard. Zupełnie nowa opowieść rozpoczyna się, gdy Ethan Winters wraz z żoną Mią żyją sobie spokojnie w nowym miejscu, wolni od koszmaru przeszłości. Gdy budują wspólne życie, ponownie spada na nich tragedia.<br><br>\r\n\r\nCECHY<br>\r\nAkcja z perspektywy pierwszoosobowej — gracze wcielają się w Ethana Wintersa, by toczyć bezpośrednią walkę i uciekać w popłochu, widząc wszystko oczyma postaci.\r\nZnane twarze i nowi wrogowie — Chris Redfield do tej pory był pozytywnym bohaterem serii, ale jego obecności w Resident Evil Village mogą towarzyszyć mroczne pobudki. Nowi wrogowie zamieszkujący zagadkową wioskę będą bez chwili odpoczynku polować na Ethana i utrudniać mu zrozumienie nowego koszmaru, w którym się znalazł.', 12, 12, 77, '2021-05-07'),
(13, 'The Forest', '71.99', 9, 3, 1, 0, 12, 11, 'The Forest pozwala nam wejść w buty Erica Leblanca. Eric podróżuje z synem Timmym, lecz samolot, którym lecą rozbija się w gęsto zalesionej kanadyjskiej Kolumbii Brytyjskiej. Wkrótce na miejscu katastrofy zjawiają się mutanci barwach wojennych, którzy porywają Timmy’ego. W tej sytuacji główny bohater ma dwa zadania. Przede wszystkim odbić syna, ale w międzyczasie musi też przeżyć. Utrudniać mu tu będzie nie tylko miejscowa flora i fauna.<br><br>\r\n\r\nPodczas rozgrywki wydarzenia śledzimy z perspektywy pierwszej osoby. Zadaniem głównego bohatera, jak zostało powiedziane, jest przeżyć na głębokiej kanadyjskiej prowincji. W tym celu musi on konstruować schronienia, wyposażenie (w tym narzędzia i bronie), pułapki itd. Okolice zamieszkane są przez plemię żywiących się ludzkim mięsem mutantów, choć zaznaczyć warto, iż nie oznacza to, że każdy jego przedstawiciel jest do nas wrogo nastawiony. Zdarzyć się bowiem może, że niektórzy będą nas próbowali po prostu wybadać, a niekiedy nawet nawiązać kontakt. Mutanci najbardziej niebezpieczni są nocami (w The Forest zaimplementowano system zmiennych pór dnia). Gdy dochodzi do walki, zachowują się inteligentnie: próbują osłaniać rannych, gasić pochodnie (boją się wszelkiego światła), otoczyć Leblanca, chować za elementami otoczenia itd. Przeciwnicy mogą się także poddać, jeśli uznają, że są na straconej pozycji.<br><br>\r\n\r\nŚwiat The Forest jest otwarty. Gra nie posiada sztywnej struktury i podziału na misje', 13, 13, 84, '2018-04-30'),
(14, 'Red Dead Redemption 2', '249.99', 10, 1, 1, 0, 13, 12, 'Ameryka, rok 1899.<br><br>\r\n\r\nArthur Morgan i gang van der Lindego są zmuszeni uciekać. Na plecach czują oddechy agentów federalnych i najlepszych łowców nagród, więc muszą napadać, kraść i walczyć z całych sił, aby przetrwać w surowym świecie sercu Ameryki. Coraz głębsze wewnętrzne spory grożą rozłamem gangu, a Arthur musi dokonać wyboru między ideałami a lojalnością wobec ludzi, którzy go wychowali.<br><br>\r\n\r\nTeraz Red Dead Redemption 2 zawiera też dodatkową zawartość trybu fabularnego i rozbudowany tryb fotograficzny, a także bezpłatny dostęp do współdzielonego przez graczy i tętniącego życiem świata sieciowej rozgrywki Red Dead Online, gdzie gracze mogą kreować własną ścieżkę kariery w ramach jednej z wielu profesji: ścigać przestępców jako łowcy nagród, prowadzić interesy jako handlarze, odkrywać egzotyczne skarby jako kolekcjonerzy i zarządzać nielegalną gorzelnią jako bimbrownicy. A to nie wszystko.<br><br>\r\n\r\nRed Dead Redemption 2 na PC oferuje szereg graficznych i technicznych usprawnień oraz w pełni wykorzystuje moc obliczeniową komputerów, aby tchnąć życie w każdy zakątek olbrzymiego, bogatego i szczegółowego świata gry. Osiąga to dzięki większej odległości renderowania obiektów, wyższej jakości globalnego oświetlenia i okluzji otoczenia – co poprawia wygląd oświetlenia w dzień i w nocy – lepszym odbiciom i głębszym cieniom w wyższej rozdzielczości, teselacji tekstur drzew oraz poprawionym teksturom trawy i futra, dzięki czemu wszystkie rośliny i zwierzęta wyglądają niezwykle realistycznie.<br><br>\r\n\r\nRed Dead Redemption 2 na PC oferuje także obsługę standardu HDR, rozdzielczości 4K+, wielu monitorów, monitorów szerokokątnych, wyświetlania wyższej liczby klatek i nie tylko.', 14, 14, 0, '2019-12-05'),
(26, 'Hearts of Iron IV', '79.99', 7, 1, 3, 0, 17, 37, 'Zwycięstwo jest na wyciągnięcie ręki! Umiejętność poprowadzenia swojego narodu jest Twoją najpotężniejszą bronią. Gra strategiczna Hearts of Iron IV pozwala Ci przejąć kontrolę nad dowolnym państwem w czasie II wojnie światowej – największym konflikcie w dziejach ludzkości.<br><br>\r\n\r\nPoprowadzisz swój naród ku chwale, posyłając wojska w ogień bitwy, negocjując w zaciszu gabinetów i organizując wielkie inwazje. W Twoich rękach leżą losy II wojny światowej. Teraz masz szansę udowodnić, że jesteś największym wodzem, jakiego widział świat. Czy pozwolisz, by historia się powtórzyła, czy zmienisz jej bieg? Czy wpłyniesz na losy całego świata, osiągając zwycięstwo bez względu na cenę?<br>\r\nStrategiczna wojna totalna:<br>\r\nZwycięstwo w wojnie osiąga się nie tylko na polach bitew, morzach i w powietrzu, ale także w laboratoriach, fabrykach, zaciszach gabinetów, dzięki międzynarodowemu handlowi, a także podbijając serca i umysły obywateli.<br>\r\nAutentyczna symulacja wojenna w czasie rzeczywistym:<br>\r\nPozwól najwybitniejszym dowódcom II wojny światowej staczać bitwy za pomocą dostępnego wówczas sprzętu: czołgów, samolotów, okrętów, dział oraz nowoodkrytych broni masowego rażenia.<br>\r\nPrzejmij kontrolę nad dowolnym narodem:<br>\r\nWybieraj spośród mocarstw walczących o zwycięstwo lub mniejszych państw usiłujących przetrwać wojenną zawieruchę.', 16, 16, 75, '2016-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `produkt_has_tagi`
--

CREATE TABLE `produkt_has_tagi` (
  `produkt_id` smallint(5) UNSIGNED NOT NULL,
  `tagi_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produkt_has_tagi`
--

INSERT INTO `produkt_has_tagi` (`produkt_id`, `tagi_id`) VALUES
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 30),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 9),
(2, 31),
(3, 1),
(3, 10),
(3, 12),
(3, 32),
(4, 9),
(4, 13),
(4, 14),
(4, 33),
(5, 35),
(6, 1),
(6, 16),
(6, 17),
(6, 32),
(7, 18),
(7, 19),
(7, 20),
(7, 34),
(8, 21),
(8, 22),
(8, 35),
(9, 9),
(9, 23),
(9, 24),
(9, 33),
(10, 9),
(10, 25),
(10, 30),
(11, 1),
(11, 26),
(11, 27),
(11, 32),
(12, 28),
(12, 29),
(13, 1),
(13, 29),
(13, 31),
(14, 1),
(14, 14),
(14, 16),
(14, 32),
(26, 36),
(26, 37),
(26, 38),
(26, 39),
(26, 40),
(26, 41);

-- --------------------------------------------------------

--
-- Table structure for table `rabat`
--

CREATE TABLE `rabat` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `mnoznik` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rabat`
--

INSERT INTO `rabat` (`id`, `mnoznik`) VALUES
(3, '0.30'),
(2, '0.75'),
(1, '1.00');

-- --------------------------------------------------------

--
-- Table structure for table `system_operacyjny`
--

CREATE TABLE `system_operacyjny` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nazwa` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_operacyjny`
--

INSERT INTO `system_operacyjny` (`id`, `nazwa`) VALUES
(1, 'Windows 10'),
(2, 'Windows 7'),
(9, 'Windows® 7 64 Bit | Windows® 8.1 64 Bit | Windows® 10 Home 64 Bit');

-- --------------------------------------------------------

--
-- Table structure for table `tagi`
--

CREATE TABLE `tagi` (
  `id` smallint(6) NOT NULL,
  `nazwa` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tagi`
--

INSERT INTO `tagi` (`id`, `nazwa`) VALUES
(20, '2D'),
(14, 'Akcja'),
(16, 'Bogata fabuła'),
(8, 'Budowanie'),
(10, 'Cyberpunk'),
(26, 'Czarna komedia'),
(6, 'Dyplomacja'),
(28, 'FPP'),
(5, 'Gospodarka'),
(41, 'Historia alternatywna'),
(39, 'Historyczne'),
(29, 'Horror'),
(36, 'II wojna światowa'),
(27, 'Kapitalizm'),
(17, 'Klimatyczne'),
(3, 'Kooperacja'),
(18, 'Metroidvania'),
(15, 'Mroczne fantasy'),
(19, 'Niezależne'),
(22, 'Ninja'),
(1, 'Otwarty świat'),
(4, 'Parkour'),
(7, 'Polityczne'),
(24, 'Realistyczne'),
(11, 'Relaksujące'),
(34, 'Roguelite'),
(32, 'RPG'),
(12, 'Science fiction'),
(13, 'Snajper'),
(35, 'Souls-like'),
(30, 'Strategiczne'),
(37, 'Strategiczne globalne'),
(33, 'Strzelanka'),
(31, 'Survival'),
(23, 'Taktyczne'),
(21, 'Trudne'),
(25, 'Turowe'),
(9, 'Wieloosobowe'),
(38, 'Wojna'),
(40, 'Wojskowe'),
(2, 'Zombie');

-- --------------------------------------------------------

--
-- Table structure for table `ulica`
--

CREATE TABLE `ulica` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `nazwa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ulica`
--

INSERT INTO `ulica` (`id`, `nazwa`) VALUES
(6, 'Bytomsk'),
(4, 'Bytomska'),
(3, 'Fajna'),
(2, 'Fajna 5'),
(1, 'Frycza-Modrzewskiego'),
(5, 'Katowicka'),
(9, 'Plac Sikorskiego'),
(7, 'Szpaków');

-- --------------------------------------------------------

--
-- Table structure for table `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `login` varchar(30) NOT NULL,
  `haslo` varchar(65) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `email` varchar(60) NOT NULL,
  `adres_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `is_admin` enum('false','true') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uzytkownik`
--

INSERT INTO `uzytkownik` (`id`, `login`, `haslo`, `data_urodzenia`, `email`, `adres_id`, `is_admin`) VALUES
(1, 'andrzej1234', 'a29e38ab69594a22d2b80d4d9867c93b259eef948f554a03339a251db5335dd7', '2022-05-19', 'andrzej1234@gmail.com', NULL, 'false'),
(2, 'andrzej5432', '000523193d5e84c9c8cc1ee6dc60892f02ec31de5bfe24de9f335c43eca20cc3', '2022-03-03', 'andrzej5432@gmail.com', 1, 'false'),
(10, 'adamkos', 'a93a8f5e9d8d175ca4c357830c71cc045863bfbe10787dd11c1e0b4235e8650f', '2022-09-08', 'fgregkj@', NULL, 'false'),
(13, 'adam123', '8bd7fc570dd3fd5e48991d6626d43c4c2f7a250aaeba5153798ec818156e43fa', '2022-09-08', 'adam123@gmail.com', NULL, 'false'),
(15, 'adamekfex', '3875034e17855bac03a3cc9e107b1d28a9b44313d381c3335588525b4e70b55b', '2022-09-14', 'fexfe@', NULL, 'false'),
(19, 'panadres123', 'de0c8cc32df4fa34060002bddc56fdac0441f33b6285e121d8d146435fa15ef0', '2022-09-07', 'panadres123@gmail.com', 11, 'false'),
(30, 'panbezadresu123', 'e60e234eedb7528e4bd88d403ea60bba1a3f092ef9ae69e70b797fa70c40de7c', '2022-09-01', 'panbezadresu123@gmail.com', NULL, 'false'),
(31, 'admin123', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', '2022-09-07', 'admin123@gmail.com', 17, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `wydawca`
--

CREATE TABLE `wydawca` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nazwa` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wydawca`
--

INSERT INTO `wydawca` (`id`, `nazwa`) VALUES
(17, ' Paradox Interactive'),
(9, '2K'),
(7, 'Activision'),
(10, 'Bethesda Softworks'),
(11, 'CAPCOM Co.'),
(3, 'CD PROJEKT RED'),
(6, 'Cellar Door Games'),
(12, 'Endnight Games Ltd'),
(5, 'FromSoftware Inc.'),
(1, 'Funcom'),
(16, 'Paradox Interactive'),
(4, 'Rebellion'),
(13, 'Rockstar Games'),
(2, 'Techland'),
(8, 'VOID Interactive');

-- --------------------------------------------------------

--
-- Table structure for table `wymagania_sprzetowe_minimalne`
--

CREATE TABLE `wymagania_sprzetowe_minimalne` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `procesor_id` smallint(5) UNSIGNED NOT NULL,
  `karta_graficzna_id` smallint(5) UNSIGNED NOT NULL,
  `system_operacyjny_id` smallint(5) UNSIGNED NOT NULL,
  `miejsce_na_dysku_gb` smallint(5) UNSIGNED NOT NULL,
  `ilosc_gb_ram` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wymagania_sprzetowe_minimalne`
--

INSERT INTO `wymagania_sprzetowe_minimalne` (`id`, `procesor_id`, `karta_graficzna_id`, `system_operacyjny_id`, `miejsce_na_dysku_gb`, `ilosc_gb_ram`) VALUES
(1, 1, 1, 1, 4, 8),
(2, 3, 3, 1, 60, 8),
(3, 5, 5, 1, 70, 8),
(4, 7, 7, 1, 20, 4),
(5, 9, 9, 1, 60, 12),
(6, 11, 7, 1, 35, 6),
(7, 13, 12, 2, 2, 8),
(8, 15, 13, 1, 25, 4),
(9, 17, 15, 1, 50, 8),
(10, 19, 17, 1, 12, 4),
(11, 21, 19, 1, 80, 8),
(12, 23, 3, 1, 15, 8),
(13, 25, 22, 2, 5, 4),
(14, 27, 24, 1, 150, 8),
(16, 30, 45, 9, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `wymagania_sprzetowe_zalecane`
--

CREATE TABLE `wymagania_sprzetowe_zalecane` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `procesor_id` smallint(5) UNSIGNED NOT NULL,
  `karta_graficzna_id` smallint(5) UNSIGNED NOT NULL,
  `ilosc_gb_ram` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wymagania_sprzetowe_zalecane`
--

INSERT INTO `wymagania_sprzetowe_zalecane` (`id`, `procesor_id`, `karta_graficzna_id`, `ilosc_gb_ram`) VALUES
(1, 2, 2, 16),
(2, 4, 4, 16),
(3, 6, 6, 12),
(4, 8, 8, 8),
(5, 10, 10, 16),
(6, 12, 11, 8),
(7, 14, 12, 8),
(8, 16, 14, 8),
(9, 18, 16, 8),
(10, 20, 18, 8),
(11, 22, 20, 8),
(12, 24, 21, 16),
(13, 26, 23, 4),
(14, 28, 25, 12),
(16, 29, 46, 6);

-- --------------------------------------------------------

--
-- Table structure for table `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `adres_id` mediumint(8) UNSIGNED NOT NULL,
  `uzytkownik_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `adres_id`, `uzytkownik_id`) VALUES
(32, 11, 19),
(33, 11, 19),
(34, 11, 19);

-- --------------------------------------------------------

--
-- Table structure for table `zamowienia_has_produkt`
--

CREATE TABLE `zamowienia_has_produkt` (
  `zamowienia_id` mediumint(8) UNSIGNED NOT NULL,
  `produkt_id` smallint(5) UNSIGNED NOT NULL,
  `ilosc_produktu` tinyint(3) UNSIGNED NOT NULL,
  `cena` decimal(8,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zamowienia_has_produkt`
--

INSERT INTO `zamowienia_has_produkt` (`zamowienia_id`, `produkt_id`, `ilosc_produktu`, `cena`) VALUES
(32, 12, 2, '186.75'),
(33, 12, 1, '186.75'),
(34, 12, 2, '186.75');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adres`
--
ALTER TABLE `adres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_adres_ulica1_idx` (`ulica_id`),
  ADD KEY `fk_adres_miasto1_idx` (`miasto_id`);

--
-- Indexes for table `gatunek`
--
ALTER TABLE `gatunek`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`);

--
-- Indexes for table `karta_graficzna`
--
ALTER TABLE `karta_graficzna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`) USING HASH;

--
-- Indexes for table `miasto`
--
ALTER TABLE `miasto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `platforma`
--
ALTER TABLE `platforma`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`);

--
-- Indexes for table `procesor`
--
ALTER TABLE `procesor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`) USING HASH;

--
-- Indexes for table `producent`
--
ALTER TABLE `producent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`);

--
-- Indexes for table `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`),
  ADD UNIQUE KEY `opis_UNIQUE` (`opis`) USING HASH,
  ADD KEY `fk_produkt_gatunek_idx` (`gatunek_id`),
  ADD KEY `fk_produkt_platforma1_idx` (`platforma_id`),
  ADD KEY `fk_produkt_rabat1_idx` (`rabat_id`),
  ADD KEY `fk_produkt_wydawca1_idx` (`wydawca_id`),
  ADD KEY `fk_produkt_producent1_idx` (`producent_id`),
  ADD KEY `fk_produkt_wymagania_sprzetowe_minimalne1_idx` (`wymagania_sprzetowe_minimalne_id`),
  ADD KEY `fk_produkt_wymagania_sprzetowe_zalecane1_idx` (`wymagania_sprzetowe_zalecane_id`);

--
-- Indexes for table `produkt_has_tagi`
--
ALTER TABLE `produkt_has_tagi`
  ADD PRIMARY KEY (`produkt_id`,`tagi_id`),
  ADD KEY `fk_produkt_has_tagi_tagi1_idx` (`tagi_id`),
  ADD KEY `fk_produkt_has_tagi_produkt1_idx` (`produkt_id`);

--
-- Indexes for table `rabat`
--
ALTER TABLE `rabat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `mnoznik_UNIQUE` (`mnoznik`);

--
-- Indexes for table `system_operacyjny`
--
ALTER TABLE `system_operacyjny`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`) USING HASH;

--
-- Indexes for table `tagi`
--
ALTER TABLE `tagi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`);

--
-- Indexes for table `ulica`
--
ALTER TABLE `ulica`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`);

--
-- Indexes for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_uzytkownik_adres1_idx` (`adres_id`);

--
-- Indexes for table `wydawca`
--
ALTER TABLE `wydawca`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`);

--
-- Indexes for table `wymagania_sprzetowe_minimalne`
--
ALTER TABLE `wymagania_sprzetowe_minimalne`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_wymagania_sprzetowe_minimalne_procesor1_idx` (`procesor_id`),
  ADD KEY `fk_wymagania_sprzetowe_minimalne_karta_graficzna1_idx` (`karta_graficzna_id`),
  ADD KEY `fk_wymagania_sprzetowe_minimalne_system_operacyjny1_idx` (`system_operacyjny_id`);

--
-- Indexes for table `wymagania_sprzetowe_zalecane`
--
ALTER TABLE `wymagania_sprzetowe_zalecane`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_wymagania_sprzetowe_zalecane_procesor1_idx` (`procesor_id`),
  ADD KEY `fk_wymagania_sprzetowe_zalecane_karta_graficzna1_idx` (`karta_graficzna_id`);

--
-- Indexes for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_zamowienia_adres1_idx` (`adres_id`),
  ADD KEY `fk_zamowienia_uzytkownik1_idx` (`uzytkownik_id`);

--
-- Indexes for table `zamowienia_has_produkt`
--
ALTER TABLE `zamowienia_has_produkt`
  ADD PRIMARY KEY (`zamowienia_id`,`produkt_id`),
  ADD KEY `fk_zamowienia_has_produkt_zamowienia1_idx` (`zamowienia_id`),
  ADD KEY `produkt_id` (`produkt_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adres`
--
ALTER TABLE `adres`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `gatunek`
--
ALTER TABLE `gatunek`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `karta_graficzna`
--
ALTER TABLE `karta_graficzna`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `miasto`
--
ALTER TABLE `miasto`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `platforma`
--
ALTER TABLE `platforma`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `procesor`
--
ALTER TABLE `procesor`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `producent`
--
ALTER TABLE `producent`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `produkt`
--
ALTER TABLE `produkt`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `rabat`
--
ALTER TABLE `rabat`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_operacyjny`
--
ALTER TABLE `system_operacyjny`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tagi`
--
ALTER TABLE `tagi`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `ulica`
--
ALTER TABLE `ulica`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wydawca`
--
ALTER TABLE `wydawca`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `wymagania_sprzetowe_minimalne`
--
ALTER TABLE `wymagania_sprzetowe_minimalne`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `wymagania_sprzetowe_zalecane`
--
ALTER TABLE `wymagania_sprzetowe_zalecane`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adres`
--
ALTER TABLE `adres`
  ADD CONSTRAINT `fk_adres_miasto1` FOREIGN KEY (`miasto_id`) REFERENCES `miasto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_adres_ulica1` FOREIGN KEY (`ulica_id`) REFERENCES `ulica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `produkt`
--
ALTER TABLE `produkt`
  ADD CONSTRAINT `fk_produkt_gatunek` FOREIGN KEY (`gatunek_id`) REFERENCES `gatunek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produkt_platforma1` FOREIGN KEY (`platforma_id`) REFERENCES `platforma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produkt_producent1` FOREIGN KEY (`producent_id`) REFERENCES `producent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produkt_rabat1` FOREIGN KEY (`rabat_id`) REFERENCES `rabat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produkt_wydawca1` FOREIGN KEY (`wydawca_id`) REFERENCES `wydawca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produkt_wymagania_sprzetowe_minimalne1` FOREIGN KEY (`wymagania_sprzetowe_minimalne_id`) REFERENCES `wymagania_sprzetowe_minimalne` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produkt_wymagania_sprzetowe_zalecane1` FOREIGN KEY (`wymagania_sprzetowe_zalecane_id`) REFERENCES `wymagania_sprzetowe_zalecane` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `produkt_has_tagi`
--
ALTER TABLE `produkt_has_tagi`
  ADD CONSTRAINT `fk_produkt_has_tagi_produkt1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produkt_has_tagi_tagi1` FOREIGN KEY (`tagi_id`) REFERENCES `tagi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD CONSTRAINT `fk_uzytkownik_adres1` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `wymagania_sprzetowe_minimalne`
--
ALTER TABLE `wymagania_sprzetowe_minimalne`
  ADD CONSTRAINT `fk_wymagania_sprzetowe_minimalne_karta_graficzna1` FOREIGN KEY (`karta_graficzna_id`) REFERENCES `karta_graficzna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_wymagania_sprzetowe_minimalne_procesor1` FOREIGN KEY (`procesor_id`) REFERENCES `procesor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_wymagania_sprzetowe_minimalne_system_operacyjny1` FOREIGN KEY (`system_operacyjny_id`) REFERENCES `system_operacyjny` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `wymagania_sprzetowe_zalecane`
--
ALTER TABLE `wymagania_sprzetowe_zalecane`
  ADD CONSTRAINT `fk_wymagania_sprzetowe_zalecane_karta_graficzna1` FOREIGN KEY (`karta_graficzna_id`) REFERENCES `karta_graficzna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_wymagania_sprzetowe_zalecane_procesor1` FOREIGN KEY (`procesor_id`) REFERENCES `procesor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `fk_zamowienia_adres1` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_zamowienia_uzytkownik1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `zamowienia_has_produkt`
--
ALTER TABLE `zamowienia_has_produkt`
  ADD CONSTRAINT `fk_zamowienia_has_produkt_produkt1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_zamowienia_has_produkt_zamowienia1` FOREIGN KEY (`zamowienia_id`) REFERENCES `zamowienia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `zamowienia_has_produkt_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
