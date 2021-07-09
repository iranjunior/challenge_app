import 'dart:convert';

import 'package:challenge_service/weath_client.dart';

class BalanceModel {
  double cdi;
  double total;
  double? profitability;
  double gain;
  bool hasHistory;
  int id;

  BalanceModel({
    required this.cdi,
    required this.total,
    required this.gain,
    required this.hasHistory,
    required this.id,
    this.profitability,
  });

  BalanceModel copyWith({
    double? cdi,
    double? total,
    double? profitability,
    double? gain,
    bool? hasHistory,
    int? id,
  }) {
    return BalanceModel(
      cdi: cdi ?? this.cdi,
      total: total ?? this.total,
      profitability: profitability ?? this.profitability,
      gain: gain ?? this.gain,
      hasHistory: hasHistory ?? this.hasHistory,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cdi': cdi,
      'total': total,
      'profitability': profitability,
      'gain': gain,
      'hasHistory': hasHistory,
      'id': id,
    };
  }

  factory BalanceModel.fromMap(Map<String, dynamic> map) {
    return BalanceModel(
      cdi: map['cdi'],
      total: map['total'],
      profitability: map['profitability'],
      gain: map['gain'],
      hasHistory: map['hasHistory'],
      id: map['id'],
    );
  }
  
  factory BalanceModel.fromRequest(GFetchBalanceData_wealthSummary response) {
    return BalanceModel(
      cdi: response.cdi,
      total: response.total,
      id: response.id,
      hasHistory: response.hasHistory,
      gain: response.gain,
      profitability: response.profitability,
    );
  }
  
  factory BalanceModel.empyt() {
    return BalanceModel(
      cdi: 0,
      total: 0,
      id: 0,
      hasHistory: false,
      gain: 0,
      profitability: 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BalanceModel.fromJson(String source) =>
      BalanceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BalanceModel(cdi: $cdi, total: $total, profitability: $profitability, gain: $gain, hasHistory: $hasHistory, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BalanceModel &&
        other.cdi == cdi &&
        other.total == total &&
        other.profitability == profitability &&
        other.gain == gain &&
        other.hasHistory == hasHistory &&
        other.id == id;
  }

  @override
  int get hashCode {
    return cdi.hashCode ^
        total.hashCode ^
        profitability.hashCode ^
        gain.hashCode ^
        hasHistory.hashCode ^
        id.hashCode;
  }
}
