// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ml_photo_label.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMLPhotoLabelCollection on Isar {
  IsarCollection<MLPhotoLabel> get mLPhotoLabels => this.collection();
}

const MLPhotoLabelSchema = CollectionSchema(
  name: r'MLPhotoLabel',
  id: 2792120286240114426,
  properties: {
    r'confidence': PropertySchema(
      id: 0,
      name: r'confidence',
      type: IsarType.double,
    ),
    r'detectedLabelTextUID': PropertySchema(
      id: 1,
      name: r'detectedLabelTextUID',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 2,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'photoUID': PropertySchema(
      id: 3,
      name: r'photoUID',
      type: IsarType.string,
    ),
    r'uid': PropertySchema(
      id: 4,
      name: r'uid',
      type: IsarType.string,
    ),
    r'userFeedback': PropertySchema(
      id: 5,
      name: r'userFeedback',
      type: IsarType.bool,
    )
  },
  estimateSize: _mLPhotoLabelEstimateSize,
  serialize: _mLPhotoLabelSerialize,
  deserialize: _mLPhotoLabelDeserialize,
  deserializeProp: _mLPhotoLabelDeserializeProp,
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
  embeddedSchemas: {},
  getId: _mLPhotoLabelGetId,
  getLinks: _mLPhotoLabelGetLinks,
  attach: _mLPhotoLabelAttach,
  version: '3.0.2',
);

int _mLPhotoLabelEstimateSize(
  MLPhotoLabel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.detectedLabelTextUID.length * 3;
  bytesCount += 3 + object.photoUID.length * 3;
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _mLPhotoLabelSerialize(
  MLPhotoLabel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.confidence);
  writer.writeString(offsets[1], object.detectedLabelTextUID);
  writer.writeLong(offsets[2], object.hashCode);
  writer.writeString(offsets[3], object.photoUID);
  writer.writeString(offsets[4], object.uid);
  writer.writeBool(offsets[5], object.userFeedback);
}

MLPhotoLabel _mLPhotoLabelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MLPhotoLabel();
  object.confidence = reader.readDouble(offsets[0]);
  object.detectedLabelTextUID = reader.readString(offsets[1]);
  object.id = id;
  object.photoUID = reader.readString(offsets[3]);
  object.uid = reader.readString(offsets[4]);
  object.userFeedback = reader.readBoolOrNull(offsets[5]);
  return object;
}

P _mLPhotoLabelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mLPhotoLabelGetId(MLPhotoLabel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mLPhotoLabelGetLinks(MLPhotoLabel object) {
  return [];
}

void _mLPhotoLabelAttach(
    IsarCollection<dynamic> col, Id id, MLPhotoLabel object) {
  object.id = id;
}

extension MLPhotoLabelByIndex on IsarCollection<MLPhotoLabel> {
  Future<MLPhotoLabel?> getByUid(String uid) {
    return getByIndex(r'uid', [uid]);
  }

  MLPhotoLabel? getByUidSync(String uid) {
    return getByIndexSync(r'uid', [uid]);
  }

  Future<bool> deleteByUid(String uid) {
    return deleteByIndex(r'uid', [uid]);
  }

  bool deleteByUidSync(String uid) {
    return deleteByIndexSync(r'uid', [uid]);
  }

  Future<List<MLPhotoLabel?>> getAllByUid(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uid', values);
  }

  List<MLPhotoLabel?> getAllByUidSync(List<String> uidValues) {
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

  Future<Id> putByUid(MLPhotoLabel object) {
    return putByIndex(r'uid', object);
  }

  Id putByUidSync(MLPhotoLabel object, {bool saveLinks = true}) {
    return putByIndexSync(r'uid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUid(List<MLPhotoLabel> objects) {
    return putAllByIndex(r'uid', objects);
  }

  List<Id> putAllByUidSync(List<MLPhotoLabel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uid', objects, saveLinks: saveLinks);
  }
}

extension MLPhotoLabelQueryWhereSort
    on QueryBuilder<MLPhotoLabel, MLPhotoLabel, QWhere> {
  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MLPhotoLabelQueryWhere
    on QueryBuilder<MLPhotoLabel, MLPhotoLabel, QWhereClause> {
  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterWhereClause> idBetween(
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

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterWhereClause> uidEqualTo(
      String uid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [uid],
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterWhereClause> uidNotEqualTo(
      String uid) {
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

extension MLPhotoLabelQueryFilter
    on QueryBuilder<MLPhotoLabel, MLPhotoLabel, QFilterCondition> {
  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      confidenceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      confidenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      confidenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      confidenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confidence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      detectedLabelTextUIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detectedLabelTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      detectedLabelTextUIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detectedLabelTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      detectedLabelTextUIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detectedLabelTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      detectedLabelTextUIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detectedLabelTextUID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      detectedLabelTextUIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detectedLabelTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      detectedLabelTextUIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detectedLabelTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      detectedLabelTextUIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detectedLabelTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      detectedLabelTextUIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detectedLabelTextUID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      detectedLabelTextUIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detectedLabelTextUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      detectedLabelTextUIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detectedLabelTextUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      photoUIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      photoUIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      photoUIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      photoUIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoUID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      photoUIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photoUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      photoUIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photoUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      photoUIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      photoUIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoUID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      photoUIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      photoUIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> uidEqualTo(
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

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
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

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> uidLessThan(
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

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> uidBetween(
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

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> uidStartsWith(
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

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> uidEndsWith(
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

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> uidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> uidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition> uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      userFeedbackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userFeedback',
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      userFeedbackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userFeedback',
      ));
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterFilterCondition>
      userFeedbackEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userFeedback',
        value: value,
      ));
    });
  }
}

extension MLPhotoLabelQueryObject
    on QueryBuilder<MLPhotoLabel, MLPhotoLabel, QFilterCondition> {}

extension MLPhotoLabelQueryLinks
    on QueryBuilder<MLPhotoLabel, MLPhotoLabel, QFilterCondition> {}

extension MLPhotoLabelQuerySortBy
    on QueryBuilder<MLPhotoLabel, MLPhotoLabel, QSortBy> {
  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> sortByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy>
      sortByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy>
      sortByDetectedLabelTextUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedLabelTextUID', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy>
      sortByDetectedLabelTextUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedLabelTextUID', Sort.desc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> sortByPhotoUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUID', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> sortByPhotoUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUID', Sort.desc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> sortByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy>
      sortByUserFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.desc);
    });
  }
}

extension MLPhotoLabelQuerySortThenBy
    on QueryBuilder<MLPhotoLabel, MLPhotoLabel, QSortThenBy> {
  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> thenByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy>
      thenByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy>
      thenByDetectedLabelTextUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedLabelTextUID', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy>
      thenByDetectedLabelTextUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedLabelTextUID', Sort.desc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> thenByPhotoUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUID', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> thenByPhotoUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUID', Sort.desc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy> thenByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.asc);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QAfterSortBy>
      thenByUserFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.desc);
    });
  }
}

extension MLPhotoLabelQueryWhereDistinct
    on QueryBuilder<MLPhotoLabel, MLPhotoLabel, QDistinct> {
  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QDistinct> distinctByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence');
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QDistinct>
      distinctByDetectedLabelTextUID({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detectedLabelTextUID',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QDistinct> distinctByPhotoUID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoUID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MLPhotoLabel, MLPhotoLabel, QDistinct> distinctByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userFeedback');
    });
  }
}

extension MLPhotoLabelQueryProperty
    on QueryBuilder<MLPhotoLabel, MLPhotoLabel, QQueryProperty> {
  QueryBuilder<MLPhotoLabel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MLPhotoLabel, double, QQueryOperations> confidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence');
    });
  }

  QueryBuilder<MLPhotoLabel, String, QQueryOperations>
      detectedLabelTextUIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detectedLabelTextUID');
    });
  }

  QueryBuilder<MLPhotoLabel, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<MLPhotoLabel, String, QQueryOperations> photoUIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoUID');
    });
  }

  QueryBuilder<MLPhotoLabel, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }

  QueryBuilder<MLPhotoLabel, bool?, QQueryOperations> userFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userFeedback');
    });
  }
}
