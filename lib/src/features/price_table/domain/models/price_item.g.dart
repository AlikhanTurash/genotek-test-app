// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceItemImpl _$$PriceItemImplFromJson(Map<String, dynamic> json) =>
    _$PriceItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num?)?.toDouble(),
      priceEu: (json['priceEu'] as num?)?.toDouble(),
      startPriceEu: (json['startPriceEu'] as num?)?.toDouble(),
      discountPriceEu: (json['discountPriceEu'] as num?)?.toDouble(),
      priceUsd: (json['priceUsd'] as num?)?.toDouble(),
      startPriceUsd: (json['startPriceUsd'] as num?)?.toDouble(),
      discountPriceUsd: (json['discountPriceUsd'] as num?)?.toDouble(),
      pricePen: (json['pricePen'] as num?)?.toDouble(),
      startPricePen: (json['startPricePen'] as num?)?.toDouble(),
      discountPricePen: (json['discountPricePen'] as num?)?.toDouble(),
      priceAED: (json['priceAED'] as num?)?.toDouble(),
      priceGBP: (json['priceGBP'] as num?)?.toDouble(),
      priceJPY: (json['priceJPY'] as num?)?.toDouble(),
      category: json['category'] as String,
      discountState: json['discountState'] as bool,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PriceItemImplToJson(_$PriceItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'priceEu': instance.priceEu,
      'startPriceEu': instance.startPriceEu,
      'discountPriceEu': instance.discountPriceEu,
      'priceUsd': instance.priceUsd,
      'startPriceUsd': instance.startPriceUsd,
      'discountPriceUsd': instance.discountPriceUsd,
      'pricePen': instance.pricePen,
      'startPricePen': instance.startPricePen,
      'discountPricePen': instance.discountPricePen,
      'priceAED': instance.priceAED,
      'priceGBP': instance.priceGBP,
      'priceJPY': instance.priceJPY,
      'category': instance.category,
      'discountState': instance.discountState,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
