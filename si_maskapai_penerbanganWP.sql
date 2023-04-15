-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Apr 2023 pada 23.16
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_maskapai_penerbangan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bobotnilai`
--

CREATE TABLE `tb_bobotnilai` (
  `id_bobotNilai` int(11) NOT NULL,
  `id_pesawat` int(11) NOT NULL,
  `bobot_NilaiFasilitas` int(11) NOT NULL,
  `bobot_NilaiHarga` int(11) NOT NULL,
  `bobot_NilaiPelayanan` int(11) NOT NULL,
  `bobot_NilaiKualitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_maskapai`
--

CREATE TABLE `tb_maskapai` (
  `id_maskapai` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `kode_maskapai` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilaifasilitas`
--

CREATE TABLE `tb_nilaifasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `id_pesawat` int(11) NOT NULL,
  `nilai_KriteriaFasilitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilaiharga`
--

CREATE TABLE `tb_nilaiharga` (
  `id_harga` int(11) NOT NULL,
  `id_pesawat` int(11) NOT NULL,
  `nilai_KriteriaHarga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilaikualitas`
--

CREATE TABLE `tb_nilaikualitas` (
  `id_kualitas` int(11) NOT NULL,
  `id_pesawat` int(11) NOT NULL,
  `nilai_KriteriaKualitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilaipelayanan`
--

CREATE TABLE `tb_nilaipelayanan` (
  `id_pelayanan` int(11) NOT NULL,
  `id_pesawat` int(11) NOT NULL,
  `nilai_KriteriaPelayanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penilaian`
--

CREATE TABLE `tb_penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `id_pesawat` int(11) NOT NULL,
  `id_fasilitas` int(11) NOT NULL,
  `id_harga` int(11) NOT NULL,
  `id_pelayanan` int(11) NOT NULL,
  `id_kualitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_perangkingan`
--

CREATE TABLE `tb_perangkingan` (
  `id_perangkingan` int(11) NOT NULL,
  `id_pesawat` int(11) NOT NULL,
  `nilai_vektor_S` int(11) NOT NULL,
  `nilai_vektor_V` int(11) NOT NULL,
  `rangking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesawat`
--

CREATE TABLE `tb_pesawat` (
  `id_pesawat` int(11) NOT NULL,
  `id_maskapai` int(11) NOT NULL,
  `nama_pesawat` varchar(40) NOT NULL,
  `tanggal_pembuatan` date NOT NULL,
  `tanggal operasional` date NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tiket`
--

CREATE TABLE `tb_tiket` (
  `id_tiket` int(11) NOT NULL,
  `id_pesawat` int(11) NOT NULL,
  `tanggal_pesan` date NOT NULL,
  `rute` varchar(40) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_bobotnilai`
--
ALTER TABLE `tb_bobotnilai`
  ADD PRIMARY KEY (`id_bobotNilai`),
  ADD KEY `id_pesawat` (`id_pesawat`);

--
-- Indeks untuk tabel `tb_maskapai`
--
ALTER TABLE `tb_maskapai`
  ADD PRIMARY KEY (`id_maskapai`);

--
-- Indeks untuk tabel `tb_nilaifasilitas`
--
ALTER TABLE `tb_nilaifasilitas`
  ADD PRIMARY KEY (`id_fasilitas`),
  ADD KEY `id_pesawat` (`id_pesawat`);

--
-- Indeks untuk tabel `tb_nilaiharga`
--
ALTER TABLE `tb_nilaiharga`
  ADD PRIMARY KEY (`id_harga`),
  ADD KEY `id_pesawat` (`id_pesawat`);

--
-- Indeks untuk tabel `tb_nilaikualitas`
--
ALTER TABLE `tb_nilaikualitas`
  ADD PRIMARY KEY (`id_kualitas`),
  ADD KEY `id_pesawat` (`id_pesawat`);

--
-- Indeks untuk tabel `tb_nilaipelayanan`
--
ALTER TABLE `tb_nilaipelayanan`
  ADD PRIMARY KEY (`id_pelayanan`),
  ADD KEY `id_pesawat` (`id_pesawat`);

--
-- Indeks untuk tabel `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  ADD PRIMARY KEY (`id_penilaian`),
  ADD KEY `id_pesawat` (`id_pesawat`),
  ADD KEY `id_fasilitas` (`id_fasilitas`),
  ADD KEY `id_harga` (`id_harga`),
  ADD KEY `id_kualitas` (`id_kualitas`),
  ADD KEY `id_pelayanan` (`id_pelayanan`);

--
-- Indeks untuk tabel `tb_perangkingan`
--
ALTER TABLE `tb_perangkingan`
  ADD PRIMARY KEY (`id_perangkingan`),
  ADD KEY `id_pesawat` (`id_pesawat`);

--
-- Indeks untuk tabel `tb_pesawat`
--
ALTER TABLE `tb_pesawat`
  ADD PRIMARY KEY (`id_pesawat`),
  ADD KEY `id_maskapai` (`id_maskapai`);

--
-- Indeks untuk tabel `tb_tiket`
--
ALTER TABLE `tb_tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `id_pesawat` (`id_pesawat`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_bobotnilai`
--
ALTER TABLE `tb_bobotnilai`
  ADD CONSTRAINT `tb_bobotnilai_ibfk_1` FOREIGN KEY (`id_pesawat`) REFERENCES `tb_pesawat` (`id_pesawat`);

--
-- Ketidakleluasaan untuk tabel `tb_nilaifasilitas`
--
ALTER TABLE `tb_nilaifasilitas`
  ADD CONSTRAINT `tb_nilaifasilitas_ibfk_1` FOREIGN KEY (`id_pesawat`) REFERENCES `tb_pesawat` (`id_pesawat`);

--
-- Ketidakleluasaan untuk tabel `tb_nilaiharga`
--
ALTER TABLE `tb_nilaiharga`
  ADD CONSTRAINT `tb_nilaiharga_ibfk_1` FOREIGN KEY (`id_pesawat`) REFERENCES `tb_pesawat` (`id_pesawat`);

--
-- Ketidakleluasaan untuk tabel `tb_nilaikualitas`
--
ALTER TABLE `tb_nilaikualitas`
  ADD CONSTRAINT `tb_nilaikualitas_ibfk_1` FOREIGN KEY (`id_pesawat`) REFERENCES `tb_pesawat` (`id_pesawat`);

--
-- Ketidakleluasaan untuk tabel `tb_nilaipelayanan`
--
ALTER TABLE `tb_nilaipelayanan`
  ADD CONSTRAINT `tb_nilaipelayanan_ibfk_1` FOREIGN KEY (`id_pesawat`) REFERENCES `tb_pesawat` (`id_pesawat`);

--
-- Ketidakleluasaan untuk tabel `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  ADD CONSTRAINT `tb_penilaian_ibfk_1` FOREIGN KEY (`id_pesawat`) REFERENCES `tb_pesawat` (`id_pesawat`),
  ADD CONSTRAINT `tb_penilaian_ibfk_2` FOREIGN KEY (`id_fasilitas`) REFERENCES `tb_nilaifasilitas` (`id_fasilitas`),
  ADD CONSTRAINT `tb_penilaian_ibfk_3` FOREIGN KEY (`id_harga`) REFERENCES `tb_nilaiharga` (`id_harga`),
  ADD CONSTRAINT `tb_penilaian_ibfk_4` FOREIGN KEY (`id_kualitas`) REFERENCES `tb_nilaikualitas` (`id_kualitas`),
  ADD CONSTRAINT `tb_penilaian_ibfk_5` FOREIGN KEY (`id_pelayanan`) REFERENCES `tb_nilaipelayanan` (`id_pelayanan`);

--
-- Ketidakleluasaan untuk tabel `tb_perangkingan`
--
ALTER TABLE `tb_perangkingan`
  ADD CONSTRAINT `tb_perangkingan_ibfk_1` FOREIGN KEY (`id_pesawat`) REFERENCES `tb_pesawat` (`id_pesawat`);

--
-- Ketidakleluasaan untuk tabel `tb_pesawat`
--
ALTER TABLE `tb_pesawat`
  ADD CONSTRAINT `tb_pesawat_ibfk_1` FOREIGN KEY (`id_maskapai`) REFERENCES `tb_maskapai` (`id_maskapai`);

--
-- Ketidakleluasaan untuk tabel `tb_tiket`
--
ALTER TABLE `tb_tiket`
  ADD CONSTRAINT `tb_tiket_ibfk_1` FOREIGN KEY (`id_pesawat`) REFERENCES `tb_pesawat` (`id_pesawat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
