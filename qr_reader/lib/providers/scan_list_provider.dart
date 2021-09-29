import 'package:flutter/material.dart';
import 'package:qrreader/models/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    //Asignar el ID de la base de datos al modelo
    final id = await DBProvider.db.nuevoScan(nuevoScan);

    nuevoScan.id = id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);

      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansPortipo(tipo);
    this.scans = [...?scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScan();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    this.cargarScanPorTipo(this.tipoSeleccionado);
  }
}
