import 'dart:io';

import 'package:abu_bank/main.dart';
import 'package:abu_bank/theme/abu_bank_util.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<String?> addPdf({
  required String amount,
  required String beneficiaryName,
  required String currency,
  required String senderAccount,
  required String beneficiaryAccount,
  required String transactionType,
  required String beneficiaryBank,
  required String remark,
  required bool share,
  required String senderName,
}) async {
  try {
    final pdf = pw.Document();
    final ByteData image = await rootBundle.load('assets/images/sign.png');

    Uint8List imageData = (image).buffer.asUint8List();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Stack(
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'ABU BANK',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 30,
                            color: PdfColor.fromHex('#281C9D'),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 40),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Transaction Receipt',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    pw.Divider(
                      height: 10,
                      thickness: 2,
                    ),
                    pw.SizedBox(height: 8),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Transaction Date: ',
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColor.fromHex('#281C9D'),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            DateFormat.yMMMMEEEEd().format(DateTime.now()) +
                                ', ' +
                                DateFormat.Hm().format(
                                  DateTime.now(),
                                ),
                            style: pw.TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 15),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Sender Name: ',
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColor.fromHex('#281C9D'),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            senderName.toUpperCase(),
                            style: pw.TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 15),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Sender Account: ',
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColor.fromHex('#281C9D'),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            senderAccount,
                            style: pw.TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 15),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Transaction Amount: ',
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColor.fromHex('#281C9D'),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            numberFormat
                                    .format(double.parse(amount.toString())) +
                                ' ' +
                                currency,
                            style: pw.TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 15),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Transaction Type: ',
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColor.fromHex('#281C9D'),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            transactionType,
                            style: pw.TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 15),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Receiver: ',
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColor.fromHex('#281C9D'),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            beneficiaryName.toUpperCase(),
                            style: pw.TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 15),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Account Number: ',
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColor.fromHex('#281C9D'),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            beneficiaryAccount,
                            style: pw.TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 15),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Receiving Bank: ',
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColor.fromHex('#281C9D'),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            beneficiaryBank.toUpperCase(),
                            style: pw.TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 15),
                    if (remark.isNotEmpty)
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'Remark: ',
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColor.fromHex('#281C9D'),
                            ),
                          ),
                          pw.Expanded(
                            child: pw.Text(
                              remark,
                              style: pw.TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    pw.SizedBox(height: 15),
                  ],
                ),
              ),
              pw.Positioned(
                bottom: 0,
                right: 0,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      width: 100,
                      child: pw.Image(
                        pw.MemoryImage(imageData),
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      'Niza Undie',
                      style: pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );

    String downloadDirectory;
    if (!share) {
      if (Platform.isAndroid) {
        final directory = Directory('/storage/emulated/0/Download');
        if (await directory.exists()) {
          downloadDirectory = directory.path;
        } else {
          downloadDirectory = (await getExternalStorageDirectory())!.path;
        }

        print(downloadDirectory);
      } else {
        final downloadFolder = await getDownloadsDirectory();
        if (downloadFolder != null) {
          downloadDirectory = downloadFolder.path;
        } else {
          downloadDirectory = (await getApplicationDocumentsDirectory()).path;
        }
      }
    } else {
      downloadDirectory = (await getTemporaryDirectory()).path;
    }

    final file =
        File("$downloadDirectory/${DateTime.now().millisecondsSinceEpoch}.pdf");
    await file.writeAsBytes(await pdf.save());

    return file.path;
  } catch (_) {
    return null;
  }
}
