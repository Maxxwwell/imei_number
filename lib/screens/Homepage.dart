import 'package:android_multiple_identifier/android_multiple_identifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _platformVersion = 'Unknown';
  String _imei = 'Unknown';
  String _serial = 'Unknown';
  String _androidID = 'Unknown';
  Map _idMap = Map();

  Future<void> initPlatformState() async {
    String platformVersion;
    String imei;
    String serial;
    String androidID;
    Map idMap;

    try {
      platformVersion = await AndroidMultipleIdentifier.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    bool requestResponse = await AndroidMultipleIdentifier.requestPermission();
    print("NEVER ASK AGAIN SET TO: ${AndroidMultipleIdentifier.neverAskAgain}");

    try {
      imei = await AndroidMultipleIdentifier.imeiCode;
      serial = await AndroidMultipleIdentifier.serialCode;
      androidID = await AndroidMultipleIdentifier.androidID;

      idMap = await AndroidMultipleIdentifier.idMap;
    } catch (e) {
      idMap = Map();
      idMap["imei"] = 'Failed to get IMEI.';
      // idMap["serial"] = 'Failed to get Serial Code.';
      // idMap["androidId"] = 'Failed to get Android id.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _idMap = idMap;
      _imei = _idMap["imei"];
      // _serial = _idMap["serial"];
      // _androidID = _idMap["androidId"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMEI number'),
        centerTitle: true,
        backgroundColor: Colors.yellow[600],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   '\nRunning on: $_platformVersion\n',
            //   textAlign: TextAlign.center,
            // ),
            Text('IMEI: $_imei\n'),
            // Text(
            //   'Serial Code: $_serial\n',
            //   textAlign: TextAlign.center,
            // ),
            // Text(
            //   'Android ID: $_androidID\n',
            //   textAlign: TextAlign.center,
            // ),
            MaterialButton(
              child: const Text(
                'Get Info',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(width: 2),
              ),
              height: 45,
              elevation: 8,
              highlightColor: Colors.white,
              minWidth: MediaQuery.of(context).size.width - 200,
              onPressed: () async {
                initPlatformState();
              },
            )
          ],
        ),
      ),
    );
  }
}
