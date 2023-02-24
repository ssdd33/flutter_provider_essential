import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/chgnotiprov_chgnotiproxyprov.dart';
import 'package:flutter_provider/pages/chgnotiprov_proxyprov.dart';
import 'package:flutter_provider/pages/proxyprov_create_update.dart';
import 'package:flutter_provider/pages/proxyprov_proxyprov.dart';
import 'package:flutter_provider/pages/proxyprov_update.dart';
import 'package:flutter_provider/pages/why_proxyprov.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'proxyProvider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WhyProxyProv(),
                    ));
              },
              child: Text(
                'Why\nProxyProvider',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProxyProvUpdate(),
                    ));
              },
              child: Text(
                'ProxyProvider\nupdate',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProxyProvCreateUpdate(),
                    ));
              },
              child: Text(
                'ProxyProvider\ncreate/update',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProxyProvProxyProv(),
                    ));
              },
              child: Text(
                'ProxyProvider\nProxyProvider',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChgNotiProvProxyProv(),
                    ));
              },
              child: Text(
                'ChangeNotifierProvider\nChangeNotifierProxyProvider',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChgNotiProv(),
                    ));
              },
              child: Text(
                'ChangeNotifierProvider\nProxyProvider',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
