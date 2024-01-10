
import 'package:base_app/core/utils/constants.dart';
import 'package:base_app/domain/entities/drop_down_entity.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../core/utils/globals.dart';

class OffersFilterParameters {
  DropDownEntity? _filterBy;
  DropDownEntity? _sortBy;
  int _page;

  final OfferType _offerType;



  setPage(int page)=>_page = page;

  setFilterBy(DropDownEntity? filterBy)=>_filterBy = filterBy;
  setSortBy(DropDownEntity? sortBy)=>_sortBy = sortBy;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(_sortBy!=null) data['sort_by'] = _sortBy?.key;
    if(_filterBy?.key!=null) data['type'] = _filterBy?.key;
    // data['type'] = _type.name;
    data['page'] = _page;

    // data['type'] = kIsCustomer ? 'customer' : 'contractor';
    data['show_type'] = _offerType.name;
    return data;
  }


  int get page => _page;

  DropDownEntity? get sortBy => _sortBy;

  DropDownEntity? get filterBy => _filterBy;

  OffersFilterParameters({
    DropDownEntity? filterBy ,

    DropDownEntity? sortBy,
    int page = 1,
    OfferType offerType = OfferType.regular,
  })  : _filterBy = filterBy = kIsCustomer ? DropDownEntity(id: 2, title: tr(LocaleKeys.propertyOwner),key: 'customer'): DropDownEntity(id: 3, title: tr(LocaleKeys.contractor),key: 'contractor'),
        _sortBy = sortBy,
        _page = page,
        _offerType = offerType;
}
