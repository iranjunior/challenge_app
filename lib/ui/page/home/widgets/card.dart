import 'package:challenge_ui/challenge_ui.dart';
import 'package:flutter/material.dart';
import 'package:challenge_app/model/models.dart';
import 'package:challenge_app/extensions/concurrency.dart';
import 'package:challenge_app/extensions/responsive.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class CardHomePage extends StatelessWidget {
  const CardHomePage({
    Key? key,
    required this.balance,
    this.isLoading = false,
  }) : super(key: key);

  final BalanceModel balance;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return CardFliper(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrincipalText(text: 'Seu resumo'),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                  iconSize: 24,
                  tooltip: 'mais opções',
                ),
              ],
            ),
            SizedBox(height: 28.responsiveHeight),
            LabelText(
              text: 'Valor investido',
            ),
            PrincipalText(
              text: balance.total.formatToMoney(),
              semanticsLabel: '${balance.total} reais',
            ),
            SizedBox(height: 28.responsiveHeight),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelText(
                    text: 'Rentabilidade/mês',
                  ),
                  ValueText(
                      text: balance.profitability!.formatToPercentTax(),
                      semanticsLabel: '${balance.profitability} reais')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelText(
                    text: 'CDI',
                  ),
                  ValueText(
                    text: balance.cdi.formatToPercent(),
                    semanticsLabel: '${balance.cdi} por cento',
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelText(
                    text: 'Ganho/mês',
                  ),
                  ValueText(
                    text: balance.gain.formatToMoney(),
                    semanticsLabel: '${balance.gain} reais',
                  )
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            this.balance.hasHistory
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ButtonText(
                              text: 'VER MAIS',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink()
          ],
        ),
      );
    }

    return CardFliper(
      child: SkeletonLoader(
        items: 1,
        baseColor: Colors.grey.shade100,
        highlightColor: Colors.grey.shade400,
        period: Duration(seconds: 1),
        direction: SkeletonDirection.ltr,
        builder: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              height: 26,
              width: 300,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              height: 26,
              width: 260,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              height: 26,
              width: 180,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
