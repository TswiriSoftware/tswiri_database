// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: no_leading_underscores_for_local_identifiers

part of 'cataloged_barcode.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetCatalogedBarcodeCollection on Isar {
  IsarCollection<CatalogedBarcode> get catalogedBarcodes => getCollection();
}

const CatalogedBarcodeSchema = CollectionSchema(
  name: 'CatalogedBarcode',
  schema:
      '{"name":"CatalogedBarcode","idName":"id","properties":[{"name":"barcodeUID","type":"String"},{"name":"batchID","type":"Long"},{"name":"hashCode","type":"Long"},{"name":"height","type":"Double"},{"name":"width","type":"Double"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'barcodeUID': 0,
    'batchID': 1,
    'hashCode': 2,
    'height': 3,
    'width': 4
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _catalogedBarcodeGetId,
  setId: _catalogedBarcodeSetId,
  getLinks: _catalogedBarcodeGetLinks,
  attachLinks: _catalogedBarcodeAttachLinks,
  serializeNative: _catalogedBarcodeSerializeNative,
  deserializeNative: _catalogedBarcodeDeserializeNative,
  deserializePropNative: _catalogedBarcodeDeserializePropNative,
  serializeWeb: _catalogedBarcodeSerializeWeb,
  deserializeWeb: _catalogedBarcodeDeserializeWeb,
  deserializePropWeb: _catalogedBarcodeDeserializePropWeb,
  version: 3,
);

int? _catalogedBarcodeGetId(CatalogedBarcode object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _catalogedBarcodeSetId(CatalogedBarcode object, int id) {
  object.id = id;
}

List<IsarLinkBase> _catalogedBarcodeGetLinks(CatalogedBarcode object) {
  return [];
}

void _catalogedBarcodeSerializeNative(
    IsarCollection<CatalogedBarcode> collection,
    IsarRawObject rawObj,
    CatalogedBarcode object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.barcodeUID;
  final _barcodeUID = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_barcodeUID.length) as int;
  final value1 = object.batchID;
  final _batchID = value1;
  final value2 = object.hashCode;
  final _hashCode = value2;
  final value3 = object.height;
  final _height = value3;
  final value4 = object.width;
  final _width = value4;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _barcodeUID);
  writer.writeLong(offsets[1], _batchID);
  writer.writeLong(offsets[2], _hashCode);
  writer.writeDouble(offsets[3], _height);
  writer.writeDouble(offsets[4], _width);
}

CatalogedBarcode _catalogedBarcodeDeserializeNative(
    IsarCollection<CatalogedBarcode> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = CatalogedBarcode();
  object.barcodeUID = reader.readString(offsets[0]);
  object.batchID = reader.readLong(offsets[1]);
  object.height = reader.readDouble(offsets[3]);
  object.id = id;
  object.width = reader.readDouble(offsets[4]);
  return object;
}

P _catalogedBarcodeDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _catalogedBarcodeSerializeWeb(
    IsarCollection<CatalogedBarcode> collection, CatalogedBarcode object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'barcodeUID', object.barcodeUID);
  IsarNative.jsObjectSet(jsObj, 'batchID', object.batchID);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'height', object.height);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'width', object.width);
  return jsObj;
}

CatalogedBarcode _catalogedBarcodeDeserializeWeb(
    IsarCollection<CatalogedBarcode> collection, dynamic jsObj) {
  final object = CatalogedBarcode();
  object.barcodeUID = IsarNative.jsObjectGet(jsObj, 'barcodeUID') ?? '';
  object.batchID =
      IsarNative.jsObjectGet(jsObj, 'batchID') ?? double.negativeInfinity;
  object.height =
      IsarNative.jsObjectGet(jsObj, 'height') ?? double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.width =
      IsarNative.jsObjectGet(jsObj, 'width') ?? double.negativeInfinity;
  return object;
}

P _catalogedBarcodeDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'barcodeUID':
      return (IsarNative.jsObjectGet(jsObj, 'barcodeUID') ?? '') as P;
    case 'batchID':
      return (IsarNative.jsObjectGet(jsObj, 'batchID') ??
          double.negativeInfinity) as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'height':
      return (IsarNative.jsObjectGet(jsObj, 'height') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'width':
      return (IsarNative.jsObjectGet(jsObj, 'width') ?? double.negativeInfinity)
          as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _catalogedBarcodeAttachLinks(
    IsarCollection col, int id, CatalogedBarcode object) {}

extension CatalogedBarcodeQueryWhereSort
    on QueryBuilder<CatalogedBarcode, CatalogedBarcode, QWhere> {
  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension CatalogedBarcodeQueryWhere
    on QueryBuilder<CatalogedBarcode, CatalogedBarcode, QWhereClause> {
  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension CatalogedBarcodeQueryFilter
    on QueryBuilder<CatalogedBarcode, CatalogedBarcode, QFilterCondition> {
  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      barcodeUIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'barcodeUID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      barcodeUIDGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'barcodeUID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      barcodeUIDLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'barcodeUID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      barcodeUIDBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'barcodeUID',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      barcodeUIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'barcodeUID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      barcodeUIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'barcodeUID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      barcodeUIDContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'barcodeUID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      barcodeUIDMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'barcodeUID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      batchIDEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'batchID',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      batchIDGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'batchID',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      batchIDLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'batchID',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      batchIDBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'batchID',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      heightGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'height',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      heightLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'height',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      heightBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'height',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      widthGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'width',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      widthLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'width',
      value: value,
    ));
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterFilterCondition>
      widthBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'width',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }
}

extension CatalogedBarcodeQueryLinks
    on QueryBuilder<CatalogedBarcode, CatalogedBarcode, QFilterCondition> {}

extension CatalogedBarcodeQueryWhereSortBy
    on QueryBuilder<CatalogedBarcode, CatalogedBarcode, QSortBy> {
  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      sortByBarcodeUID() {
    return addSortByInternal('barcodeUID', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      sortByBarcodeUIDDesc() {
    return addSortByInternal('barcodeUID', Sort.desc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      sortByBatchID() {
    return addSortByInternal('batchID', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      sortByBatchIDDesc() {
    return addSortByInternal('batchID', Sort.desc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      sortByHeight() {
    return addSortByInternal('height', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      sortByHeightDesc() {
    return addSortByInternal('height', Sort.desc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy> sortByWidth() {
    return addSortByInternal('width', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      sortByWidthDesc() {
    return addSortByInternal('width', Sort.desc);
  }
}

extension CatalogedBarcodeQueryWhereSortThenBy
    on QueryBuilder<CatalogedBarcode, CatalogedBarcode, QSortThenBy> {
  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      thenByBarcodeUID() {
    return addSortByInternal('barcodeUID', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      thenByBarcodeUIDDesc() {
    return addSortByInternal('barcodeUID', Sort.desc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      thenByBatchID() {
    return addSortByInternal('batchID', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      thenByBatchIDDesc() {
    return addSortByInternal('batchID', Sort.desc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      thenByHeight() {
    return addSortByInternal('height', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      thenByHeightDesc() {
    return addSortByInternal('height', Sort.desc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy> thenByWidth() {
    return addSortByInternal('width', Sort.asc);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QAfterSortBy>
      thenByWidthDesc() {
    return addSortByInternal('width', Sort.desc);
  }
}

extension CatalogedBarcodeQueryWhereDistinct
    on QueryBuilder<CatalogedBarcode, CatalogedBarcode, QDistinct> {
  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QDistinct>
      distinctByBarcodeUID({bool caseSensitive = true}) {
    return addDistinctByInternal('barcodeUID', caseSensitive: caseSensitive);
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QDistinct>
      distinctByBatchID() {
    return addDistinctByInternal('batchID');
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QDistinct>
      distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QDistinct>
      distinctByHeight() {
    return addDistinctByInternal('height');
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<CatalogedBarcode, CatalogedBarcode, QDistinct>
      distinctByWidth() {
    return addDistinctByInternal('width');
  }
}

extension CatalogedBarcodeQueryProperty
    on QueryBuilder<CatalogedBarcode, CatalogedBarcode, QQueryProperty> {
  QueryBuilder<CatalogedBarcode, String, QQueryOperations>
      barcodeUIDProperty() {
    return addPropertyNameInternal('barcodeUID');
  }

  QueryBuilder<CatalogedBarcode, int, QQueryOperations> batchIDProperty() {
    return addPropertyNameInternal('batchID');
  }

  QueryBuilder<CatalogedBarcode, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<CatalogedBarcode, double, QQueryOperations> heightProperty() {
    return addPropertyNameInternal('height');
  }

  QueryBuilder<CatalogedBarcode, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<CatalogedBarcode, double, QQueryOperations> widthProperty() {
    return addPropertyNameInternal('width');
  }
}
