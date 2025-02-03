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
    double? startPriceEu,
    double? discountPriceEu,
    bool? discountStateEu,
    double? priceUsd,
    double? startPriceUsd,
    double? discountPriceUsd,
    bool? discountStateUsd,
    double? pricePen,
    double? startPricePen,
    double? discountPricePen,
    bool? discountStatePen,
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
