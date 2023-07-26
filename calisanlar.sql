-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 02 Kas 2015, 21:00:50
-- Sunucu sürümü: 5.6.17
-- PHP Sürümü: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `calisanlar`
--
CREATE DATABASE IF NOT EXISTS `calisanlar` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `calisanlar`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calisan`
--

CREATE TABLE IF NOT EXISTS `calisan` (
  `Kod` int(11) NOT NULL AUTO_INCREMENT,
  `dogTarihi` date DEFAULT NULL,
  `ad` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  `cinsiyet` char(1) NOT NULL,
  `basTarihi` date NOT NULL,
  PRIMARY KEY (`Kod`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Tablo döküm verisi `calisan`
--

INSERT INTO `calisan` (`Kod`, `dogTarihi`, `ad`, `soyad`, `cinsiyet`, `basTarihi`) VALUES
(1, '1965-04-14', 'Mustafa', 'Kelek', 'E', '1985-10-01'),
(2, '1963-06-11', 'Demet', 'Piyon', 'K', '1989-08-24'),
(3, '1972-12-24', 'Mustafa', 'Savaş', 'E', '1992-01-26'),
(4, '1960-08-09', 'Jale', 'Reis', 'K', '1990-06-20'),
(5, '1980-09-19', 'Yusuf', 'Tavas', 'E', '2000-10-20'),
(6, '1981-11-02', 'Harun', 'Peynir', 'E', '2000-08-30'),
(7, '1965-01-03', 'Hamdi', 'Mor', 'E', '1986-07-15'),
(8, '1958-02-15', 'Burhan', 'Lamba', 'E', '1988-06-06'),
(9, '1965-07-29', 'İrem', 'İstanbullu', 'K', '1989-08-13'),
(10, '1972-05-21', 'Bekir', 'Nemli', 'E', '1999-01-11'),
(11, '1965-06-15', 'Gülay', 'Şimşek', 'K', '1998-10-01'),
(12, '1980-08-09', 'Hakan', 'Alev', 'E', '2001-09-24'),
(13, '1975-01-02', 'Yunus', 'Misina', 'E', '2006-03-07'),
(14, '1989-04-20', 'Mahmut', 'Molla', 'E', '2005-09-11'),
(15, NULL, 'Naci', 'Mantar', 'E', '2003-12-01'),
(16, '1973-03-25', 'Danyal', 'Uludağ', 'E', '2004-08-06'),
(17, '1980-09-02', 'Mustafa', 'Hediye', 'E', '2002-02-16'),
(18, '1972-02-28', 'Haldun', 'Zehir', 'E', '2006-11-27'),
(19, '1986-02-23', 'Nevin', 'Erez', 'K', '2009-06-10'),
(20, '1986-11-01', 'Hilmi', 'Dağcı', 'E', '2008-10-13'),
(21, '1989-08-01', 'Emine', 'Şeker', 'K', '2009-07-15'),
(22, '1986-01-23', 'Şerif', 'Akıllı', 'E', '2009-05-11'),
(23, '1985-04-15', 'Turgut', 'Demir', 'E', '2007-12-09'),
(24, '1992-12-20', 'Rahim', 'Zorel', 'E', '2012-05-26'),
(25, '1987-06-03', 'Harun', 'Koç', 'E', '2008-06-27'),
(26, '1983-03-07', 'Ahmet', 'Ulupınar', 'E', '2009-03-07'),
(27, NULL, 'Mikail', 'Şurup', 'E', '2012-01-30'),
(28, '1974-11-19', 'Tahir', 'Erdem', 'E', '2014-05-18'),
(29, '1981-02-01', 'Ziya', 'Peron', 'E', '2014-09-05'),
(30, '1994-05-14', 'Sadık', 'Kemer', 'E', '2014-09-18'),
(31, '1986-03-04', 'Hediye', 'Kendir', 'K', '2015-01-20'),
(32, NULL, 'Menekşe', 'Gemici', 'K', '2015-10-10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `departman`
--

CREATE TABLE IF NOT EXISTS `departman` (
  `Kod` char(4) NOT NULL,
  `ad` varchar(255) NOT NULL,
  PRIMARY KEY (`Kod`),
  UNIQUE KEY `ad` (`ad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `departman`
--

INSERT INTO `departman` (`Kod`, `ad`) VALUES
('d008', 'Araştırma'),
('d005', 'Geliştirme'),
('d003', 'İnsan Kaynakları'),
('d006', 'Kalite Kontrol'),
('d002', 'Muhasebe'),
('d009', 'Müşteri Temsilciliği'),
('d001', 'Pazarlama'),
('d007', 'Satış'),
('d004', 'Üretim');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `depcalisan`
--

CREATE TABLE IF NOT EXISTS `depcalisan` (
  `calKod` int(11) NOT NULL,
  `depKod` char(4) NOT NULL,
  `basTarihi` date NOT NULL,
  `bitTarihi` date NOT NULL,
  PRIMARY KEY (`calKod`,`depKod`),
  KEY `depKod` (`depKod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `depcalisan`
--

INSERT INTO `depcalisan` (`calKod`, `depKod`, `basTarihi`, `bitTarihi`) VALUES
(1, 'd001', '1985-10-01', '9999-12-31'),
(2, 'd004', '1989-08-24', '2010-08-30'),
(3, 'd005', '1992-01-26', '9999-12-31'),
(4, 'd004', '1990-06-20', '9999-12-31'),
(5, 'd008', '2000-10-20', '9999-10-31'),
(6, 'd009', '2000-08-30', '9999-12-31'),
(7, 'd001', '1986-07-15', '2001-07-16'),
(8, 'd002', '1988-06-06', '2008-06-01'),
(9, 'd003', '1989-08-13', '1999-01-31'),
(10, 'd003', '1999-01-11', '9999-12-31'),
(11, 'd004', '1998-10-01', '9999-12-31'),
(12, 'd006', '2001-09-24', '9999-12-31'),
(13, 'd002', '2006-03-07', '9999-12-31'),
(14, 'd007', '2005-09-11', '9999-12-31'),
(15, 'd005', '2012-12-01', '9999-12-31'),
(16, 'd001', '2004-08-06', '9999-12-31'),
(17, 'd007', '2002-02-16', '2012-03-31'),
(18, 'd007', '2006-11-27', '2010-01-01'),
(19, 'd002', '2009-06-10', '9999-12-31'),
(20, 'd007', '2008-10-13', '9999-12-31'),
(21, 'd003', '2009-07-15', '9999-12-31'),
(22, 'd006', '2009-05-11', '2009-12-31'),
(23, 'd004', '2007-12-09', '9999-12-31'),
(24, 'd005', '2012-05-26', '9999-12-31'),
(25, 'd006', '2008-06-27', '9999-12-31'),
(26, 'd001', '2009-03-07', '2014-12-31'),
(27, 'd007', '2012-01-30', '9999-12-31'),
(28, 'd007', '2014-05-18', '9999-12-31'),
(29, 'd009', '2014-09-05', '9999-12-31'),
(30, 'd001', '2014-09-18', '9999-12-31'),
(31, 'd007', '2015-01-20', '9999-12-31'),
(32, 'd007', '2015-10-10', '9999-12-31');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `depyonetici`
--

CREATE TABLE IF NOT EXISTS `depyonetici` (
  `calKod` int(11) NOT NULL,
  `depKod` char(4) NOT NULL,
  `basTarihi` date NOT NULL,
  `bitTarihi` date NOT NULL,
  PRIMARY KEY (`calKod`,`depKod`),
  KEY `depKod` (`depKod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `depyonetici`
--

INSERT INTO `depyonetici` (`calKod`, `depKod`, `basTarihi`, `bitTarihi`) VALUES
(1, 'd001', '1985-10-01', '9999-12-31'),
(2, 'd004', '1989-08-24', '2010-08-30'),
(3, 'd005', '1992-01-26', '9999-12-31'),
(5, 'd008', '2000-10-20', '9999-12-31'),
(6, 'd009', '2000-08-30', '9999-12-31'),
(8, 'd002', '1988-06-06', '2008-06-01'),
(9, 'd003', '1989-08-13', '1999-01-31'),
(10, 'd003', '1999-01-31', '9999-12-31'),
(12, 'd006', '2001-09-24', '9999-12-31'),
(13, 'd002', '2008-06-02', '9999-12-31'),
(14, 'd007', '2012-03-31', '9999-12-31'),
(17, 'd007', '2002-02-16', '2012-03-31'),
(23, 'd004', '2010-08-30', '9999-12-31');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `unvan`
--

CREATE TABLE IF NOT EXISTS `unvan` (
  `calKod` int(11) NOT NULL,
  `unvan` varchar(255) NOT NULL,
  `basTarihi` date NOT NULL,
  `bitTarihi` date DEFAULT NULL,
  PRIMARY KEY (`calKod`,`unvan`,`basTarihi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `unvan`
--

INSERT INTO `unvan` (`calKod`, `unvan`, `basTarihi`, `bitTarihi`) VALUES
(1, 'Şef', '1985-10-01', '9999-12-31'),
(2, 'Usta', '1989-08-24', '2010-08-30'),
(3, 'Baş Mühendis', '1992-01-26', '9999-12-31'),
(4, 'İşçi', '1990-06-20', '2000-06-20'),
(4, 'Usta', '2000-06-20', '9999-12-31'),
(5, 'Baş Mühendis', '2000-10-20', '9999-12-31'),
(6, 'Şef', '2000-08-30', '9999-12-31'),
(7, 'İşçi', '1986-07-15', '1996-07-15'),
(7, 'Uzman', '1996-07-15', '2001-07-16'),
(8, 'Şef', '1988-06-06', '2008-06-01'),
(9, 'Şef', '1989-08-13', '1999-01-31'),
(10, 'İşçi', '1999-01-11', '1999-01-31'),
(10, 'Şef', '1999-01-31', '9999-12-31'),
(11, 'İşçi', '1998-10-01', '2008-10-01'),
(11, 'Usta', '2008-10-01', '9999-12-31'),
(12, 'Baş Mühendis', '2001-09-24', '9999-12-31'),
(13, 'İşçi', '2006-03-07', '2008-06-02'),
(13, 'Şef', '2008-06-02', '9999-12-31'),
(14, 'İşçi', '2005-09-11', '2008-06-02'),
(14, 'Şef', '2008-06-02', '9999-12-31'),
(15, 'Mühendis', '2003-12-01', '2013-12-01'),
(15, 'Uzman Mühendis', '2013-12-01', '9999-12-31'),
(16, 'İşçi', '2004-08-06', '2014-08-06'),
(16, 'Uzman', '2014-08-06', '9999-12-31'),
(17, 'Şef', '2002-02-16', '2012-03-31'),
(18, 'İşçi', '2006-11-27', '9999-12-31'),
(19, 'İşçi', '2009-06-10', '9999-12-31'),
(20, 'İşçi', '2008-10-13', '9999-12-31'),
(21, 'İşçi', '2009-07-15', '9999-12-31'),
(22, 'Mühendis', '2009-05-11', '9999-12-31'),
(23, 'Baş Usta', '2010-08-30', '9999-12-31'),
(23, 'İşçi', '2007-12-09', '2010-08-30'),
(24, 'Mühendis', '2012-05-26', '9999-12-31'),
(25, 'Mühendis', '2008-06-27', '9999-12-31'),
(26, 'İşçi', '2009-03-07', '9999-12-31'),
(27, 'İşçi', '2012-01-30', '9999-12-31'),
(28, 'İşçi', '2014-05-18', '9999-12-31'),
(29, 'İşçi', '2014-09-05', '9999-12-31'),
(30, 'İşçi', '2014-09-18', '9999-12-31'),
(31, 'İşçi', '2015-01-20', '9999-12-31'),
(32, 'İşçi', '2015-10-10', '9999-12-31');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `depcalisan`
--
ALTER TABLE `depcalisan`
  ADD CONSTRAINT `depcalisan_ibfk_1` FOREIGN KEY (`calKod`) REFERENCES `calisan` (`Kod`) ON DELETE CASCADE,
  ADD CONSTRAINT `depcalisan_ibfk_2` FOREIGN KEY (`depKod`) REFERENCES `departman` (`Kod`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `depyonetici`
--
ALTER TABLE `depyonetici`
  ADD CONSTRAINT `depyonetici_ibfk_1` FOREIGN KEY (`calKod`) REFERENCES `calisan` (`Kod`) ON DELETE CASCADE,
  ADD CONSTRAINT `depyonetici_ibfk_2` FOREIGN KEY (`depKod`) REFERENCES `departman` (`Kod`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `unvan`
--
ALTER TABLE `unvan`
  ADD CONSTRAINT `unvan_ibfk_1` FOREIGN KEY (`calKod`) REFERENCES `calisan` (`Kod`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
