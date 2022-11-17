// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDatabaseInfoCollection on Isar {
  IsarCollection<DatabaseInfo> get databaseInfos => this.collection();
}

const DatabaseInfoSchema = CollectionSchema(
  name: r'DatabaseInfo',
  id: 6211956895426422559,
  properties: {
    r'databaseID': PropertySchema(
      id: 0,
      name: r'databaseID',
      type: IsarType.long,
    ),
    r'deviceID': PropertySchema(
      id: 1,
      name: r'deviceID',
      type: IsarType.string,
    )
  },
  estimateSize: _databaseInfoEstimateSize,
  serialize: _databaseInfoSerialize,
  deserialize: _databaseInfoDeserialize,
  deserializeProp: _databaseInfoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _databaseInfoGetId,
  getLinks: _databaseInfoGetLinks,
  attach: _databaseInfoAttach,
  version: '3.0.2',
);

int _databaseInfoEstimateSize(
  DatabaseInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceID.length * 3;
  return bytesCount;
}

void _databaseInfoSerialize(
  DatabaseInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.databaseID);
  writer.writeString(offsets[1], object.deviceID);
}

DatabaseInfo _databaseInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DatabaseInfo();
  object.databaseID = reader.readLong(offsets[0]);
  object.deviceID = reader.readString(offsets[1]);
  object.id = id;
  return object;
}

P _databaseInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _databaseInfoGetId(DatabaseInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _databaseInfoGetLinks(DatabaseInfo object) {
  return [];
}

void _databaseInfoAttach(
    IsarCollection<dynamic> col, Id id, DatabaseInfo object) {
  object.id = id;
}

extension DatabaseInfoQueryWhereSort
    on QueryBuilder<DatabaseInfo, DatabaseInfo, QWhere> {
  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DatabaseInfoQueryWhere
    on QueryBuilder<DatabaseInfo, DatabaseInfo, QWhereClause> {
  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterWhereClause> idBetween(
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
}

extension DatabaseInfoQueryFilter
    on QueryBuilder<DatabaseInfo, DatabaseInfo, QFilterCondition> {
  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      databaseIDEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'databaseID',
        value: value,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      databaseIDGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'databaseID',
        value: value,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      databaseIDLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'databaseID',
        value: value,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      databaseIDBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'databaseID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      deviceIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      deviceIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      deviceIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      deviceIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      deviceIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      deviceIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      deviceIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      deviceIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      deviceIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceID',
        value: '',
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition>
      deviceIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceID',
        value: '',
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterFilterCondition> idBetween(
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
}

extension DatabaseInfoQueryObject
    on QueryBuilder<DatabaseInfo, DatabaseInfo, QFilterCondition> {}

extension DatabaseInfoQueryLinks
    on QueryBuilder<DatabaseInfo, DatabaseInfo, QFilterCondition> {}

extension DatabaseInfoQuerySortBy
    on QueryBuilder<DatabaseInfo, DatabaseInfo, QSortBy> {
  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterSortBy> sortByDatabaseID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseID', Sort.asc);
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterSortBy>
      sortByDatabaseIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseID', Sort.desc);
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterSortBy> sortByDeviceID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceID', Sort.asc);
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterSortBy> sortByDeviceIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceID', Sort.desc);
    });
  }
}

extension DatabaseInfoQuerySortThenBy
    on QueryBuilder<DatabaseInfo, DatabaseInfo, QSortThenBy> {
  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterSortBy> thenByDatabaseID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseID', Sort.asc);
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterSortBy>
      thenByDatabaseIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseID', Sort.desc);
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterSortBy> thenByDeviceID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceID', Sort.asc);
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterSortBy> thenByDeviceIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceID', Sort.desc);
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension DatabaseInfoQueryWhereDistinct
    on QueryBuilder<DatabaseInfo, DatabaseInfo, QDistinct> {
  QueryBuilder<DatabaseInfo, DatabaseInfo, QDistinct> distinctByDatabaseID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'databaseID');
    });
  }

  QueryBuilder<DatabaseInfo, DatabaseInfo, QDistinct> distinctByDeviceID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceID', caseSensitive: caseSensitive);
    });
  }
}

extension DatabaseInfoQueryProperty
    on QueryBuilder<DatabaseInfo, DatabaseInfo, QQueryProperty> {
  QueryBuilder<DatabaseInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DatabaseInfo, int, QQueryOperations> databaseIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'databaseID');
    });
  }

  QueryBuilder<DatabaseInfo, String, QQueryOperations> deviceIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceID');
    });
  }
}
