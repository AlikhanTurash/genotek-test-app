// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceItem _$PriceItemFromJson(Map<String, dynamic> json) {
  return _PriceItem.fromJson(json);
}

/// @nodoc
mixin _$PriceItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get priceEu => throw _privateConstructorUsedError;
  double? get priceUsd => throw _privateConstructorUsedError;
  double? get pricePen => throw _privateConstructorUsedError;
  double? get priceAED => throw _privateConstructorUsedError;
  double? get priceGBP => throw _privateConstructorUsedError;
  double? get priceJPY => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  bool get discountState => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PriceItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PriceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriceItemCopyWith<PriceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceItemCopyWith<$Res> {
  factory $PriceItemCopyWith(PriceItem value, $Res Function(PriceItem) then) =
      _$PriceItemCopyWithImpl<$Res, PriceItem>;
  @useResult
  $Res call(
      {String id,
      String name,
      double? price,
      double? priceEu,
      double? priceUsd,
      double? pricePen,
      double? priceAED,
      double? priceGBP,
      double? priceJPY,
      String category,
      bool discountState,
      DateTime? updatedAt});
}

/// @nodoc
class _$PriceItemCopyWithImpl<$Res, $Val extends PriceItem>
    implements $PriceItemCopyWith<$Res> {
  _$PriceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = freezed,
    Object? priceEu = freezed,
    Object? priceUsd = freezed,
    Object? pricePen = freezed,
    Object? priceAED = freezed,
    Object? priceGBP = freezed,
    Object? priceJPY = freezed,
    Object? category = null,
    Object? discountState = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      priceEu: freezed == priceEu
          ? _value.priceEu
          : priceEu // ignore: cast_nullable_to_non_nullable
              as double?,
      priceUsd: freezed == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double?,
      pricePen: freezed == pricePen
          ? _value.pricePen
          : pricePen // ignore: cast_nullable_to_non_nullable
              as double?,
      priceAED: freezed == priceAED
          ? _value.priceAED
          : priceAED // ignore: cast_nullable_to_non_nullable
              as double?,
      priceGBP: freezed == priceGBP
          ? _value.priceGBP
          : priceGBP // ignore: cast_nullable_to_non_nullable
              as double?,
      priceJPY: freezed == priceJPY
          ? _value.priceJPY
          : priceJPY // ignore: cast_nullable_to_non_nullable
              as double?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      discountState: null == discountState
          ? _value.discountState
          : discountState // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceItemImplCopyWith<$Res>
    implements $PriceItemCopyWith<$Res> {
  factory _$$PriceItemImplCopyWith(
          _$PriceItemImpl value, $Res Function(_$PriceItemImpl) then) =
      __$$PriceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double? price,
      double? priceEu,
      double? priceUsd,
      double? pricePen,
      double? priceAED,
      double? priceGBP,
      double? priceJPY,
      String category,
      bool discountState,
      DateTime? updatedAt});
}

/// @nodoc
class __$$PriceItemImplCopyWithImpl<$Res>
    extends _$PriceItemCopyWithImpl<$Res, _$PriceItemImpl>
    implements _$$PriceItemImplCopyWith<$Res> {
  __$$PriceItemImplCopyWithImpl(
      _$PriceItemImpl _value, $Res Function(_$PriceItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = freezed,
    Object? priceEu = freezed,
    Object? priceUsd = freezed,
    Object? pricePen = freezed,
    Object? priceAED = freezed,
    Object? priceGBP = freezed,
    Object? priceJPY = freezed,
    Object? category = null,
    Object? discountState = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PriceItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      priceEu: freezed == priceEu
          ? _value.priceEu
          : priceEu // ignore: cast_nullable_to_non_nullable
              as double?,
      priceUsd: freezed == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double?,
      pricePen: freezed == pricePen
          ? _value.pricePen
          : pricePen // ignore: cast_nullable_to_non_nullable
              as double?,
      priceAED: freezed == priceAED
          ? _value.priceAED
          : priceAED // ignore: cast_nullable_to_non_nullable
              as double?,
      priceGBP: freezed == priceGBP
          ? _value.priceGBP
          : priceGBP // ignore: cast_nullable_to_non_nullable
              as double?,
      priceJPY: freezed == priceJPY
          ? _value.priceJPY
          : priceJPY // ignore: cast_nullable_to_non_nullable
              as double?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      discountState: null == discountState
          ? _value.discountState
          : discountState // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceItemImpl implements _PriceItem {
  const _$PriceItemImpl(
      {required this.id,
      required this.name,
      this.price,
      this.priceEu,
      this.priceUsd,
      this.pricePen,
      this.priceAED,
      this.priceGBP,
      this.priceJPY,
      required this.category,
      required this.discountState,
      this.updatedAt});

  factory _$PriceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double? price;
  @override
  final double? priceEu;
  @override
  final double? priceUsd;
  @override
  final double? pricePen;
  @override
  final double? priceAED;
  @override
  final double? priceGBP;
  @override
  final double? priceJPY;
  @override
  final String category;
  @override
  final bool discountState;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PriceItem(id: $id, name: $name, price: $price, priceEu: $priceEu, priceUsd: $priceUsd, pricePen: $pricePen, priceAED: $priceAED, priceGBP: $priceGBP, priceJPY: $priceJPY, category: $category, discountState: $discountState, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceEu, priceEu) || other.priceEu == priceEu) &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(other.pricePen, pricePen) ||
                other.pricePen == pricePen) &&
            (identical(other.priceAED, priceAED) ||
                other.priceAED == priceAED) &&
            (identical(other.priceGBP, priceGBP) ||
                other.priceGBP == priceGBP) &&
            (identical(other.priceJPY, priceJPY) ||
                other.priceJPY == priceJPY) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.discountState, discountState) ||
                other.discountState == discountState) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      price,
      priceEu,
      priceUsd,
      pricePen,
      priceAED,
      priceGBP,
      priceJPY,
      category,
      discountState,
      updatedAt);

  /// Create a copy of PriceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceItemImplCopyWith<_$PriceItemImpl> get copyWith =>
      __$$PriceItemImplCopyWithImpl<_$PriceItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceItemImplToJson(
      this,
    );
  }
}

abstract class _PriceItem implements PriceItem {
  const factory _PriceItem(
      {required final String id,
      required final String name,
      final double? price,
      final double? priceEu,
      final double? priceUsd,
      final double? pricePen,
      final double? priceAED,
      final double? priceGBP,
      final double? priceJPY,
      required final String category,
      required final bool discountState,
      final DateTime? updatedAt}) = _$PriceItemImpl;

  factory _PriceItem.fromJson(Map<String, dynamic> json) =
      _$PriceItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double? get price;
  @override
  double? get priceEu;
  @override
  double? get priceUsd;
  @override
  double? get pricePen;
  @override
  double? get priceAED;
  @override
  double? get priceGBP;
  @override
  double? get priceJPY;
  @override
  String get category;
  @override
  bool get discountState;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PriceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceItemImplCopyWith<_$PriceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
