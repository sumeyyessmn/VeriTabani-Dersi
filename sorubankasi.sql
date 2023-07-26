-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 07 Eki 2019, 09:10:01
-- Sunucu sürümü: 5.7.26
-- PHP Sürümü: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `sorubankasi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `secenek`
--

DROP TABLE IF EXISTS `secenek`;
CREATE TABLE IF NOT EXISTS `secenek` (
  `kod` int(11) NOT NULL,
  `metin` text NOT NULL,
  `sorKod` int(11) NOT NULL,
  PRIMARY KEY (`kod`),
  KEY `sorKod` (`sorKod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `secenek`
--

INSERT INTO `secenek` (`kod`, `metin`, `sorKod`) VALUES
(1, 'Yeşil', 1),
(2, 'Mavi', 1),
(3, 'Sarı', 1),
(4, 'Gri', 1),
(5, 'Evet', 2),
(6, 'Hayır', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `secim`
--

DROP TABLE IF EXISTS `secim`;
CREATE TABLE IF NOT EXISTS `secim` (
  `kulAdi` varchar(255) NOT NULL,
  `secKod` int(11) NOT NULL,
  PRIMARY KEY (`kulAdi`,`secKod`),
  KEY `secKod` (`secKod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `secim`
--

INSERT INTO `secim` (`kulAdi`, `secKod`) VALUES
('afranur', 2),
('hbekleyen', 4),
('afranur', 5),
('hbekleyen', 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `soru`
--

DROP TABLE IF EXISTS `soru`;
CREATE TABLE IF NOT EXISTS `soru` (
  `kod` int(11) NOT NULL,
  `metin` text NOT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `soru`
--

INSERT INTO `soru` (`kod`, `metin`) VALUES
(1, 'Duvarın rengi nedir?'),
(2, 'Turuncuyu sever misiniz ?');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uye`
--

DROP TABLE IF EXISTS `uye`;
CREATE TABLE IF NOT EXISTS `uye` (
  `kulAdi` varchar(255) NOT NULL,
  `sifre` varchar(255) NOT NULL,
  `eposta` varchar(255) NOT NULL,
  `ad` varchar(255) NOT NULL,
  `ikinciad` varchar(255) DEFAULT NULL,
  `soyad` varchar(255) NOT NULL,
  PRIMARY KEY (`kulAdi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `uye`
--

INSERT INTO `uye` (`kulAdi`, `sifre`, `eposta`, `ad`, `ikinciad`, `soyad`) VALUES
('afranur', '1234', 'afra@gmail.com', 'Afra', 'Nur', 'Vatansever'),
('hbekleyen', '123', 'hbekleyen@gmail.com', 'Haluk', NULL, 'Bekleyen');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `secenek`
--
ALTER TABLE `secenek`
  ADD CONSTRAINT `secenek_ibfk_1` FOREIGN KEY (`sorKod`) REFERENCES `soru` (`kod`);

--
-- Tablo kısıtlamaları `secim`
--
ALTER TABLE `secim`
  ADD CONSTRAINT `secim_ibfk_1` FOREIGN KEY (`kulAdi`) REFERENCES `uye` (`kulAdi`),
  ADD CONSTRAINT `secim_ibfk_2` FOREIGN KEY (`secKod`) REFERENCES `secenek` (`kod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
