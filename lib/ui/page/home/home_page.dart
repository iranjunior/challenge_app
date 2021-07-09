import 'package:challenge_app/ui/page/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:challenge_app/extensions/responsive.dart';
import 'package:challenge_app/store/home_page_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.store,
  }) : super(key: key);
  final HomePageStore store;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300.responsiveHeight,
          child: ListCardBalance(
            provider: widget.store.listBalance,
          ),
        ),
      ),
    );
  }
}
