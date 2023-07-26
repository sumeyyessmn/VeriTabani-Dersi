-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 07 Eki 2019, 09:09:51
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
-- Veritabanı: `twitter`
--
CREATE DATABASE IF NOT EXISTS `twitter` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `twitter`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `resim`
--

DROP TABLE IF EXISTS `resim`;
CREATE TABLE IF NOT EXISTS `resim` (
  `kod` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `baslik` varchar(255) NOT NULL,
  `detay` text NOT NULL,
  `yukleyen` int(11) NOT NULL,
  PRIMARY KEY (`kod`),
  UNIQUE KEY `yukleyen` (`yukleyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `resim`
--

INSERT INTO `resim` (`kod`, `url`, `baslik`, `detay`, `yukleyen`) VALUES
(1, 'ahmetf.jpg', 'Ahmet Satıcı', 'Marmara', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reyting`
--

DROP TABLE IF EXISTS `reyting`;
CREATE TABLE IF NOT EXISTS `reyting` (
  `uyeKod` int(11) NOT NULL,
  `resimKod` int(11) NOT NULL,
  PRIMARY KEY (`uyeKod`,`resimKod`),
  KEY `resimKod` (`resimKod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `reyting`
--

INSERT INTO `reyting` (`uyeKod`, `resimKod`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uye`
--

DROP TABLE IF EXISTS `uye`;
CREATE TABLE IF NOT EXISTS `uye` (
  `kod` int(11) NOT NULL,
  `isim` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  `dogTarihi` date NOT NULL,
  `kullaniciAdi` varchar(255) NOT NULL,
  `sifre` char(40) NOT NULL,
  `eposta` varchar(255) NOT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `uye`
--

INSERT INTO `uye` (`kod`, `isim`, `soyad`, `dogTarihi`, `kullaniciAdi`, `sifre`, `eposta`) VALUES
(1, 'Aleyna', 'Can', '2019-10-07', 'aley', '1234', 'aley@gmail.com'),
(2, 'Ahmet Feyzi', 'Satıcı', '2019-10-01', 'ahmet', '4321', 'ahmet@gmail.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorum`
--

DROP TABLE IF EXISTS `yorum`;
CREATE TABLE IF NOT EXISTS `yorum` (
  `uyeKod` int(11) NOT NULL,
  `resimKod` int(11) NOT NULL,
  `yorum` text NOT NULL,
  `zaman` timestamp NOT NULL,
  PRIMARY KEY (`zaman`,`uyeKod`,`resimKod`),
  KEY `resimKod` (`resimKod`),
  KEY `yorum_ibfk_2` (`uyeKod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `yorum`
--

INSERT INTO `yorum` (`uyeKod`, `resimKod`, `yorum`, `zaman`) VALUES
(2, 1, 'güzel', '2019-10-05 21:00:00'),
(2, 1, 'harika', '2019-10-06 21:00:00');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `resim`
--
ALTER TABLE `resim`
  ADD CONSTRAINT `resim_ibfk_1` FOREIGN KEY (`yukleyen`) REFERENCES `uye` (`kod`);

--
-- Tablo kısıtlamaları `reyting`
--
ALTER TABLE `reyting`
  ADD CONSTRAINT `reyting_ibfk_1` FOREIGN KEY (`resimKod`) REFERENCES `resim` (`kod`),
  ADD CONSTRAINT `reyting_ibfk_2` FOREIGN KEY (`uyeKod`) REFERENCES `uye` (`kod`);

--
-- Tablo kısıtlamaları `yorum`
--
ALTER TABLE `yorum`
  ADD CONSTRAINT `yorum_ibfk_1` FOREIGN KEY (`resimKod`) REFERENCES `resim` (`kod`),
  ADD CONSTRAINT `yorum_ibfk_2` FOREIGN KEY (`uyeKod`) REFERENCES `uye` (`kod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
