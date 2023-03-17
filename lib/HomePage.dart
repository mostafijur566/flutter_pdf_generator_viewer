import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path/path.dart' as p;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            // Fetch data from the API
            // List<dynamic> data = await fetchDataFromAPI();

            // Create the PDF with the fetched data
            File pdfFile = await createPDF();

            // Display the PDF within the app
            await _displayPDF(pdfFile);

            // Print the PDF
            await printPDF(pdfFile);
          },
          child: Text('Button'),
        ),
      ),
    );
  }

  Future<File> createPDF() async {

    // Create a new PDF document
    final pdf = pw.Document();

    // Add content to the PDF document

    List<pw.Widget> widgets = [];

    widgets.add(pw.Column(
        children: [
          pw.Text('Hello world')
        ]
    ));

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => widgets,
      ),
    );

    // Save the PDF document to a file
    final output = Directory.systemTemp;
    final file = File(p.join(output.path, 'example.pdf'));
    await file.writeAsBytes(await pdf.save());

    return file;
  }

  Future<void> _displayPDF(File file) async {
    try {
      if (Platform.isLinux) {
        await Process.run('xdg-open', [file.path]);
      } else if (Platform.isMacOS) {
        await Process.run('open', [file.path]);
      } else if (Platform.isWindows) {
        await Process.run('start', ['/wait', file.path], runInShell: true);
      } else {
        throw 'Unsupported platform';
      }
    } catch (e) {
      throw 'Could not launch PDF';
    }
  }

  Future<void> printPDF(File file) async {
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => file.readAsBytes());
  }
}
