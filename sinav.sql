-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 02 Kas 2017, 13:01:53
-- Sunucu sürümü: 5.7.19
-- PHP Sürümü: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `sinav`
--
CREATE DATABASE IF NOT EXISTS `sinav` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sinav`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cevap`
--

DROP TABLE IF EXISTS `cevap`;
CREATE TABLE IF NOT EXISTS `cevap` (
  `soruKod` int(11) NOT NULL,
  `ogrenciNo` int(11) NOT NULL,
  `metin` text NOT NULL,
  `cevaplamaZamani` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`soruKod`,`ogrenciNo`),
  KEY `fk_soru_has_ogrenci_ogrenci1_idx` (`ogrenciNo`),
  KEY `fk_soru_has_ogrenci_soru1_idx` (`soruKod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `cevap`
--

INSERT INTO `cevap` (`soruKod`, `ogrenciNo`, `metin`, `cevaplamaZamani`) VALUES
(1, 102, 'yaşlı', '2017-10-23 06:45:01'),
(2, 104, 'Türkiye', '2017-11-01 06:45:01'),
(2, 106, 'Ege', '2017-10-31 06:45:01'),
(3, 108, 'Evet', '2017-10-29 06:45:01'),
(5, 103, '40', '2017-08-31 06:45:01'),
(6, 107, 'Yeşilay', '2017-10-31 06:45:01'),
(7, 101, 'Toprak Kayması', '2017-10-01 06:45:01');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ders`
--

DROP TABLE IF EXISTS `ders`;
CREATE TABLE IF NOT EXISTS `ders` (
  `kod` int(11) NOT NULL AUTO_INCREMENT,
  `etiket` varchar(255) NOT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ders`
--

INSERT INTO `ders` (`kod`, `etiket`) VALUES
(1, 'Türkçe'),
(2, 'Matematik'),
(3, 'Fen Bilimleri'),
(4, 'Sosyal Bilgiler'),
(5, 'Din Kültürü ve Ahlak Bilgisi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrenci`
--

DROP TABLE IF EXISTS `ogrenci`;
CREATE TABLE IF NOT EXISTS `ogrenci` (
  `numara` int(11) NOT NULL,
  `ad` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  `sinifsube` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numara`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ogrenci`
--

INSERT INTO `ogrenci` (`numara`, `ad`, `soyad`, `sinifsube`) VALUES
(101, 'Doğan', 'Demirel', '4C'),
(102, 'Engin', 'Bilgili', '4A'),
(103, 'Doğa', 'Sarı', '4B'),
(104, 'Asker', 'Dilmen', '4A'),
(105, 'Ece', 'Gazi', NULL),
(106, 'Ege', 'Ulu', '4C'),
(107, 'Nihan', 'Sır', '4B'),
(108, 'Oya', 'Süslü', '4C'),
(109, 'Linet', 'Sürgün', '4A'),
(110, 'Ödül Armağan', 'Mutlu', '4B'),
(111, 'Özge', 'Yakın', '4A'),
(112, 'Sena', 'Seren', '4B'),
(113, 'Ali', 'Kahraman', '4C');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogretmen`
--

DROP TABLE IF EXISTS `ogretmen`;
CREATE TABLE IF NOT EXISTS `ogretmen` (
  `kod` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  `cinsiyet` char(1) DEFAULT NULL,
  `gorevbaslangictarihi` date DEFAULT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ogretmen`
--

INSERT INTO `ogretmen` (`kod`, `ad`, `soyad`, `cinsiyet`, `gorevbaslangictarihi`) VALUES
(1, 'Emir', 'Sarp', 'E', '2010-10-25'),
(2, 'Ali', 'Çağlar', 'E', '2004-05-10'),
(3, 'Esra', 'Yiğit', 'K', '1998-12-01'),
(4, 'Ayhan Atakan', 'Önder', NULL, NULL),
(5, 'Bilge', 'Bulut', 'K', NULL),
(6, 'Caner', 'Tekin', NULL, '1999-12-30'),
(7, 'Davut Ekrem', 'Sönmez', NULL, '2011-01-20'),
(8, 'Zeynep Sare', 'Tunç', 'K', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `soru`
--

DROP TABLE IF EXISTS `soru`;
CREATE TABLE IF NOT EXISTS `soru` (
  `kod` int(11) NOT NULL AUTO_INCREMENT,
  `metin` text NOT NULL,
  `dersKod` int(11) NOT NULL,
  `sorusoran` int(11) NOT NULL,
  `olusturmaZamani` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`kod`),
  KEY `fk_soru_ders_idx` (`dersKod`),
  KEY `fk_soru_ogretmen1_idx` (`sorusoran`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `soru`
--

INSERT INTO `soru` (`kod`, `metin`, `dersKod`, `sorusoran`, `olusturmaZamani`) VALUES
(1, '\"Yaşlı at koşarak kaçtı\" cümlesinde sıfat olan kelimeyi yazınız. ', 1, 3, '2017-10-21 06:42:36'),
(2, 'Özel isme bir örnek veriniz.', 1, 5, '2017-10-31 06:42:36'),
(3, 'Kalem bir özel isim midir?', 1, 4, '2017-10-28 06:42:36'),
(4, 'Alanı 4 metrekare olan kare ile kısa kenarı, karenin bir kenarına eşit olan bir dikdörtgen yapılacaktır. Dikdörtgenin uzun kenarı 22 m olduğuna göre bu dikdörtgen için kaç adet kare gereklidir?', 2, 5, '2017-10-03 06:42:36'),
(5, '6 m eninde, 12 m boyunda bir bahçenin içine 4 m eninde 6 m boyunda bir kulübe yapıldığında geriye kalan alan kaç metrekaredir ', 2, 2, '2017-08-20 06:42:36'),
(6, 'Bağımlılık yapan maddelere karşı bireyleri korumak için kurulan birlik hangisidir?', 4, 8, '2017-10-31 06:42:36'),
(7, 'Doğal afete bir örnek veriniz.', 4, 6, '2017-01-31 06:42:36');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `cevap`
--
ALTER TABLE `cevap`
  ADD CONSTRAINT `fk_soru_has_ogrenci_ogrenci1` FOREIGN KEY (`ogrenciNo`) REFERENCES `ogrenci` (`numara`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_soru_has_ogrenci_soru1` FOREIGN KEY (`soruKod`) REFERENCES `soru` (`kod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `soru`
--
ALTER TABLE `soru`
  ADD CONSTRAINT `fk_soru_ders` FOREIGN KEY (`dersKod`) REFERENCES `ders` (`kod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_soru_ogretmen1` FOREIGN KEY (`sorusoran`) REFERENCES `ogretmen` (`kod`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
