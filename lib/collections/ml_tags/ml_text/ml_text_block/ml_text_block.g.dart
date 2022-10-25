// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ml_text_block.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMLTextBlockCollection on Isar {
  IsarCollection<MLTextBlock> get mLTextBlocks => this.collection();
}

const MLTextBlockSchema = CollectionSchema(
  name: r'MLTextBlock',
  id: 9126700708740949900,
  properties: {
    r'cornerPoints': PropertySchema(
      id: 0,
      name: r'cornerPoints',
      type: IsarType.object,
      target: r'CornerPoints',
    ),
    r'recognizedLanguages': PropertySchema(
      id: 1,
      name: r'recognizedLanguages',
      type: IsarType.stringList,
    )
  },
  estimateSize: _mLTextBlockEstimateSize,
  serialize: _mLTextBlockSerialize,
  deserialize: _mLTextBlockDeserialize,
  deserializeProp: _mLTextBlockDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'CornerPoints': CornerPointsSchema},
  getId: _mLTextBlockGetId,
  getLinks: _mLTextBlockGetLinks,
  attach: _mLTextBlockAttach,
  version: '3.0.2',
);

int _mLTextBlockEstimateSize(
  MLTextBlock object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
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
  return bytesCount;
}

void _mLTextBlockSerialize(
  MLTextBlock object,
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
  writer.writeStringList(offsets[1], object.recognizedLanguages);
}

MLTextBlock _mLTextBlockDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MLTextBlock();
  object.cornerPoints = reader.readObjectOrNull<CornerPoints>(
        offsets[0],
        CornerPointsSchema.deserialize,
        allOffsets,
      ) ??
      CornerPoints();
  object.id = id;
  object.recognizedLanguages = reader.readStringList(offsets[1]) ?? [];
  return object;
}

P _mLTextBlockDeserializeProp<P>(
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
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mLTextBlockGetId(MLTextBlock object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mLTextBlockGetLinks(MLTextBlock object) {
  return [];
}

void _mLTextBlockAttach(
    IsarCollection<dynamic> col, Id id, MLTextBlock object) {
  object.id = id;
}

extension MLTextBlockQueryWhereSort
    on QueryBuilder<MLTextBlock, MLTextBlock, QWhere> {
  QueryBuilder<MLTextBlock, MLTextBlock, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MLTextBlockQueryWhere
    on QueryBuilder<MLTextBlock, MLTextBlock, QWhereClause> {
  QueryBuilder<MLTextBlock, MLTextBlock, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterWhereClause> idBetween(
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

extension MLTextBlockQueryFilter
    on QueryBuilder<MLTextBlock, MLTextBlock, QFilterCondition> {
  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
      recognizedLanguagesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recognizedLanguages',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
      recognizedLanguagesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recognizedLanguages',
        value: '',
      ));
    });
  }

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition>
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
}

extension MLTextBlockQueryObject
    on QueryBuilder<MLTextBlock, MLTextBlock, QFilterCondition> {
  QueryBuilder<MLTextBlock, MLTextBlock, QAfterFilterCondition> cornerPoints(
      FilterQuery<CornerPoints> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'cornerPoints');
    });
  }
}

extension MLTextBlockQueryLinks
    on QueryBuilder<MLTextBlock, MLTextBlock, QFilterCondition> {}

extension MLTextBlockQuerySortBy
    on QueryBuilder<MLTextBlock, MLTextBlock, QSortBy> {}

extension MLTextBlockQuerySortThenBy
    on QueryBuilder<MLTextBlock, MLTextBlock, QSortThenBy> {
  QueryBuilder<MLTextBlock, MLTextBlock, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MLTextBlock, MLTextBlock, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension MLTextBlockQueryWhereDistinct
    on QueryBuilder<MLTextBlock, MLTextBlock, QDistinct> {
  QueryBuilder<MLTextBlock, MLTextBlock, QDistinct>
      distinctByRecognizedLanguages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recognizedLanguages');
    });
  }
}

extension MLTextBlockQueryProperty
    on QueryBuilder<MLTextBlock, MLTextBlock, QQueryProperty> {
  QueryBuilder<MLTextBlock, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MLTextBlock, CornerPoints, QQueryOperations>
      cornerPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cornerPoints');
    });
  }

  QueryBuilder<MLTextBlock, List<String>, QQueryOperations>
      recognizedLanguagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recognizedLanguages');
    });
  }
}
