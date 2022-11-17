// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cataloged_coordinate.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCatalogedCoordinateCollection on Isar {
  IsarCollection<CatalogedCoordinate> get catalogedCoordinates =>
      this.collection();
}

const CatalogedCoordinateSchema = CollectionSchema(
  name: r'CatalogedCoordinate',
  id: -3206886641433459108,
  properties: {
    r'barcodeUID': PropertySchema(
      id: 0,
      name: r'barcodeUID',
      type: IsarType.string,
    ),
    r'coordinate': PropertySchema(
      id: 1,
      name: r'coordinate',
      type: IsarType.object,
      target: r'EmbeddedVector3',
    ),
    r'gridUID': PropertySchema(
      id: 2,
      name: r'gridUID',
      type: IsarType.string,
    ),
    r'rotation': PropertySchema(
      id: 3,
      name: r'rotation',
      type: IsarType.object,
      target: r'EmbeddedVector3',
    ),
    r'timestamp': PropertySchema(
      id: 4,
      name: r'timestamp',
      type: IsarType.long,
    ),
    r'uid': PropertySchema(
      id: 5,
      name: r'uid',
      type: IsarType.string,
    )
  },
  estimateSize: _catalogedCoordinateEstimateSize,
  serialize: _catalogedCoordinateSerialize,
  deserialize: _catalogedCoordinateDeserialize,
  deserializeProp: _catalogedCoordinateDeserializeProp,
  idName: r'id',
  indexes: {
    r'uid': IndexSchema(
      id: 8193695471701937315,
      name: r'uid',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'EmbeddedVector3': EmbeddedVector3Schema},
  getId: _catalogedCoordinateGetId,
  getLinks: _catalogedCoordinateGetLinks,
  attach: _catalogedCoordinateAttach,
  version: '3.0.2',
);

int _catalogedCoordinateEstimateSize(
  CatalogedCoordinate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.barcodeUID.length * 3;
  {
    final value = object.coordinate;
    if (value != null) {
      bytesCount += 3 +
          EmbeddedVector3Schema.estimateSize(
              value, allOffsets[EmbeddedVector3]!, allOffsets);
    }
  }
  bytesCount += 3 + object.gridUID.length * 3;
  {
    final value = object.rotation;
    if (value != null) {
      bytesCount += 3 +
          EmbeddedVector3Schema.estimateSize(
              value, allOffsets[EmbeddedVector3]!, allOffsets);
    }
  }
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _catalogedCoordinateSerialize(
  CatalogedCoordinate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.barcodeUID);
  writer.writeObject<EmbeddedVector3>(
    offsets[1],
    allOffsets,
    EmbeddedVector3Schema.serialize,
    object.coordinate,
  );
  writer.writeString(offsets[2], object.gridUID);
  writer.writeObject<EmbeddedVector3>(
    offsets[3],
    allOffsets,
    EmbeddedVector3Schema.serialize,
    object.rotation,
  );
  writer.writeLong(offsets[4], object.timestamp);
  writer.writeString(offsets[5], object.uid);
}

CatalogedCoordinate _catalogedCoordinateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CatalogedCoordinate();
  object.barcodeUID = reader.readString(offsets[0]);
  object.coordinate = reader.readObjectOrNull<EmbeddedVector3>(
    offsets[1],
    EmbeddedVector3Schema.deserialize,
    allOffsets,
  );
  object.gridUID = reader.readString(offsets[2]);
  object.id = id;
  object.rotation = reader.readObjectOrNull<EmbeddedVector3>(
    offsets[3],
    EmbeddedVector3Schema.deserialize,
    allOffsets,
  );
  object.timestamp = reader.readLong(offsets[4]);
  object.uid = reader.readString(offsets[5]);
  return object;
}

P _catalogedCoordinateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<EmbeddedVector3>(
        offset,
        EmbeddedVector3Schema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<EmbeddedVector3>(
        offset,
        EmbeddedVector3Schema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _catalogedCoordinateGetId(CatalogedCoordinate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _catalogedCoordinateGetLinks(
    CatalogedCoordinate object) {
  return [];
}

void _catalogedCoordinateAttach(
    IsarCollection<dynamic> col, Id id, CatalogedCoordinate object) {
  object.id = id;
}

extension CatalogedCoordinateByIndex on IsarCollection<CatalogedCoordinate> {
  Future<CatalogedCoordinate?> getByUid(String uid) {
    return getByIndex(r'uid', [uid]);
  }

  CatalogedCoordinate? getByUidSync(String uid) {
    return getByIndexSync(r'uid', [uid]);
  }

  Future<bool> deleteByUid(String uid) {
    return deleteByIndex(r'uid', [uid]);
  }

  bool deleteByUidSync(String uid) {
    return deleteByIndexSync(r'uid', [uid]);
  }

  Future<List<CatalogedCoordinate?>> getAllByUid(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uid', values);
  }

  List<CatalogedCoordinate?> getAllByUidSync(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uid', values);
  }

  Future<int> deleteAllByUid(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uid', values);
  }

  int deleteAllByUidSync(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uid', values);
  }

  Future<Id> putByUid(CatalogedCoordinate object) {
    return putByIndex(r'uid', object);
  }

  Id putByUidSync(CatalogedCoordinate object, {bool saveLinks = true}) {
    return putByIndexSync(r'uid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUid(List<CatalogedCoordinate> objects) {
    return putAllByIndex(r'uid', objects);
  }

  List<Id> putAllByUidSync(List<CatalogedCoordinate> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uid', objects, saveLinks: saveLinks);
  }
}

extension CatalogedCoordinateQueryWhereSort
    on QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QWhere> {
  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CatalogedCoordinateQueryWhere
    on QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QWhereClause> {
  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterWhereClause>
      uidEqualTo(String uid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [uid],
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterWhereClause>
      uidNotEqualTo(String uid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [],
              upper: [uid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [uid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [uid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [],
              upper: [uid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CatalogedCoordinateQueryFilter on QueryBuilder<CatalogedCoordinate,
    CatalogedCoordinate, QFilterCondition> {
  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      barcodeUIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcodeUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      barcodeUIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'barcodeUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      barcodeUIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'barcodeUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      barcodeUIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'barcodeUID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      barcodeUIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'barcodeUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      barcodeUIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'barcodeUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      barcodeUIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'barcodeUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      barcodeUIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'barcodeUID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      barcodeUIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcodeUID',
        value: '',
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      barcodeUIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'barcodeUID',
        value: '',
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      coordinateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coordinate',
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      coordinateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coordinate',
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      gridUIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gridUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      gridUIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gridUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      gridUIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gridUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      gridUIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gridUID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      gridUIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gridUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      gridUIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gridUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      gridUIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gridUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      gridUIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gridUID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      gridUIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gridUID',
        value: '',
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      gridUIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gridUID',
        value: '',
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      rotationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rotation',
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      rotationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rotation',
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      timestampEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      timestampGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      timestampLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      timestampBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      uidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      uidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      uidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      uidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      uidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      uidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }
}

extension CatalogedCoordinateQueryObject on QueryBuilder<CatalogedCoordinate,
    CatalogedCoordinate, QFilterCondition> {
  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      coordinate(FilterQuery<EmbeddedVector3> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'coordinate');
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterFilterCondition>
      rotation(FilterQuery<EmbeddedVector3> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'rotation');
    });
  }
}

extension CatalogedCoordinateQueryLinks on QueryBuilder<CatalogedCoordinate,
    CatalogedCoordinate, QFilterCondition> {}

extension CatalogedCoordinateQuerySortBy
    on QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QSortBy> {
  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      sortByBarcodeUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcodeUID', Sort.asc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      sortByBarcodeUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcodeUID', Sort.desc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      sortByGridUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gridUID', Sort.asc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      sortByGridUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gridUID', Sort.desc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension CatalogedCoordinateQuerySortThenBy
    on QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QSortThenBy> {
  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      thenByBarcodeUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcodeUID', Sort.asc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      thenByBarcodeUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcodeUID', Sort.desc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      thenByGridUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gridUID', Sort.asc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      thenByGridUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gridUID', Sort.desc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QAfterSortBy>
      thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension CatalogedCoordinateQueryWhereDistinct
    on QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QDistinct> {
  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QDistinct>
      distinctByBarcodeUID({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'barcodeUID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QDistinct>
      distinctByGridUID({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gridUID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QDistinct>
      distinctByUid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }
}

extension CatalogedCoordinateQueryProperty
    on QueryBuilder<CatalogedCoordinate, CatalogedCoordinate, QQueryProperty> {
  QueryBuilder<CatalogedCoordinate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CatalogedCoordinate, String, QQueryOperations>
      barcodeUIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'barcodeUID');
    });
  }

  QueryBuilder<CatalogedCoordinate, EmbeddedVector3?, QQueryOperations>
      coordinateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coordinate');
    });
  }

  QueryBuilder<CatalogedCoordinate, String, QQueryOperations>
      gridUIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gridUID');
    });
  }

  QueryBuilder<CatalogedCoordinate, EmbeddedVector3?, QQueryOperations>
      rotationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rotation');
    });
  }

  QueryBuilder<CatalogedCoordinate, int, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<CatalogedCoordinate, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }
}
