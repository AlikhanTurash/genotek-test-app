import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genotek_test_app/src/features/price_table/domain/models/price_item.dart';
import 'package:genotek_test_app/src/features/price_table/domain/models/currency.dart';
import 'package:genotek_test_app/src/features/price_table/presentation/providers/currency_provider.dart';

class PriceDataTable extends ConsumerWidget {
  final List<PriceItem> prices;

  const PriceDataTable({required this.prices});

  bool getDiscountStateForCurrency(PriceItem item, Currency currency) {
    switch (currency) {
      case Currency.clp:
        return item.discountStateCl ?? false;
      case Currency.eur:
        return item.discountStateEu ?? false;
      case Currency.pen:
        return item.discountStatePen ?? false;
      case Currency.usd:
        return item.discountStateUsd ?? false;
      case Currency.aed:
        return item.discountStateAed ?? false;
      case Currency.all:
        return item.discountStateAll ?? false;
      case Currency.amd:
        return item.discountStateAmd ?? false;
      case Currency.aoa:
        return item.discountStateAoa ?? false;
      case Currency.aud:
        return item.discountStateAud ?? false;
      case Currency.bam:
        return item.discountStateBam ?? false;
      case Currency.bdt:
        return item.discountStateBdt ?? false;
      case Currency.czk:
        return item.discountStateCzk ?? false;
      case Currency.dkk:
        return item.discountStateDkk ?? false;
      case Currency.dzd:
        return item.discountStateDzd ?? false;
      case Currency.egp:
        return item.discountStateEgp ?? false;
      case Currency.etb:
        return item.discountStateEtb ?? false;
      case Currency.gel:
        return item.discountStateGel ?? false;
      case Currency.hkd:
        return item.discountStateHkd ?? false;
      case Currency.huf:
        return item.discountStateHuf ?? false;
      case Currency.inr:
        return item.discountStateInr ?? false;
      case Currency.kes:
        return item.discountStateKes ?? false;
      case Currency.kgs:
        return item.discountStateKgs ?? false;
      case Currency.kzt:
        return item.discountStateKzt ?? false;
      case Currency.mad:
        return item.discountStateMad ?? false;
      case Currency.mdl:
        return item.discountStateMdl ?? false;
      case Currency.mxn:
        return item.discountStateMxn ?? false;
      case Currency.myr:
        return item.discountStateMyr ?? false;
      case Currency.ngn:
        return item.discountStateNgn ?? false;
      case Currency.npr:
        return item.discountStateNpr ?? false;
      case Currency.nzd:
        return item.discountStateNzd ?? false;
      case Currency.php:
        return item.discountStatePhp ?? false;
      case Currency.pkr:
        return item.discountStatePkr ?? false;
      case Currency.pln:
        return item.discountStatePln ?? false;
      case Currency.qar:
        return item.discountStateQar ?? false;
      case Currency.ron:
        return item.discountStateRon ?? false;
      case Currency.rsd:
        return item.discountStateRsd ?? false;
      case Currency.sar:
        return item.discountStateSar ?? false;
      case Currency.sek:
        return item.discountStateSek ?? false;
      case Currency.sgd:
        return item.discountStateSgd ?? false;
      case Currency.thb:
        return item.discountStateThb ?? false;
      case Currency.tjs:
        return item.discountStateTjs ?? false;
      case Currency.zar:
        return item.discountStateZar ?? false;
      case Currency.uyu:
        return item.discountStateUyu ?? false;
      case Currency.chf:
        return item.discountStateChf ?? false;
      case Currency.nok:
        return item.discountStateNok ?? false;
      case Currency.gbp:
        return item.discountStateGbp ?? false;
      case Currency.rub:
        return item.discountState ?? false;
      default:
        return false;
    }
  }

  String getRegularPrice(PriceItem item, Currency currency) {
    switch (currency) {
      case Currency.clp:
        return item.startPriceCl != null
            ? 'CL\$${item.startPriceCl!.toStringAsFixed(2)}'
            : (item.priceCl != null
                ? 'CL\$${item.priceCl!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.eur:
        return item.startPriceEu != null
            ? '€${item.startPriceEu!.toStringAsFixed(2)}'
            : (item.priceEu != null
                ? '€${item.priceEu!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.pen:
        return item.startPricePen != null
            ? 'S/${item.startPricePen!.toStringAsFixed(2)}'
            : (item.pricePen != null
                ? 'S/${item.pricePen!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.usd:
        return item.startPriceUsd != null
            ? '\$${item.startPriceUsd!.toStringAsFixed(2)}'
            : (item.priceUsd != null
                ? '\$${item.priceUsd!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.aed:
        return item.startPriceAed != null
            ? 'AED ${item.startPriceAed!.toStringAsFixed(2)}'
            : (item.priceAed != null
                ? 'AED ${item.priceAed!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.all:
        return item.startPriceAll != null
            ? 'L${item.startPriceAll!.toStringAsFixed(2)}'
            : (item.priceAll != null
                ? 'L${item.priceAll!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.amd:
        return item.startPriceAmd != null
            ? '֏${item.startPriceAmd!.toStringAsFixed(2)}'
            : (item.priceAmd != null
                ? '֏${item.priceAmd!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.aoa:
        return item.startPriceAoa != null
            ? 'Kz${item.startPriceAoa!.toStringAsFixed(2)}'
            : (item.priceAoa != null
                ? 'Kz${item.priceAoa!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.aud:
        return item.startPriceAud != null
            ? 'A\$${item.startPriceAud!.toStringAsFixed(2)}'
            : (item.priceAud != null
                ? 'A\$${item.priceAud!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.bam:
        return item.startPriceBam != null
            ? 'KM${item.startPriceBam!.toStringAsFixed(2)}'
            : (item.priceBam != null
                ? 'KM${item.priceBam!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.bdt:
        return item.startPriceBdt != null
            ? '৳${item.startPriceBdt!.toStringAsFixed(2)}'
            : (item.priceBdt != null
                ? '৳${item.priceBdt!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.czk:
        return item.startPriceCzk != null
            ? 'Kč${item.startPriceCzk!.toStringAsFixed(2)}'
            : (item.priceCzk != null
                ? 'Kč${item.priceCzk!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.dkk:
        return item.startPriceDkk != null
            ? 'kr${item.startPriceDkk!.toStringAsFixed(2)}'
            : (item.priceDkk != null
                ? 'kr${item.priceDkk!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.dzd:
        return item.startPriceDzd != null
            ? 'د.ج${item.startPriceDzd!.toStringAsFixed(2)}'
            : (item.priceDzd != null
                ? 'د.ج${item.priceDzd!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.egp:
        return item.startPriceEgp != null
            ? 'E£${item.startPriceEgp!.toStringAsFixed(2)}'
            : (item.priceEgp != null
                ? 'E£${item.priceEgp!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.etb:
        return item.startPriceEtb != null
            ? 'Br${item.startPriceEtb!.toStringAsFixed(2)}'
            : (item.priceEtb != null
                ? 'Br${item.priceEtb!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.gel:
        return item.startPriceGel != null
            ? '₾${item.startPriceGel!.toStringAsFixed(2)}'
            : (item.priceGel != null
                ? '₾${item.priceGel!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.hkd:
        return item.startPriceHkd != null
            ? 'HK\$${item.startPriceHkd!.toStringAsFixed(2)}'
            : (item.priceHkd != null
                ? 'HK\$${item.priceHkd!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.huf:
        return item.startPriceHuf != null
            ? 'Ft${item.startPriceHuf!.toStringAsFixed(2)}'
            : (item.priceHuf != null
                ? 'Ft${item.priceHuf!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.inr:
        return item.startPriceInr != null
            ? '₹${item.startPriceInr!.toStringAsFixed(2)}'
            : (item.priceInr != null
                ? '₹${item.priceInr!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.kes:
        return item.startPriceKes != null
            ? 'KSh${item.startPriceKes!.toStringAsFixed(2)}'
            : (item.priceKes != null
                ? 'KSh${item.priceKes!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.kgs:
        return item.startPriceKgs != null
            ? 'с${item.startPriceKgs!.toStringAsFixed(2)}'
            : (item.priceKgs != null
                ? 'с${item.priceKgs!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.kzt:
        return item.startPriceKzt != null
            ? '₸${item.startPriceKzt!.toStringAsFixed(2)}'
            : (item.priceKzt != null
                ? '₸${item.priceKzt!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.mad:
        return item.startPriceMad != null
            ? 'د.م.${item.startPriceMad!.toStringAsFixed(2)}'
            : (item.priceMad != null
                ? 'د.م.${item.priceMad!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.mdl:
        return item.startPriceMdl != null
            ? 'L${item.startPriceMdl!.toStringAsFixed(2)}'
            : (item.priceMdl != null
                ? 'L${item.priceMdl!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.mxn:
        return item.startPriceMxn != null
            ? 'Mex\$${item.startPriceMxn!.toStringAsFixed(2)}'
            : (item.priceMxn != null
                ? 'Mex\$${item.priceMxn!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.myr:
        return item.startPriceMyr != null
            ? 'RM${item.startPriceMyr!.toStringAsFixed(2)}'
            : (item.priceMyr != null
                ? 'RM${item.priceMyr!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.ngn:
        return item.startPriceNgn != null
            ? '₦${item.startPriceNgn!.toStringAsFixed(2)}'
            : (item.priceNgn != null
                ? '₦${item.priceNgn!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.npr:
        return item.startPriceNpr != null
            ? 'रु${item.startPriceNpr!.toStringAsFixed(2)}'
            : (item.priceNpr != null
                ? 'रु${item.priceNpr!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.nzd:
        return item.startPriceNzd != null
            ? 'NZ\$${item.startPriceNzd!.toStringAsFixed(2)}'
            : (item.priceNzd != null
                ? 'NZ\$${item.priceNzd!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.php:
        return item.startPricePhp != null
            ? '₱${item.startPricePhp!.toStringAsFixed(2)}'
            : (item.pricePhp != null
                ? '₱${item.pricePhp!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.pkr:
        return item.startPricePkr != null
            ? '₨${item.startPricePkr!.toStringAsFixed(2)}'
            : (item.pricePkr != null
                ? '₨${item.pricePkr!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.pln:
        return item.startPricePln != null
            ? 'zł${item.startPricePln!.toStringAsFixed(2)}'
            : (item.pricePln != null
                ? 'zł${item.pricePln!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.qar:
        return item.startPriceQar != null
            ? 'ر.ق${item.startPriceQar!.toStringAsFixed(2)}'
            : (item.priceQar != null
                ? 'ر.ق${item.priceQar!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.ron:
        return item.startPriceRon != null
            ? 'lei${item.startPriceRon!.toStringAsFixed(2)}'
            : (item.priceRon != null
                ? 'lei${item.priceRon!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.rsd:
        return item.startPriceRsd != null
            ? 'дин${item.startPriceRsd!.toStringAsFixed(2)}'
            : (item.priceRsd != null
                ? 'дин${item.priceRsd!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.sar:
        return item.startPriceSar != null
            ? 'ر.س${item.startPriceSar!.toStringAsFixed(2)}'
            : (item.priceSar != null
                ? 'ر.س${item.priceSar!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.sek:
        return item.startPriceSek != null
            ? 'kr${item.startPriceSek!.toStringAsFixed(2)}'
            : (item.priceSek != null
                ? 'kr${item.priceSek!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.sgd:
        return item.startPriceSgd != null
            ? 'S\$${item.startPriceSgd!.toStringAsFixed(2)}'
            : (item.priceSgd != null
                ? 'S\$${item.priceSgd!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.thb:
        return item.startPriceThb != null
            ? '฿${item.startPriceThb!.toStringAsFixed(2)}'
            : (item.priceThb != null
                ? '฿${item.priceThb!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.tjs:
        return item.startPriceTjs != null
            ? 'SM${item.startPriceTjs!.toStringAsFixed(2)}'
            : (item.priceTjs != null
                ? 'SM${item.priceTjs!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.zar:
        return item.startPriceZar != null
            ? 'R${item.startPriceZar!.toStringAsFixed(2)}'
            : (item.priceZar != null
                ? 'R${item.priceZar!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.uyu:
        return item.startPriceUyu != null
            ? '\$U${item.startPriceUyu!.toStringAsFixed(2)}'
            : (item.priceUyu != null
                ? '\$U${item.priceUyu!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.chf:
        return item.startPriceChf != null
            ? 'CHF${item.startPriceChf!.toStringAsFixed(2)}'
            : (item.priceChf != null
                ? 'CHF${item.priceChf!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.nok:
        return item.startPriceNok != null
            ? 'kr${item.startPriceNok!.toStringAsFixed(2)}'
            : (item.priceNok != null
                ? 'kr${item.priceNok!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.gbp:
        return item.startPriceGbp != null
            ? '£${item.startPriceGbp!.toStringAsFixed(2)}'
            : (item.priceGbp != null
                ? '£${item.priceGbp!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.rub:
        return item.startPrice != null
            ? '₽${item.startPrice!.toStringAsFixed(2)}'
            : (item.price != null
                ? '₽${item.price!.toStringAsFixed(2)}'
                : 'N/A');
      default:
        return 'N/A';
    }
  }

  String getDiscountPrice(PriceItem item, Currency currency) {
    switch (currency) {
      case Currency.clp:
        return item.discountPriceCl != null
            ? 'CL\$${item.discountPriceCl!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.eur:
        return item.discountPriceEu != null
            ? '€${item.discountPriceEu!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.pen:
        return item.discountPricePen != null
            ? 'S/${item.discountPricePen!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.usd:
        return item.discountPriceUsd != null
            ? '\$${item.discountPriceUsd!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.aed:
        return item.discountPriceAed != null
            ? 'AED ${item.discountPriceAed!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.all:
        return item.discountPriceAll != null
            ? 'L${item.discountPriceAll!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.amd:
        return item.discountPriceAmd != null
            ? '֏${item.discountPriceAmd!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.aoa:
        return item.discountPriceAoa != null
            ? 'Kz${item.discountPriceAoa!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.aud:
        return item.discountPriceAud != null
            ? 'A\$${item.discountPriceAud!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.bam:
        return item.discountPriceBam != null
            ? 'KM${item.discountPriceBam!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.bdt:
        return item.discountPriceBdt != null
            ? '৳${item.discountPriceBdt!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.czk:
        return item.discountPriceCzk != null
            ? 'Kč${item.discountPriceCzk!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.dkk:
        return item.discountPriceDkk != null
            ? 'kr${item.discountPriceDkk!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.dzd:
        return item.discountPriceDzd != null
            ? 'د.ج${item.discountPriceDzd!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.egp:
        return item.discountPriceEgp != null
            ? 'E£${item.discountPriceEgp!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.etb:
        return item.discountPriceEtb != null
            ? 'Br${item.discountPriceEtb!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.gel:
        return item.discountPriceGel != null
            ? '₾${item.discountPriceGel!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.hkd:
        return item.discountPriceHkd != null
            ? 'HK\$${item.discountPriceHkd!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.huf:
        return item.discountPriceHuf != null
            ? 'Ft${item.discountPriceHuf!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.inr:
        return item.discountPriceInr != null
            ? '₹${item.discountPriceInr!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.kes:
        return item.discountPriceKes != null
            ? 'KSh${item.discountPriceKes!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.kgs:
        return item.discountPriceKgs != null
            ? 'с${item.discountPriceKgs!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.kzt:
        return item.discountPriceKzt != null
            ? '₸${item.discountPriceKzt!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.mad:
        return item.discountPriceMad != null
            ? 'د.م.${item.discountPriceMad!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.mdl:
        return item.discountPriceMdl != null
            ? 'L${item.discountPriceMdl!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.mxn:
        return item.discountPriceMxn != null
            ? 'Mex\$${item.discountPriceMxn!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.myr:
        return item.discountPriceMyr != null
            ? 'RM${item.discountPriceMyr!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.ngn:
        return item.discountPriceNgn != null
            ? '₦${item.discountPriceNgn!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.npr:
        return item.discountPriceNpr != null
            ? 'रु${item.discountPriceNpr!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.nzd:
        return item.discountPriceNzd != null
            ? 'NZ\$${item.discountPriceNzd!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.php:
        return item.discountPricePhp != null
            ? '₱${item.discountPricePhp!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.pkr:
        return item.discountPricePkr != null
            ? '₨${item.discountPricePkr!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.pln:
        return item.discountPricePln != null
            ? 'zł${item.discountPricePln!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.qar:
        return item.discountPriceQar != null
            ? 'ر.ق${item.discountPriceQar!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.ron:
        return item.discountPriceRon != null
            ? 'lei${item.discountPriceRon!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.rsd:
        return item.discountPriceRsd != null
            ? 'дин${item.discountPriceRsd!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.sar:
        return item.discountPriceSar != null
            ? 'ر.س${item.discountPriceSar!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.sek:
        return item.discountPriceSek != null
            ? 'kr${item.discountPriceSek!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.sgd:
        return item.discountPriceSgd != null
            ? 'S\$${item.discountPriceSgd!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.thb:
        return item.discountPriceThb != null
            ? '฿${item.discountPriceThb!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.tjs:
        return item.discountPriceTjs != null
            ? 'SM${item.discountPriceTjs!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.zar:
        return item.discountPriceZar != null
            ? 'R${item.discountPriceZar!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.uyu:
        return item.discountPriceUyu != null
            ? '\$U${item.discountPriceUyu!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.chf:
        return item.discountPriceChf != null
            ? 'CHF${item.discountPriceChf!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.nok:
        return item.discountPriceNok != null
            ? 'kr${item.discountPriceNok!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.gbp:
        return item.discountPriceGbp != null
            ? '£${item.discountPriceGbp!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.rub:
        return item.discountPrice != null
            ? '₽${item.discountPrice!.toStringAsFixed(2)}'
            : 'N/A';
      default:
        return 'N/A';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCurrency = ref.watch(selectedCurrencyProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          const DataColumn(label: Text('Name')),
          DataColumn(
              label: Text('Price (${selectedCurrency.name})'), numeric: true),
          const DataColumn(label: Text('Category')),
        ],
        rows: prices
            .map((item) => DataRow(
                  cells: [
                    DataCell(Text(item.name)),
                    DataCell(
                      getDiscountStateForCurrency(item, selectedCurrency)
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  getRegularPrice(item, selectedCurrency),
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  getDiscountPrice(item, selectedCurrency),
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : Text(getRegularPrice(item, selectedCurrency)),
                    ),
                    DataCell(Text(item.category)),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
