import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          final barcodeScanRes =
              'https://pub.dev/packages/flutter_barcode_scanne';
          //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          //  '#3D8BEF', 'Cancelar', false, ScanMode.QR);
          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);

          scanListProvider.nuevoScan(barcodeScanRes);
          scanListProvider.nuevoScan('geo:15.23.12');
        },
        child: Icon(Icons.filter_center_focus));
  }
}
