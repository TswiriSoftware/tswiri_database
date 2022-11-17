// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ml_text_element.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMLTextElementCollection on Isar {
  IsarCollection<MLTextElement> get mLTextElements => this.collection();
}

const MLTextElementSchema = CollectionSchema(
  name: r'MLTextElement',
  id: -8153687795569615519,
  properties: {
    r'cornerPoints': PropertySchema(
      id: 0,
      name: r'cornerPoints',
      type: IsarType.object,
      target: r'CornerPoints',
    ),
    r'lineIndex': PropertySchema(
      id: 1,
      name: r'lineIndex',
      type: IsarType.long,
    ),
    r'lineUID': PropertySchema(
      id: 2,
      name: r'lineUID',
      type: IsarType.string,
    ),
    r'mlDetectedElementTextUID': PropertySchema(
      id: 3,
      name: r'mlDetectedElementTextUID',
      type: IsarType.string,
    ),
    r'photoUID': PropertySchema(
      id: 4,
      name: r'photoUID',
      type: IsarType.string,
    ),
    r'uid': PropertySchema(
      id: 5,
      name: r'uid',
      type: IsarType.string,
    ),
    r'userFeedback': PropertySchema(
      id: 6,
      name: r'userFeedback',
      type: IsarType.bool,
    )
  },
  estimateSize: _mLTextElementEstimateSize,
  serialize: _mLTextElementSerialize,
  deserialize: _mLTextElementDeserialize,
  deserializeProp: _mLTextElementDeserializeProp,
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
  getId: _mLTextElementGetId,
  getLinks: _mLTextElementGetLinks,
  attach: _mLTextElementAttach,
  version: '3.0.2',
);

int _mLTextElementEstimateSize(
  MLTextElement object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      CornerPointsSchema.estimateSize(
          object.cornerPoints, allOffsets[CornerPoints]!, allOffsets);
  bytesCount += 3 + object.lineUID.length * 3;
  bytesCount += 3 + object.mlDetectedElementTextUID.length * 3;
  bytesCount += 3 + object.photoUID.length * 3;
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _mLTextElementSerialize(
  MLTextElement object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<CornerPoints>(
    offsets[0],
    allOffsets,
    CornerPointsSchema.serialize,
    object.cornerPoints,
  );
  writer.writeLong(offsets[1], object.lineIndex);
  writer.writeString(offsets[2], object.lineUID);
  writer.writeString(offsets[3], object.mlDetectedElementTextUID);
  writer.writeString(offsets[4], object.photoUID);
  writer.writeString(offsets[5], object.uid);
  writer.writeBool(offsets[6], object.userFeedback);
}

MLTextElement _mLTextElementDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MLTextElement();
  object.cornerPoints = reader.readObjectOrNull<CornerPoints>(
        offsets[0],
        CornerPointsSchema.deserialize,
        allOffsets,
      ) ??
      CornerPoints();
  object.id = id;
  object.lineIndex = reader.readLong(offsets[1]);
  object.lineUID = reader.readString(offsets[2]);
  object.mlDetectedElementTextUID = reader.readString(offsets[3]);
  object.photoUID = reader.readString(offsets[4]);
  object.uid = reader.readString(offsets[5]);
  object.userFeedback = reader.readBoolOrNull(offsets[6]);
  return object;
}

P _mLTextElementDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<CornerPoints>(
            offset,
            CornerPointsSchema.deserialize,
            allOffsets,
          ) ??
          CornerPoints()) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mLTextElementGetId(MLTextElement object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mLTextElementGetLinks(MLTextElement object) {
  return [];
}

void _mLTextElementAttach(
    IsarCollection<dynamic> col, Id id, MLTextElement object) {
  object.id = id;
}

extension MLTextElementByIndex on IsarCollection<MLTextElement> {
  Future<MLTextElement?> getByUid(String uid) {
    return getByIndex(r'uid', [uid]);
  }

  MLTextElement? getByUidSync(String uid) {
    return getByIndexSync(r'uid', [uid]);
  }

  Future<bool> deleteByUid(String uid) {
    return deleteByIndex(r'uid', [uid]);
  }

  bool deleteByUidSync(String uid) {
    return deleteByIndexSync(r'uid', [uid]);
  }

  Future<List<MLTextElement?>> getAllByUid(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uid', values);
  }

  List<MLTextElement?> getAllByUidSync(List<String> uidValues) {
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

  Future<Id> putByUid(MLTextElement object) {
    return putByIndex(r'uid', object);
  }

  Id putByUidSync(MLTextElement object, {bool saveLinks = true}) {
    return putByIndexSync(r'uid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUid(List<MLTextElement> objects) {
    return putAllByIndex(r'uid', objects);
  }

  List<Id> putAllByUidSync(List<MLTextElement> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uid', objects, saveLinks: saveLinks);
  }
}

extension MLTextElementQueryWhereSort
    on QueryBuilder<MLTextElement, MLTextElement, QWhere> {
  QueryBuilder<MLTextElement, MLTextElement, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MLTextElementQueryWhere
    on QueryBuilder<MLTextElement, MLTextElement, QWhereClause> {
  QueryBuilder<MLTextElement, MLTextElement, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterWhereClause> idBetween(
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterWhereClause> uidEqualTo(
      String uid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [uid],
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterWhereClause> uidNotEqualTo(
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

extension MLTextElementQueryFilter
    on QueryBuilder<MLTextElement, MLTextElement, QFilterCondition> {
  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lineIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lineIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lineIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lineIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineUIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lineUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineUIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lineUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineUIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lineUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineUIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lineUID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineUIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lineUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineUIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lineUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineUIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lineUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineUIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lineUID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineUIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lineUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      lineUIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lineUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      mlDetectedElementTextUIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mlDetectedElementTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      mlDetectedElementTextUIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mlDetectedElementTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      mlDetectedElementTextUIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mlDetectedElementTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      mlDetectedElementTextUIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mlDetectedElementTextUID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      mlDetectedElementTextUIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mlDetectedElementTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      mlDetectedElementTextUIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mlDetectedElementTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      mlDetectedElementTextUIDContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mlDetectedElementTextUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      mlDetectedElementTextUIDMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mlDetectedElementTextUID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      mlDetectedElementTextUIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mlDetectedElementTextUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      mlDetectedElementTextUIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mlDetectedElementTextUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      photoUIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      photoUIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoUID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      photoUIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      photoUIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoUID',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition> uidEqualTo(
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition> uidLessThan(
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition> uidBetween(
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition> uidEndsWith(
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition> uidContains(
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition> uidMatches(
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

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      userFeedbackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userFeedback',
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      userFeedbackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userFeedback',
      ));
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      userFeedbackEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userFeedback',
        value: value,
      ));
    });
  }
}

extension MLTextElementQueryObject
    on QueryBuilder<MLTextElement, MLTextElement, QFilterCondition> {
  QueryBuilder<MLTextElement, MLTextElement, QAfterFilterCondition>
      cornerPoints(FilterQuery<CornerPoints> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'cornerPoints');
    });
  }
}

extension MLTextElementQueryLinks
    on QueryBuilder<MLTextElement, MLTextElement, QFilterCondition> {}

extension MLTextElementQuerySortBy
    on QueryBuilder<MLTextElement, MLTextElement, QSortBy> {
  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> sortByLineIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineIndex', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      sortByLineIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineIndex', Sort.desc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> sortByLineUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineUID', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> sortByLineUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineUID', Sort.desc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      sortByMlDetectedElementTextUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mlDetectedElementTextUID', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      sortByMlDetectedElementTextUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mlDetectedElementTextUID', Sort.desc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> sortByPhotoUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUID', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      sortByPhotoUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUID', Sort.desc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      sortByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      sortByUserFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.desc);
    });
  }
}

extension MLTextElementQuerySortThenBy
    on QueryBuilder<MLTextElement, MLTextElement, QSortThenBy> {
  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> thenByLineIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineIndex', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      thenByLineIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineIndex', Sort.desc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> thenByLineUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineUID', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> thenByLineUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineUID', Sort.desc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      thenByMlDetectedElementTextUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mlDetectedElementTextUID', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      thenByMlDetectedElementTextUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mlDetectedElementTextUID', Sort.desc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> thenByPhotoUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUID', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      thenByPhotoUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUID', Sort.desc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      thenByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.asc);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QAfterSortBy>
      thenByUserFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.desc);
    });
  }
}

extension MLTextElementQueryWhereDistinct
    on QueryBuilder<MLTextElement, MLTextElement, QDistinct> {
  QueryBuilder<MLTextElement, MLTextElement, QDistinct> distinctByLineIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lineIndex');
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QDistinct> distinctByLineUID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lineUID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QDistinct>
      distinctByMlDetectedElementTextUID({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mlDetectedElementTextUID',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QDistinct> distinctByPhotoUID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoUID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MLTextElement, MLTextElement, QDistinct>
      distinctByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userFeedback');
    });
  }
}

extension MLTextElementQueryProperty
    on QueryBuilder<MLTextElement, MLTextElement, QQueryProperty> {
  QueryBuilder<MLTextElement, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MLTextElement, CornerPoints, QQueryOperations>
      cornerPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cornerPoints');
    });
  }

  QueryBuilder<MLTextElement, int, QQueryOperations> lineIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lineIndex');
    });
  }

  QueryBuilder<MLTextElement, String, QQueryOperations> lineUIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lineUID');
    });
  }

  QueryBuilder<MLTextElement, String, QQueryOperations>
      mlDetectedElementTextUIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mlDetectedElementTextUID');
    });
  }

  QueryBuilder<MLTextElement, String, QQueryOperations> photoUIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoUID');
    });
  }

  QueryBuilder<MLTextElement, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }

  QueryBuilder<MLTextElement, bool?, QQueryOperations> userFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userFeedback');
    });
  }
}
