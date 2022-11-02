import 'dart:io';
import 'dart:typed_data';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:open_document/open_document.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_flutter/home_page.dart';



class PdfServices {
  Future<Uint8List> createdTestHello(
    double nomor,
    String tanggal,
    String namaPT,
    int npwp,
    String picUser,
    String picPosition,
    String contact,
    String email,
    int totalEmployee,
    int diskon,
    String keterangan1,
    int hargaTrining,
    int diskonTrining,
    String keterangan2,
    int hargaImplementasi,
    int diskonImplementasi,
    String keterangan3,
    int hargaModifikasi,
    int diskonModifikasi,
    String keterangan4,
    String emailSales,
    String billingPic,
    String billingAddress,
    String billingContact,
    String billingEmail,
  ) {
    final pdf = pw.Document();

    var total = (totalEmployee >= 1000)
        ? totalEmployee * 5500
        : (totalEmployee >= 500)
            ? totalEmployee * 7000
            : (totalEmployee >= 350)
                ? totalEmployee * 8500
                : (totalEmployee >= 200)
                    ? totalEmployee * 15000
                    : (totalEmployee >= 50)
                        ? totalEmployee * 18000
                        : (totalEmployee >= 25)
                            ? totalEmployee * 20000
                            : 0;
    var hargaPerKaryawan = total / totalEmployee;
    var setelahDiskon = total - (total * diskon / 100);
    var hargaTrinings = hargaTrining - (hargaTrining * diskon / 100);
    var hargaImplementasis =
        hargaImplementasi - (hargaImplementasi * diskon / 100);
    var hargaModifikasis = hargaModifikasi - (hargaModifikasi * diskon / 100);


    pdf.addPage(
      pw.Page(build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Text(
              nomor.toString(),
            ),
            pw.Text(tanggal),
            pw.Text(namaPT),
            pw.Text(npwp.toString()),
            pw.Text(picUser),
            pw.Text(picPosition),
            pw.Text(contact),
            pw.Text(email),
            pw.Text(totalEmployee.toString()),
            pw.Text(diskon.toString()),
            pw.Text(keterangan1),
            pw.Text(hargaTrining.toString()),
            pw.Text(diskonTrining.toString()),
            pw.Text(keterangan2),
            pw.Text(hargaImplementasi.toString()),
            pw.Text(diskonImplementasi.toString()),
            pw.Text(keterangan3),
            pw.Text(hargaModifikasi.toString()),
            pw.Text(diskonModifikasi.toString()),
            pw.Text(keterangan4),
            pw.Text(emailSales),
            pw.Text(billingPic),
            pw.Text(billingAddress),
            pw.Text(billingContact),
            pw.Text(billingEmail),
            pw.Text("Total Harga = $total"),
            pw.Text("Total Perkaryawan = $hargaPerKaryawan"),
            pw.Text("Total Setelah Diskon = $setelahDiskon"),
            pw.Text("Total Harga Trining = $hargaTrinings"),
            pw.Text("Total Harga Implementasi = $hargaImplementasis"),
            pw.Text("Total Harga Modifikasi = $hargaModifikasis"),
          ],
        );
      }),
    );
    return pdf.save();
  }

  static Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenFile.open(filePath);
  }
}
