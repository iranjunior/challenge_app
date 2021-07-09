import 'package:challenge_app/ui/page/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:challenge_app/extensions/responsive.dart';
import 'package:challenge_app/model/models.dart';

class ListCardBalance extends ConsumerWidget {
  ListCardBalance({Key? key, required this.provider}) : super(key: key);
  final AutoDisposeStreamProvider<List<BalanceModel>> provider;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final listBalanceSteam = watch(provider);
    return Container(
      child: listBalanceSteam.when(
        data: (listBalance) {
          print(listBalance);
          return PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listBalance.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.responsiveWidth),
                  padding: EdgeInsets.all(4),
                  child: CardHomePage(
                    balance: listBalance[index],
                  ),
                );
              });
        },
        loading: () {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.responsiveWidth),
            padding: EdgeInsets.all(4),
            child: CardHomePage(
              balance: BalanceModel.empyt(),
              isLoading: true,
            ),
          );
        },
        error: (error, e) => Center(
          child: Text(
            'Tivemos um problema, tente novamente mais tarde',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }
}
