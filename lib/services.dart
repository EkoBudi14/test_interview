// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:intl/intl.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:open_document/open_document.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:test_flutter/home_page.dart';
import 'package:test_flutter/model.dart';

class PdfServices {
  Future<Uint8List> createdTestHello(Quatation quatation) {
    final pdf = pw.Document();

    var total = (quatation.totalEmployee >= 1000)
        ? quatation.totalEmployee * 5500
        : (quatation.totalEmployee >= 500)
            ? quatation.totalEmployee * 7000
            : (quatation.totalEmployee >= 350)
                ? quatation.totalEmployee * 8500
                : (quatation.totalEmployee >= 200)
                    ? quatation.totalEmployee * 15000
                    : (quatation.totalEmployee >= 50)
                        ? quatation.totalEmployee * 18000
                        : (quatation.totalEmployee >= 25)
                            ? quatation.totalEmployee * 20000
                            : 0;
    var hargaPerKaryawan = total / quatation.totalEmployee;
    var setelahDiskon = total - (total * quatation.diskon / 100);
    var hargaTrinings = quatation.hargaTrining -
        (quatation.hargaTrining * quatation.diskonTrining / 100);
    var hargaImplementasis = quatation.hargaImplementasi -
        (quatation.hargaImplementasi * quatation.diskonImplementasi / 100);
    var hargaModifikasis = quatation.hargaModifikasi -
        (quatation.hargaModifikasi * quatation.diskonModifikasi / 100);

    final f = new DateFormat('yyyy-MM-dd');
    final headers = [
      'Deskripsi',
      'Total / harga',
      'Diskon',
      'Keterangan',
    ];

    pdf.addPage(
      pw.Page(build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'Quotation',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "No :" + quatation.nomor.toString(),
                    ),
                    pw.Text("Tanggal : " + quatation.tanggal,
                        // ignore: prefer_const_constructors
                        style: pw.TextStyle(
                          fontSize: 13,
                        )),
                    pw.Text("Nama PT : " + quatation.namaPT,
                        style: pw.TextStyle(
                          fontSize: 13,
                        )),
                    pw.Text("NPWP : " + quatation.npwp.toString(),
                        style: pw.TextStyle(
                          fontSize: 13,
                        )),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Pic User : " + quatation.picUser,
                    ),
                    pw.Text("Pic Position : " + quatation.picPosition,
                        // ignore: prefer_const_constructors
                        style: pw.TextStyle(
                          fontSize: 13,
                        )),
                    pw.Text("Kontak : " + quatation.contact,
                        style: pw.TextStyle(
                          fontSize: 13,
                        )),
                    pw.Text("Email : " + quatation.email,
                        style: pw.TextStyle(
                          fontSize: 13,
                        )),
                  ],
                ),
              ],
            ),
            pw.SizedBox(
              height: 30,
            ),
            pw.Row(children: [
              pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Billing PIC:" + quatation.billingPic,
                    style: pw.TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  pw.Text(
                    "Billing Address : " + quatation.billingAddress,
                    // ignore: prefer_const_constructors
                    style: pw.TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  pw.Text(
                    "Billing Contact : " + quatation.billingContact,
                    style: pw.TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  pw.Text(
                    "Billing Email : " + quatation.billingEmail,
                    style: pw.TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  pw.Text(
                    "Email Sales : " + quatation.emailSales,
                    style: pw.TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ]),
            // pw.SizedBox(
            //   height: 13,
            // ),
            // pw.Divider(
            //   height: 2,
            //   thickness: 2,
            //   color: PdfColors.black,
            // ),
            pw.SizedBox(
              height: 15,
            ),
            pw.Table.fromTextArray(
              headers: headers,
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration: pw.BoxDecoration(color: PdfColors.grey),
              cellHeight: 30,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
                3: pw.Alignment.centerRight,
              },
              data: [
                [
                  'Total Employee',
                  quatation.totalEmployee,
                  '${quatation.diskon} %',
                  quatation.keterangan1
                ],
                [
                  'Harga Training',
                  'Rp.${NumberFormat.currency(
                    locale: "id",
                    name: '',
                    decimalDigits: 0,
                  ).format(quatation.hargaTrining)}',
                  '${quatation.diskonTrining} %',
                  quatation.keterangan2
                ],
                [
                  'Harga Implementasi',
                  'Rp.${NumberFormat.currency(
                    locale: "id",
                    name: '',
                    decimalDigits: 0,
                  ).format(quatation.hargaImplementasi)}',
                  '${quatation.diskonImplementasi} %',
                  quatation.keterangan3
                ],
                [
                  'Harga Modifikasi',
                  'Rp.${NumberFormat.currency(
                    locale: "id",
                    name: '',
                    decimalDigits: 0,
                  ).format(quatation.hargaModifikasi)}',
                  '${quatation.diskonModifikasi} %',
                  quatation.keterangan4
                ],
              ],
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Divider(
              height: 2,
              thickness: 2,
              color: PdfColors.black,
            ),
            pw.SizedBox(
              height: 10,
            ),

            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Spacer(flex: 5),
                  pw.Expanded(
                    flex: 6,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                          width: double.infinity,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Text(
                                  "Harga : ",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              pw.Text('Rp.'),
                              pw.Text(NumberFormat.currency(
                                locale: "id",
                                name: '',
                                decimalDigits: 0,
                              ).format(total))
                            ],
                          ),
                        ),
                        pw.Container(
                          width: double.infinity,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Text(
                                  "Harga Per karyawan : ",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              pw.Text('Rp.'),
                              pw.Text(NumberFormat.currency(
                                locale: "id",
                                name: '',
                                decimalDigits: 0,
                              ).format(hargaPerKaryawan))
                            ],
                          ),
                        ),
                        pw.Container(
                          width: double.infinity,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Text(
                                  "Setelah Diskon : ",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              pw.Text('Rp.'),
                              pw.Text(NumberFormat.currency(
                                locale: "id",
                                name: '',
                                decimalDigits: 0,
                              ).format(setelahDiskon))
                            ],
                          ),
                        ),
                        pw.Container(
                          width: double.infinity,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Text(
                                  "Total Harga Trining : ",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              pw.Text('Rp.'),
                              pw.Text(NumberFormat.currency(
                                locale: "id",
                                name: '',
                                decimalDigits: 0,
                              ).format(hargaTrinings))
                            ],
                          ),
                        ),
                        pw.Container(
                          width: double.infinity,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Text(
                                  "Total Harga Implementasi : ",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              pw.Text('Rp.'),
                              pw.Text(NumberFormat.currency(
                                locale: "id",
                                name: '',
                                decimalDigits: 0,
                              ).format(hargaImplementasis))
                            ],
                          ),
                        ),
                        pw.Container(
                          width: double.infinity,
                          child: pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Text(
                                  "Total Harga Modifikasi : ",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              pw.Text('Rp.'),
                              pw.Text(NumberFormat.currency(
                                locale: "id",
                                name: '',
                                decimalDigits: 0,
                              ).format(hargaModifikasis))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
    return pdf.save();
  }

  static Future<void> savePdfFile(Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/QuotationDocument.pdf";
    print(filePath);
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenFile.open(filePath);
  }

  static Future<void> savePdfFileToSendEmail(Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/QuotationDocument.pdf";
    print(filePath);
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    // await OpenFile.open(filePath);
  }

  static Future<void> send(String recipients) async {
    final output = await getTemporaryDirectory();

    final Email email = Email(
      body:
          'Berikut Link Untuk E-sign \n https://www.sodapdf.com/id/sign-pdf/ ',
      subject: 'Quotation PDF',
      recipients: [recipients],
      attachmentPaths: ["${output.path}/QuotationDocument.pdf"],
      isHTML: true,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }
  }
}
