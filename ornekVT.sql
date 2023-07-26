-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 12 Eki 2015, 21:44:42
-- Sunucu sürümü: 5.6.17
-- PHP Sürümü: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `ornekVT`
--
CREATE DATABASE IF NOT EXISTS `ornekVT` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ornekVT`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calisanlar`
--

CREATE TABLE IF NOT EXISTS `calisanlar` (
  `cKod` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  `pozisyon` varchar(255) DEFAULT NULL,
  `cinsiyet` char(1) DEFAULT NULL,
  `subeKod` int(11) NOT NULL,
  `maas` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`cKod`),
  KEY `fk_calisanlar_subeler1` (`subeKod`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Tablo döküm verisi `calisanlar`
--

INSERT INTO `calisanlar` (`cKod`, `ad`, `soyad`, `pozisyon`, `cinsiyet`, `subeKod`, `maas`) VALUES
(1, 'Naci', 'Kurt', 'Yönetici', 'E', 1, 3000),
(2, 'Hakan', 'Kavak', 'Müdür', 'E', 2, 2400),
(3, 'Mutlu', 'Can', 'Müdür', 'E', 3, 2000),
(4, 'Engin', 'Mert', 'Müşteri Temsilcisi', 'E', 3, 1300),
(5, 'Nuray', 'Duman', 'Müşteri Temsilcisi', 'K', 1, 1450),
(6, 'Aslan', 'KAHVE', 'Müşteri Temsilcisi', 'E', 2, 1300),
(7, 'İnci', 'BOZ', NULL, 'K', 1, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kiralikemlak`
--

CREATE TABLE IF NOT EXISTS `kiralikemlak` (
  `emlakKod` int(11) NOT NULL,
  `adresi` varchar(255) DEFAULT NULL,
  `tipi` varchar(255) DEFAULT NULL,
  `oda` tinyint(4) unsigned DEFAULT NULL,
  `kirasi` int(11) unsigned DEFAULT NULL,
  `temsilci` int(11) NOT NULL,
  PRIMARY KEY (`emlakKod`),
  KEY `fk_kiralikEmlak_calisanlar` (`temsilci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kiralikemlak`
--

INSERT INTO `kiralikemlak` (`emlakKod`, `adresi`, `tipi`, `oda`, `kirasi`, `temsilci`) VALUES
(1, 'Kadıköy', 'Daire', 2, 400, 1),
(7, 'Çengelköy', 'Daire', 2, 500, 1),
(11, 'Altunizade', 'Dubleks', 5, 900, 2),
(15, 'Üsküdar', 'Daire', 3, 750, 5),
(23, 'Ataşehir', 'Villa', 3, 1200, 3),
(34, 'Moda', 'Villa', 4, 1200, 3),
(52, 'Şile', 'Villa', 4, 800, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notlar`
--

CREATE TABLE IF NOT EXISTS `notlar` (
  `ogrNo` int(11) NOT NULL,
  `dersNo` int(11) NOT NULL,
  `vize` int(11) NOT NULL,
  `final` int(11) NOT NULL,
  `notu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `notlar`
--

INSERT INTO `notlar` (`ogrNo`, `dersNo`, `vize`, `final`, `notu`) VALUES
(20, 10, 100, 80, 88),
(20, 11, 80, 75, 77),
(21, 10, 60, 40, 48),
(21, 11, 75, 80, 78),
(25, 10, 80, 30, 50),
(20, 10, 100, 80, 88),
(20, 11, 80, 75, 77),
(21, 10, 60, 40, 48),
(21, 11, 75, 80, 78),
(25, 10, 80, 30, 50);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `satilikemlak`
--

CREATE TABLE IF NOT EXISTS `satilikemlak` (
  `emlakKod` int(11) NOT NULL,
  `adresi` varchar(255) DEFAULT NULL,
  `tipi` varchar(255) DEFAULT NULL,
  `oda` tinyint(4) DEFAULT NULL,
  `fiyati` int(11) DEFAULT NULL,
  `temsilci` int(11) NOT NULL,
  PRIMARY KEY (`emlakKod`),
  KEY `fk_kiralikEmlak_calisanlar` (`temsilci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `satilikemlak`
--

INSERT INTO `satilikemlak` (`emlakKod`, `adresi`, `tipi`, `oda`, `fiyati`, `temsilci`) VALUES
(1, 'Kadıköy', 'Daire', 2, 400000, 1),
(11, 'Altunizade', 'Dubleks', 5, 900000, 2),
(15, 'Üsküdar', 'Daire', 3, 175000, 5),
(24, 'Ataşehir', 'Villa', 5, 250000, 3),
(36, 'Moda', 'Daire', 2, 120000, 6),
(52, 'Şile', 'Villa', 4, 80000, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis`
--

CREATE TABLE IF NOT EXISTS `siparis` (
  `uyeKod` int(11) NOT NULL,
  `dogTarihi` date NOT NULL,
  `sipTarihi` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `siparis`
--

INSERT INTO `siparis` (`uyeKod`, `dogTarihi`, `sipTarihi`) VALUES
(101, '1999-12-10', '2010-05-09 07:57:11'),
(98, '1990-01-01', '2010-05-08 17:57:11'),
(65, '1985-12-10', '2010-05-07 12:00:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subeler`
--

CREATE TABLE IF NOT EXISTS `subeler` (
  `subeKod` int(11) NOT NULL AUTO_INCREMENT,
  `adres` varchar(255) DEFAULT NULL,
  `ilce` varchar(255) DEFAULT NULL,
  `il` varchar(255) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subeKod`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Tablo döküm verisi `subeler`
--

INSERT INTO `subeler` (`subeKod`, `adres`, `ilce`, `il`, `telefon`) VALUES
(1, 'Rıhtım Cad. No: 23', 'Kadıköy', 'İSTANBUL', '2165551234'),
(2, 'Büyük Sok. No: 6', 'Maltepe', 'İSTANBUL', '2165554567'),
(3, 'Cumhuriyet Cad. No:1', 'Üsküdar', 'İSTANBUL', '2165559875');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tatiller`
--

CREATE TABLE IF NOT EXISTS `tatiller` (
  `calisanKod` int(11) NOT NULL,
  `calistigiYil` int(11) NOT NULL,
  `toplamTatil` int(11) NOT NULL,
  PRIMARY KEY (`calisanKod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tatiller`
--

INSERT INTO `tatiller` (`calisanKod`, `calistigiYil`, `toplamTatil`) VALUES
(1, 25, 360),
(2, 15, 320),
(3, 10, 100),
(4, 9, 200),
(5, 3, 90),
(6, 1, 15),
(7, 0, 0);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `calisanlar`
--
ALTER TABLE `calisanlar`
  ADD CONSTRAINT `fk_calisanlar_subeler1` FOREIGN KEY (`subeKod`) REFERENCES `subeler` (`subeKod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `kiralikemlak`
--
ALTER TABLE `kiralikemlak`
  ADD CONSTRAINT `fk_kiralikEmlak_calisanlar` FOREIGN KEY (`temsilci`) REFERENCES `calisanlar` (`cKod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `satilikemlak`
--
ALTER TABLE `satilikemlak`
  ADD CONSTRAINT `satilikemlak_ibfk_1` FOREIGN KEY (`temsilci`) REFERENCES `calisanlar` (`cKod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `tatiller`
--
ALTER TABLE `tatiller`
  ADD CONSTRAINT `tatiller_ibfk_1` FOREIGN KEY (`calisanKod`) REFERENCES `calisanlar` (`cKod`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
