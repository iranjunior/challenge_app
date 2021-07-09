import 'package:challenge_app/model/balance.dart';
import 'package:challenge_service/weath_client.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod/riverpod.dart';

class HomePageStore {
  
  final listBalance = StreamProvider.autoDispose<List<BalanceModel>>((ref) {
    final client = GetIt.I.get<Client>();
    final request = GFetchBalanceReq();

    return client.request(request).map((event) {
      if (event.data != null) {
        return event.data!.wealthSummary
            .map((element) => BalanceModel.fromRequest(element))
            .toList();
      }
      return [];
    });
  });
}
