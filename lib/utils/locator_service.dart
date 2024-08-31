// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/// `LocatorService` adalah kelas yang mengelola izin lokasi,
/// mendapatkan posisi saat ini, dan memeriksa apakah pengguna berada
/// dalam jarak tertentu dari titik yang ditentukan.
class LocatorService {
  // Variabel untuk menyimpan posisi saat ini.
  static Position? _currentPosition;

  /// Fungsi untuk menangani izin lokasi.
  /// Menampilkan pesan kepada pengguna jika layanan lokasi tidak diaktifkan
  /// atau izin lokasi ditolak.
  ///
  /// Mengembalikan nilai `true` jika izin lokasi diberikan, dan `false` jika ditolak.
  static Future<bool> handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Memeriksa apakah layanan lokasi diaktifkan atau tidak.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Menampilkan pesan kepada pengguna jika layanan lokasi tidak diaktifkan.
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }

    // Memeriksa status izin lokasi saat ini.
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Meminta izin lokasi jika belum diberikan.
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Menampilkan pesan jika izin lokasi ditolak.
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }

    // Menangani kasus di mana izin lokasi ditolak secara permanen.
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  /// Fungsi untuk mendapatkan posisi saat ini pengguna dengan akurasi tinggi.
  /// Jika izin lokasi diberikan, posisi saat ini akan disimpan dalam variabel `currentPosition`.
  ///
  /// Menampilkan log dengan koordinat latitude dan longitude posisi saat ini.
  Future<Position?> getCurrentPosition(BuildContext context) async {
    // Memeriksa apakah izin lokasi telah diberikan.
    final hasPermission = await handleLocationPermission(context);
    if (!hasPermission) return null;

    // Mendapatkan posisi saat ini dengan akurasi tinggi.
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      // Menyimpan posisi saat ini kedalam variabel `currentPosition`.
      _currentPosition = position;
    }).catchError((e) {
      // Menampilkan kesalahan jika terjadi masalah saat mendapatkan posisi.
      debugPrint(e);
    });
    return _currentPosition;
  }
}
