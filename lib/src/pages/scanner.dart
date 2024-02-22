import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';

import './product.dart';

class BarcodeScannerComponent extends StatefulWidget {
  @override
  _BarcodeScannerComponentState createState() =>
      _BarcodeScannerComponentState();
}

class _BarcodeScannerComponentState extends State<BarcodeScannerComponent> {
  String _scanBarcodeResult = "";
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () async {
            FlutterBarcodeScanner.getBarcodeStreamReceiver(
              "#ff6666",
              "Cancel",
              true,
              ScanMode.BARCODE,
            )!
                .listen((barcode) {
              setState(() {
                _scanBarcodeResult = barcode;
              });
              print("BarRes Stream: " + _scanBarcodeResult);
            });
          },
          child: Text("Barcode Stream"),
        ),
        ElevatedButton(
          onPressed: () async {
            String barcodeScanRes;
            try {
              barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                "#ff6666",
                "Cancel",
                true,
                ScanMode.BARCODE,
              );
            } on PlatformException {
              barcodeScanRes = 'Failed to get platform version.';
            }
            setState(() {
              _scanBarcodeResult = barcodeScanRes;
            });
            print("BarRes: " + _scanBarcodeResult);
          },
          child: Text("Barcode Scanner"),
        ),
        SizedBox(height: 20),
        Text(
          'Barcode Result: $_scanBarcodeResult',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        ElevatedButton(
          onPressed: () {
            // Show the modal dialog when the button is pressed
            showModal(context);
          },
          child: Text('Open Modal'),
        ),
        ElevatedButton(
          onPressed: () {
            _pickImageFromGallery();
          },
          child: Text('Pick Image'),
        ),
        SizedBox(height: 20),
        _selectedImage != null
            ? Image.file(_selectedImage!)
            : Text("Please pick image"),
      ],
    );
  }

  Future _pickImageFromGallery() async {
    // Implement image picker logic here
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          // Ensure the dialog expands to fit the screen size
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('Close'),
                ),
                const SizedBox(height: 10),
                // OpenFoodApiComponent('${_scanBarcodeResult}'),
                OpenFoodApiComponent(barcode: _scanBarcodeResult),
              ],
            ),
          ),
        );
      },
    );
  }
}
