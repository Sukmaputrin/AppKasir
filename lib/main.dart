import 'package:aplikasi_1/src/kasir/pembayaran.dart';
import 'package:aplikasi_1/src/kasir/transaksi.dart';
import 'package:aplikasi_1/src/menu.dart';
import 'package:aplikasi_1/src/tentang.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //untuk menghilangkan tulisan debug di atas aplikasi
      home: Menu(), //menampikan dashboard menu sebagai layar utama
      //inisialisasi routes di dalam aplikasi untuk berpindah halaman
      routes: {
        '/tentang': (context) => AboutMe(), //menu tentang untuk menampilkan menu about me
        '/transaksi': (context) => TransaksiKasir(), //menu transaksi untuk menampilkan menu transaksi
        '/bayar': (context) => Pembayaran(namaBarang: null, harga: null, jmlBeli: null, totalBelanja: null), //menu bayar untuk menampilkan menu pembayaran
      },
    );
  }
}