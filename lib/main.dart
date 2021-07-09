import 'package:challenge_app/store/home_page_store.dart';
import 'package:challenge_app/ui/page/home/home_page.dart';
import 'package:challenge_service/weath_client.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void main() {
  final client = initClient();
  GetIt.I.registerSingleton<Client>(client);

  runApp(ProviderScope(child: EntryApp()));
}

class EntryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balance App',
      theme: ThemeData(
        primaryColor: Color(0xff3B5CB8),
        scaffoldBackgroundColor: Color(0xffE8EBF6),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(
              store: HomePageStore(),
            ),
      },
    );
  }
}
