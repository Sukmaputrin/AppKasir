import 'package:flutter/material.dart';

class Pembayaran extends StatefulWidget {

  //inisialisasi variabel penampung
  final String namaBarang;
  final double harga;
  final int jmlBeli;
  final int totalBelanja;

  //menampung data yang dikirim dari layar transaksi yang nantinya akan ditampilkan menggunakan variabel widget.
  Pembayaran({Key key, @required this.namaBarang,
    @required this.harga,
    @required this.jmlBeli,
    @required this.totalBelanja}) : super(key: key);

  @override
  State createState() => PembayaranState();


}

class PembayaranState extends State<Pembayaran> {

  bool error = false; //inisialisasi error false
  int uangBayar = 0, uangKembalian = 0; //inisialisasi variable untuk menampung data pembayaran dan kembalian

  //fungsi untuk menghitung uang kembalian
  void totalKembalian() {
    setState(() {
      uangKembalian = uangBayar - widget.totalBelanja; //variabel widget didapat dari layar transaksi yang sudah didapat sebelumnya
    });
    //cek apakah total pembayaran lebih kecil dari total belanja, jika kurang dari itu, maka error menjadi true
    if (uangBayar < widget.totalBelanja){
      error = true;
    }else{
      error = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Color(0xffe91e63),title: Center(child: Text("Pembayaran"))),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(child: Text(
                    "Kamu membeli ${widget.namaBarang} sebanyak ${widget.jmlBeli} buah dengan total belanja sebesar Rp. ${widget.totalBelanja}", style: TextStyle(
                      fontSize:21,
                      color: Colors.red
                  ),
                  )),
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                    child: TextField(
                      onChanged: (txt) {
                        setState(() {
                          uangBayar = int.parse(txt);
                        });
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 15,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                          labelText: "Uang Bayar",
                          //suffix: Text('qty'),
                          border:  OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(10.0)),
                          //filled: true,
                          hintText: 'Uang Bayar'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                          color: Color(0xffe91e63),
                          child: Text(
                            "Bayar",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: totalKembalian),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),

                      //cek apakah error false, jika false tampilkan uang kembalian, jika true tampilkan uang kurang
                      error== false ?
                      Text(
                        "Kembalian anda : Rp. $uangKembalian",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xffe91e63),
                            fontWeight: FontWeight.bold),
                      ) :
                      Text(
                        "Uang anda kurang!",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xffe91e63),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
