-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 13 Eki 2018, 05:48:03
-- Sunucu sürümü: 5.7.19
-- PHP Sürümü: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kitaplik`
--
CREATE DATABASE IF NOT EXISTS `kitaplik` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `kitaplik`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitap`
--

DROP TABLE IF EXISTS `kitap`;
CREATE TABLE IF NOT EXISTS `kitap` (
  `isbn` varchar(20) NOT NULL,
  `baslik` varchar(255) NOT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kitap`
--

INSERT INTO `kitap` (`isbn`, `baslik`) VALUES
('9786053607069', 'Tarih Boyunca İlim ve Din'),
('9786054455331', 'Engelsizsiniz'),
('9786054607754', 'Engeller Sona Ersin'),
('9786054729005', 'Fang Ailesi'),
('9789750511127', 'Berci Kristin Çöp Masalları'),
('9789752115385', 'Bitmemiş Portre'),
('9789752115736', 'Şahidin Gözleri'),
('9789754344172', 'Hasta Öyküler ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitapyazarlari`
--

DROP TABLE IF EXISTS `kitapyazarlari`;
CREATE TABLE IF NOT EXISTS `kitapyazarlari` (
  `isbn` varchar(20) NOT NULL,
  `yazarkodu` int(11) NOT NULL,
  PRIMARY KEY (`isbn`,`yazarkodu`),
  KEY `yazarkodu` (`yazarkodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kitapyazarlari`
--

INSERT INTO `kitapyazarlari` (`isbn`, `yazarkodu`) VALUES
('9786054455331', 2),
('9786054607754', 2),
('9789752115385', 3),
('9789752115736', 3),
('9786053607069', 4),
('9789754344172', 5),
('9786054729005', 7);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oduncalinan`
--

DROP TABLE IF EXISTS `oduncalinan`;
CREATE TABLE IF NOT EXISTS `oduncalinan` (
  `uyeKod` int(11) NOT NULL,
  `alimtarihi` date NOT NULL,
  `teslimtarihi` date DEFAULT NULL,
  `isbn` varchar(20) NOT NULL,
  PRIMARY KEY (`uyeKod`,`alimtarihi`,`isbn`),
  KEY `uyeKod` (`uyeKod`),
  KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `oduncalinan`
--

INSERT INTO `oduncalinan` (`uyeKod`, `alimtarihi`, `teslimtarihi`, `isbn`) VALUES
(1, '2012-03-06', '2012-04-02', '9789750511127'),
(3, '2012-11-09', NULL, '9789752115736'),
(5, '2012-10-22', '2012-11-01', '9789754344172'),
(5, '2012-11-01', '2012-11-09', '9789754344172'),
(6, '2012-11-02', '2012-11-05', '9789750511127'),
(10, '2012-10-08', '2012-11-02', '9786053607069'),
(10, '2012-11-04', NULL, '9789752115736'),
(11, '2012-10-10', '2012-10-21', '9789752115736');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

DROP TABLE IF EXISTS `uyeler`;
CREATE TABLE IF NOT EXISTS `uyeler` (
  `uyeKod` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  `meslek` varchar(255) DEFAULT NULL,
  `ilce` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uyeKod`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`uyeKod`, `ad`, `soyad`, `meslek`, `ilce`) VALUES
(1, 'Ali', 'Aktan', 'Öğrenci', 'Beykoz'),
(2, 'Zeki', 'Sahaf', 'Kasap', 'Üsküdar'),
(3, 'Kahraman', 'Fakir', 'Öğretmen', 'Kadıköy'),
(4, 'Zeynep', 'Önal', 'Serbest Meslek', 'Çekmeköy'),
(5, 'Ali', 'Keser', 'Öğrenci', 'Kartal'),
(6, 'Niyazi', 'Yetenekli', 'Öğretmen', 'Kadıköy'),
(7, 'Ülkü', 'Gömlekci', 'Diş Hekimi', 'Kadıköy'),
(8, 'Metin', 'Orman', NULL, 'Fatih'),
(9, 'Canan', 'AS', 'Öğretmen', 'Maltepe'),
(10, 'Şükrü', 'Vefa', NULL, 'Kadıköy'),
(11, 'İlker', 'Gözcü', 'Öğretmen', 'Ümraniye'),
(12, 'Hakan', 'Kazak', NULL, 'Üsküdar'),
(13, 'Serdar', 'Durmaz', 'Tercüman', 'Bahçelievler');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

DROP TABLE IF EXISTS `yazar`;
CREATE TABLE IF NOT EXISTS `yazar` (
  `kod` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `yazar`
--

INSERT INTO `yazar` (`kod`, `ad`, `soyad`) VALUES
(1, 'Demet', 'Altınyeleklioğlu'),
(2, 'Ersin', 'Ata'),
(3, 'Agatha', 'Christie'),
(4, 'A. Adnan', 'Adıvar'),
(5, 'Gökçe', 'Parlakyıldız'),
(6, 'Latife', 'Tekin'),
(7, 'Kevin', 'Wilson'),
(8, 'Behiç', 'Ak'),
(9, 'Ömer', 'Özbek');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `kitapyazarlari`
--
ALTER TABLE `kitapyazarlari`
  ADD CONSTRAINT `kitapyazarlari_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `kitap` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kitapyazarlari_ibfk_2` FOREIGN KEY (`yazarkodu`) REFERENCES `yazar` (`kod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `oduncalinan`
--
ALTER TABLE `oduncalinan`
  ADD CONSTRAINT `oduncalinan_ibfk_1` FOREIGN KEY (`uyeKod`) REFERENCES `uyeler` (`uyeKod`),
  ADD CONSTRAINT `oduncalinan_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `kitap` (`isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
