// lib/src/features/price_table/domain/models/price_item.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_item.freezed.dart';
part 'price_item.g.dart';

@freezed
class PriceItem with _$PriceItem {
  const factory PriceItem({
    required String id,
    required String name,
    double? price,
    double? priceEu,
    double? priceUsd,
    double? pricePen,
    double? priceAED,
    double? priceGBP,
    double? priceJPY,
    required String category,
    required bool discountState,
    DateTime? updatedAt,
  }) = _PriceItem;

  factory PriceItem.fromJson(Map<String, dynamic> json) =>
      _$PriceItemFromJson(json);
}
