-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 07 Kas 2016, 11:31:22
-- Sunucu sürümü: 5.6.17
-- PHP Sürümü: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `sotel`
--
CREATE DATABASE IF NOT EXISTS `sotel` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sotel`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kalis`
--

CREATE TABLE IF NOT EXISTS `kalis` (
  `odaNo` int(11) NOT NULL,
  `musKod` int(11) NOT NULL,
  `tarih` date NOT NULL,
  PRIMARY KEY (`odaNo`,`musKod`,`tarih`),
  KEY `fk_oda_has_musteri_musteri1_idx` (`musKod`),
  KEY `fk_oda_has_musteri_oda_idx` (`odaNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kalis`
--

INSERT INTO `kalis` (`odaNo`, `musKod`, `tarih`) VALUES
(101, 10, '2016-11-01'),
(106, 13, '2016-11-05'),
(203, 13, '2016-10-30'),
(102, 14, '2016-11-08'),
(104, 14, '2016-11-01');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri`
--

CREATE TABLE IF NOT EXISTS `musteri` (
  `kod` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  `dogTarihi` date NOT NULL,
  `cinsiyet` char(1) DEFAULT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Tablo döküm verisi `musteri`
--

INSERT INTO `musteri` (`kod`, `ad`, `soyad`, `dogTarihi`, `cinsiyet`) VALUES
(10, 'Ece', 'Yıldız', '1990-12-02', 'K'),
(11, 'Mahmut', 'Türk', '1975-10-10', 'E'),
(12, 'Hakan', 'Kızıl', '1980-05-14', 'E'),
(13, 'Derya', 'Tunç', '1997-04-25', NULL),
(14, 'Olcay', 'Yeşil', '1960-01-01', NULL),
(15, 'Hikmet', 'Tanınmış', '1970-06-03', 'E'),
(16, 'Yaşar', 'Yaşar', '1956-02-18', NULL),
(17, 'Deniz', 'Kaya', '1988-08-18', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oda`
--

CREATE TABLE IF NOT EXISTS `oda` (
  `numara` int(11) NOT NULL,
  `kapasitesi` int(11) NOT NULL,
  `tipi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`numara`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `oda`
--

INSERT INTO `oda` (`numara`, `kapasitesi`, `tipi`) VALUES
(101, 2, 'Normal'),
(102, 2, 'Suit'),
(103, 4, 'Aile'),
(104, 2, 'Normal'),
(105, 5, 'Aile'),
(106, 3, 'Suit'),
(107, 2, 'Normal'),
(201, 5, 'Aile'),
(202, 3, 'Suit'),
(203, 4, 'Suit');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `telefon`
--

CREATE TABLE IF NOT EXISTS `telefon` (
  `musKod` int(11) NOT NULL,
  `telefon` varchar(45) NOT NULL,
  PRIMARY KEY (`musKod`,`telefon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `telefon`
--

INSERT INTO `telefon` (`musKod`, `telefon`) VALUES
(10, '5550001'),
(10, '5550002'),
(12, '5550003'),
(13, '5550004'),
(14, '555005'),
(16, '5550006');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `kalis`
--
ALTER TABLE `kalis`
  ADD CONSTRAINT `fk_oda_has_musteri_oda` FOREIGN KEY (`odaNo`) REFERENCES `oda` (`numara`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_oda_has_musteri_musteri1` FOREIGN KEY (`musKod`) REFERENCES `musteri` (`kod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `telefon`
--
ALTER TABLE `telefon`
  ADD CONSTRAINT `fk_telefon_musteri1` FOREIGN KEY (`musKod`) REFERENCES `musteri` (`kod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
