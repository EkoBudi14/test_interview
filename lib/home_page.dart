// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_flutter/model.dart';
import 'package:test_flutter/services.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nomorController = TextEditingController(text: '');
  TextEditingController tanggalController = TextEditingController(text: '');
  TextEditingController namaPtController = TextEditingController(text: '');
  TextEditingController npwpController = TextEditingController(text: '');
  TextEditingController piCUserController = TextEditingController(text: '');
  TextEditingController piCPositionController = TextEditingController(text: '');
  TextEditingController contactController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController totalEmployeController =
      TextEditingController(text: '');
  TextEditingController diskonController = TextEditingController(text: '');
  TextEditingController keterangan1Controller = TextEditingController(text: '');
  TextEditingController hargaTriningController =
      TextEditingController(text: '');
  TextEditingController diskonTriningController =
      TextEditingController(text: '');
  TextEditingController keterangan2Controller = TextEditingController(text: '');
  TextEditingController hargaImplementasi = TextEditingController(text: '');
  TextEditingController diskonImplementasiController =
      TextEditingController(text: '');
  TextEditingController keterangan3Controller = TextEditingController(text: '');
  TextEditingController hargaModifikasiController =
      TextEditingController(text: '');
  TextEditingController diskonModifikasiController =
      TextEditingController(text: '');
  TextEditingController keterangan4Controller = TextEditingController(text: '');
  TextEditingController emailSalesController = TextEditingController(text: '');
  TextEditingController billingPicController = TextEditingController(text: '');
  TextEditingController billingAddressController =
      TextEditingController(text: '');
  TextEditingController billingContactController =
      TextEditingController(text: '');
  TextEditingController billingEmailController =
      TextEditingController(text: '');

  bool _validate = false;
  final _keyController = new GlobalKey<FormState>();
  final maskText = new MaskTextInputFormatter(
      mask: '##.###.###.#-###.###', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Input Quotation'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _keyController,
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quotation",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    controller: nomorController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "Masukan Nomor",
                      labelText: "Nomor",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    controller:
                        tanggalController, //editing controller of this TextField
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Enter Date" //label text of field
                        ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('dd/MM/yyyy').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          tanggalController.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    controller: namaPtController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Nama PT",
                      labelText: "Nama PT",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 70),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    keyboardType: TextInputType.number,
                    controller: npwpController,
                    inputFormatters: [
                      maskText,
                    ],
                    decoration: new InputDecoration(
                      hintText: "00.000.000.0-000.000",
                      labelText: "NPWP",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    controller: piCUserController,
                    decoration: new InputDecoration(
                      hintText: "Masukan PIC User",
                      labelText: "PIC User",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    controller: piCPositionController,
                    decoration: new InputDecoration(
                      hintText: "Mauskan PIC Position",
                      labelText: "PIC Position",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    keyboardType: TextInputType.number,
                    controller: contactController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Contact",
                      labelText: "Contact",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 70),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    controller: emailController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Email",
                      labelText: "Email",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    onChanged: (value) {
                      if (int.parse(totalEmployeController.text) <= 24) {
                        setState(() {
                          _validate = true;
                        });
                      } else {
                        setState(() {
                          _validate = false;
                        });
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: totalEmployeController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Total Employee",
                      labelText: "Total Employee",
                      errorText:
                          _validate ? 'Minimal Total Employe adalah 25' : null,
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Text(
                  "*Minimal Employee 25",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    keyboardType: TextInputType.number,
                    controller: diskonController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Diskon",
                      labelText: "Diskon",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 70),
                  child: TextFormField(
                    controller: keterangan1Controller,
                    decoration: new InputDecoration(
                      hintText: "Masukan Keterangan 1",
                      labelText: "Keterangan 1",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    keyboardType: TextInputType.number,
                    controller: hargaTriningController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Harga Trining",
                      labelText: "Harga Training",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    keyboardType: TextInputType.number,
                    controller: diskonTriningController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Diskon Training",
                      labelText: "Diskon Training",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 70),
                  child: TextFormField(
                    controller: keterangan2Controller,
                    decoration: new InputDecoration(
                      hintText: "Masukan Keterangan 2",
                      labelText: "Keterangan 2",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    keyboardType: TextInputType.number,
                    controller: hargaImplementasi,
                    decoration: new InputDecoration(
                      hintText: "Masukan Harga Implementasi",
                      labelText: "Harga Implementasi",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    keyboardType: TextInputType.number,
                    controller: diskonImplementasiController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Diskon Implementasi",
                      labelText: "Diskon Implementasi",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 70),
                  child: TextFormField(
                    controller: keterangan3Controller,
                    decoration: new InputDecoration(
                      hintText: "Masukan Keterangan 3",
                      labelText: "Keterangan 3",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    keyboardType: TextInputType.number,
                    controller: hargaModifikasiController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Harga Modifikasi",
                      labelText: "Harga Modifikasi",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    keyboardType: TextInputType.number,
                    controller: diskonModifikasiController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Diskon Modifikasi",
                      labelText: "Diskon Modifikasi",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 70),
                  child: TextFormField(
                    controller: keterangan4Controller,
                    decoration: new InputDecoration(
                      hintText: "Masukan Keterangan 4",
                      labelText: "Keterangan 4",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    controller: emailSalesController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Email Sales",
                      labelText: "Email Sales",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    controller: billingPicController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Billing PIC",
                      labelText: "Billing PIC",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    controller: billingAddressController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Billing Address",
                      labelText: "Billing Address",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    controller: billingContactController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Billing contact",
                      labelText: "Billing contact",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Harus Diisi' : null,
                    controller: billingEmailController,
                    decoration: new InputDecoration(
                      hintText: "Masukan Billing Email",
                      labelText: "Billing Email",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    _keyController.currentState!.save();
                    if (_keyController.currentState!.validate()) {
                      if (int.parse(totalEmployeController.text) <= 25) {
                        _validate = true;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Minimal Employe harus 25'),
                          ),
                        );
                      } else {
                        final dataQuot = Quatation(
                          nomor: int.parse(nomorController.text),
                          tanggal: tanggalController.text,
                          namaPT: namaPtController.text,
                          npwp: npwpController.text,
                          picUser: piCUserController.text,
                          picPosition: piCPositionController.text,
                          contact: contactController.text,
                          email: emailController.text,
                          totalEmployee: int.parse(totalEmployeController.text),
                          diskon: int.parse(diskonController.text),
                          keterangan1: keterangan1Controller.text,
                          hargaTrining: int.parse(hargaTriningController.text),
                          diskonTrining:
                              int.parse(diskonTriningController.text),
                          keterangan2: keterangan2Controller.text,
                          hargaImplementasi: int.parse(hargaImplementasi.text),
                          diskonImplementasi:
                              int.parse(diskonImplementasiController.text),
                          keterangan3: keterangan3Controller.text,
                          hargaModifikasi:
                              int.parse(hargaModifikasiController.text),
                          diskonModifikasi:
                              int.parse(diskonModifikasiController.text),
                          keterangan4: keterangan4Controller.text,
                          emailSales: emailSalesController.text,
                          billingPic: billingPicController.text,
                          billingAddress: billingAddressController.text,
                          billingContact: billingContactController.text,
                          billingEmail: billingEmailController.text,
                        );
                        final data =
                            await PdfServices().createdTestHello(dataQuot);
                        PdfServices.savePdfFile(data);
                      }
                    }
                  },
                  child: Text("Generate PDF"),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    _keyController.currentState!.save();
                    if (_keyController.currentState!.validate()) {
                      if (int.parse(totalEmployeController.text) <= 25) {
                        _validate = true;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Minimal 25 Employe'),
                          ),
                        );
                      } else {
                        final dataQuot = Quatation(
                          nomor: int.parse(nomorController.text),
                          tanggal: tanggalController.text,
                          namaPT: namaPtController.text,
                          npwp: npwpController.text,
                          picUser: piCUserController.text,
                          picPosition: piCPositionController.text,
                          contact: contactController.text,
                          email: emailController.text,
                          totalEmployee: int.parse(totalEmployeController.text),
                          diskon: int.parse(diskonController.text),
                          keterangan1: keterangan1Controller.text,
                          hargaTrining: int.parse(hargaTriningController.text),
                          diskonTrining:
                              int.parse(diskonTriningController.text),
                          keterangan2: keterangan2Controller.text,
                          hargaImplementasi: int.parse(hargaImplementasi.text),
                          diskonImplementasi:
                              int.parse(diskonImplementasiController.text),
                          keterangan3: keterangan3Controller.text,
                          hargaModifikasi:
                              int.parse(hargaModifikasiController.text),
                          diskonModifikasi:
                              int.parse(diskonModifikasiController.text),
                          keterangan4: keterangan4Controller.text,
                          emailSales: emailSalesController.text,
                          billingPic: billingPicController.text,
                          billingAddress: billingAddressController.text,
                          billingContact: billingContactController.text,
                          billingEmail: billingEmailController.text,
                        );
                        final data =
                            await PdfServices().createdTestHello(dataQuot);
                        PdfServices.savePdfFileToSendEmail(data);
                        PdfServices.send(emailSalesController.text);
                      }
                    }
                  },
                  child: Text("Send Email"),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
