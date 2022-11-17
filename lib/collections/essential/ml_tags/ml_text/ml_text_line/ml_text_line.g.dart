// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ml_text_line.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMLTextLineCollection on Isar {
  IsarCollection<MLTextLine> get mLTextLines => this.collection();
}

const MLTextLineSchema = CollectionSchema(
  name: r'MLTextLine',
  id: 2879849268760489994,
  properties: {
    r'blockIndex': PropertySchema(
      id: 0,
      name: r'blockIndex',
      type: IsarType.long,
    ),
    r'blockUID': PropertySchema(
      id: 1,
      name: r'blockUID',
      type: IsarType.string,
    ),
    r'cornerPoints': PropertySchema(
      id: 2,
      name: r'cornerPoints',
      type: IsarType.object,
      target: r'CornerPoints',
    ),
    r'recognizedLanguages': PropertySchema(
      id: 3,
      name: r'recognizedLanguages',
      type: IsarType.stringList,
    ),
    r'uid': PropertySchema(
      id: 4,
      name: r'uid',
      type: IsarType.string,
    )
  },
  estimateSize: _mLTextLineEstimateSize,
  serialize: _mLTextLineSerialize,
  deserialize: _mLTextLineDeserialize,
  deserializeProp: _mLTextLineDeserializeProp,
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
  embeddedSchemas: {r'CornerPoints': CornerPointsSchema},
  getId: _mLTextLineGetId,
  getLinks: _mLTextLineGetLinks,
  attach: _mLTextLineAttach,
  version: '3.0.2',
);

int _mLTextLineEstimateSize(
  MLTextLine object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.blockUID.length * 3;
  bytesCount += 3 +
      CornerPointsSchema.estimateSize(
          object.cornerPoints, allOffsets[CornerPoints]!, allOffsets);
  bytesCount += 3 + object.recognizedLanguages.length * 3;
  {
    for (var i = 0; i < object.recognizedLanguages.length; i++) {
      final value = object.recognizedLanguages[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _mLTextLineSerialize(
  MLTextLine object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.blockIndex);
  writer.writeString(offsets[1], object.blockUID);
  writer.writeObject<CornerPoints>(
    offsets[2],
    allOffsets,
    CornerPointsSchema.serialize,
    object.cornerPoints,
  );
  writer.writeStringList(offsets[3], object.recognizedLanguages);
  writer.writeString(offsets[4], object.uid);
}

MLTextLine _mLTextLineDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MLTextLine();
  object.blockIndex = reader.readLong(offsets[0]);
  object.blockUID = reader.readString(offsets[1]);
  object.cornerPoints = reader.readObjectOrNull<CornerPoints>(
        offsets[2],
        CornerPointsSchema.deserialize,
        allOffsets,
      ) ??
      CornerPoints();
  object.id = id;
  object.recognizedLanguages = reader.readStringList(offsets[3]) ?? [];
  object.uid = reader.readString(offsets[4]);
  return object;
}

P _mLTextLineDeserializeProp<P>(
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
    case 2:
      return (reader.readObjectOrNull<CornerPoints>(
            offset,
            CornerPointsSchema.deserialize,
            allOffsets,
          ) ??
          CornerPoints()) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mLTextLineGetId(MLTextLine object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mLTextLineGetLinks(MLTextLine object) {
  return [];
}

void _mLTextLineAttach(IsarCollection<dynamic> col, Id id, MLTextLine object) {
  object.id = id;
}

extension MLTextLineByIndex on IsarCollection<MLTextLine> {
  Future<MLTextLine?> getByUid(String uid) {
    return getByIndex(r'uid', [uid]);
  }

  MLTextLine? getByUidSync(String uid) {
    return getByIndexSync(r'uid', [uid]);
  }

  Future<bool> deleteByUid(String uid) {
    return deleteByIndex(r'uid', [uid]);
  }

  bool deleteByUidSync(String uid) {
    return deleteByIndexSync(r'uid', [uid]);
  }

  Future<List<MLTextLine?>> getAllByUid(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uid', values);
  }

  List<MLTextLine?> getAllByUidSync(List<String> uidValues) {
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

  Future<Id> putByUid(MLTextLine object) {
    return putByIndex(r'uid', object);
  }

  Id putByUidSync(MLTextLine object, {bool saveLinks = true}) {
    return putByIndexSync(r'uid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUid(List<MLTextLine> objects) {
    return putAllByIndex(r'uid', objects);
  }

  List<Id> putAllByUidSync(List<MLTextLine> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'uid', objects, saveLinks: saveLinks);
  }
}

extension MLTextLineQueryWhereSort
    on QueryBuilder<MLTextLine, MLTextLine, QWhere> {
  QueryBuilder<MLTextLine, MLTextLine, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MLTextLineQueryWhere
    on QueryBuilder<MLTextLine, MLTextLine, QWhereClause> {
  QueryBuilder<MLTextLine, MLTextLine, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterWhereClause> idBetween(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterWhereClause> uidEqualTo(
      String uid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [uid],
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterWhereClause> uidNotEqualTo(
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

extension MLTextLineQueryFilter
    on QueryBuilder<MLTextLine, MLTextLine, QFilterCondition> {
  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> blockIndexEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      blockIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      blockIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> blockIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> blockUIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      blockUIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> blockUIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> blockUIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockUID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      blockUIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'blockUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> blockUIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'blockUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> blockUIDContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'blockUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> blockUIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'blockUID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      blockUIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      blockUIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'blockUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recognizedLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recognizedLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recognizedLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recognizedLanguages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recognizedLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recognizedLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recognizedLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recognizedLanguages',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recognizedLanguages',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recognizedLanguages',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recognizedLanguages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recognizedLanguages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recognizedLanguages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recognizedLanguages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recognizedLanguages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition>
      recognizedLanguagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recognizedLanguages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> uidEqualTo(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> uidGreaterThan(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> uidLessThan(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> uidBetween(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> uidStartsWith(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> uidEndsWith(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> uidContains(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> uidMatches(
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

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }
}

extension MLTextLineQueryObject
    on QueryBuilder<MLTextLine, MLTextLine, QFilterCondition> {
  QueryBuilder<MLTextLine, MLTextLine, QAfterFilterCondition> cornerPoints(
      FilterQuery<CornerPoints> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'cornerPoints');
    });
  }
}

extension MLTextLineQueryLinks
    on QueryBuilder<MLTextLine, MLTextLine, QFilterCondition> {}

extension MLTextLineQuerySortBy
    on QueryBuilder<MLTextLine, MLTextLine, QSortBy> {
  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> sortByBlockIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockIndex', Sort.asc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> sortByBlockIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockIndex', Sort.desc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> sortByBlockUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockUID', Sort.asc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> sortByBlockUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockUID', Sort.desc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension MLTextLineQuerySortThenBy
    on QueryBuilder<MLTextLine, MLTextLine, QSortThenBy> {
  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> thenByBlockIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockIndex', Sort.asc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> thenByBlockIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockIndex', Sort.desc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> thenByBlockUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockUID', Sort.asc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> thenByBlockUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockUID', Sort.desc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension MLTextLineQueryWhereDistinct
    on QueryBuilder<MLTextLine, MLTextLine, QDistinct> {
  QueryBuilder<MLTextLine, MLTextLine, QDistinct> distinctByBlockIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockIndex');
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QDistinct> distinctByBlockUID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockUID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QDistinct>
      distinctByRecognizedLanguages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recognizedLanguages');
    });
  }

  QueryBuilder<MLTextLine, MLTextLine, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }
}

extension MLTextLineQueryProperty
    on QueryBuilder<MLTextLine, MLTextLine, QQueryProperty> {
  QueryBuilder<MLTextLine, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MLTextLine, int, QQueryOperations> blockIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockIndex');
    });
  }

  QueryBuilder<MLTextLine, String, QQueryOperations> blockUIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockUID');
    });
  }

  QueryBuilder<MLTextLine, CornerPoints, QQueryOperations>
      cornerPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cornerPoints');
    });
  }

  QueryBuilder<MLTextLine, List<String>, QQueryOperations>
      recognizedLanguagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recognizedLanguages');
    });
  }

  QueryBuilder<MLTextLine, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }
}
