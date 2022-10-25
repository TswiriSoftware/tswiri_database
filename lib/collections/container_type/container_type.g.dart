// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_type.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetContainerTypeCollection on Isar {
  IsarCollection<ContainerType> get containerTypes => this.collection();
}

const ContainerTypeSchema = CollectionSchema(
  name: r'ContainerType',
  id: -3083188180818376986,
  properties: {
    r'canContain': PropertySchema(
      id: 0,
      name: r'canContain',
      type: IsarType.longList,
    ),
    r'containerColor': PropertySchema(
      id: 1,
      name: r'containerColor',
      type: IsarType.object,
      target: r'EmbeddedColor',
    ),
    r'containerDescription': PropertySchema(
      id: 2,
      name: r'containerDescription',
      type: IsarType.string,
    ),
    r'containerTypeName': PropertySchema(
      id: 3,
      name: r'containerTypeName',
      type: IsarType.string,
    ),
    r'enclosing': PropertySchema(
      id: 4,
      name: r'enclosing',
      type: IsarType.bool,
    ),
    r'iconData': PropertySchema(
      id: 5,
      name: r'iconData',
      type: IsarType.object,
      target: r'EmbeddedIconData',
    ),
    r'moveable': PropertySchema(
      id: 6,
      name: r'moveable',
      type: IsarType.bool,
    ),
    r'preferredChildContainer': PropertySchema(
      id: 7,
      name: r'preferredChildContainer',
      type: IsarType.long,
    )
  },
  estimateSize: _containerTypeEstimateSize,
  serialize: _containerTypeSerialize,
  deserialize: _containerTypeDeserialize,
  deserializeProp: _containerTypeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'EmbeddedColor': EmbeddedColorSchema,
    r'EmbeddedIconData': EmbeddedIconDataSchema
  },
  getId: _containerTypeGetId,
  getLinks: _containerTypeGetLinks,
  attach: _containerTypeAttach,
  version: '3.0.2',
);

int _containerTypeEstimateSize(
  ContainerType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.canContain.length * 8;
  bytesCount += 3 +
      EmbeddedColorSchema.estimateSize(
          object.containerColor, allOffsets[EmbeddedColor]!, allOffsets);
  bytesCount += 3 + object.containerDescription.length * 3;
  bytesCount += 3 + object.containerTypeName.length * 3;
  bytesCount += 3 +
      EmbeddedIconDataSchema.estimateSize(
          object.iconData, allOffsets[EmbeddedIconData]!, allOffsets);
  return bytesCount;
}

void _containerTypeSerialize(
  ContainerType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.canContain);
  writer.writeObject<EmbeddedColor>(
    offsets[1],
    allOffsets,
    EmbeddedColorSchema.serialize,
    object.containerColor,
  );
  writer.writeString(offsets[2], object.containerDescription);
  writer.writeString(offsets[3], object.containerTypeName);
  writer.writeBool(offsets[4], object.enclosing);
  writer.writeObject<EmbeddedIconData>(
    offsets[5],
    allOffsets,
    EmbeddedIconDataSchema.serialize,
    object.iconData,
  );
  writer.writeBool(offsets[6], object.moveable);
  writer.writeLong(offsets[7], object.preferredChildContainer);
}

ContainerType _containerTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ContainerType();
  object.canContain = reader.readLongList(offsets[0]) ?? [];
  object.containerColor = reader.readObjectOrNull<EmbeddedColor>(
        offsets[1],
        EmbeddedColorSchema.deserialize,
        allOffsets,
      ) ??
      EmbeddedColor();
  object.containerDescription = reader.readString(offsets[2]);
  object.containerTypeName = reader.readString(offsets[3]);
  object.enclosing = reader.readBool(offsets[4]);
  object.iconData = reader.readObjectOrNull<EmbeddedIconData>(
        offsets[5],
        EmbeddedIconDataSchema.deserialize,
        allOffsets,
      ) ??
      EmbeddedIconData();
  object.id = id;
  object.moveable = reader.readBool(offsets[6]);
  object.preferredChildContainer = reader.readLong(offsets[7]);
  return object;
}

P _containerTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    case 1:
      return (reader.readObjectOrNull<EmbeddedColor>(
            offset,
            EmbeddedColorSchema.deserialize,
            allOffsets,
          ) ??
          EmbeddedColor()) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<EmbeddedIconData>(
            offset,
            EmbeddedIconDataSchema.deserialize,
            allOffsets,
          ) ??
          EmbeddedIconData()) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _containerTypeGetId(ContainerType object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _containerTypeGetLinks(ContainerType object) {
  return [];
}

void _containerTypeAttach(
    IsarCollection<dynamic> col, Id id, ContainerType object) {
  object.id = id;
}

extension ContainerTypeQueryWhereSort
    on QueryBuilder<ContainerType, ContainerType, QWhere> {
  QueryBuilder<ContainerType, ContainerType, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ContainerTypeQueryWhere
    on QueryBuilder<ContainerType, ContainerType, QWhereClause> {
  QueryBuilder<ContainerType, ContainerType, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ContainerType, ContainerType, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterWhereClause> idBetween(
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

extension ContainerTypeQueryFilter
    on QueryBuilder<ContainerType, ContainerType, QFilterCondition> {
  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      canContainElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canContain',
        value: value,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      canContainElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'canContain',
        value: value,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      canContainElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'canContain',
        value: value,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      canContainElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'canContain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      canContainLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canContain',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      canContainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canContain',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      canContainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canContain',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      canContainLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canContain',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      canContainLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canContain',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      canContainLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canContain',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'containerDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'containerDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'containerDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'containerDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'containerDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'containerDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'containerDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'containerDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerTypeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerTypeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'containerTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerTypeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'containerTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerTypeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'containerTypeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerTypeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'containerTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerTypeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'containerTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerTypeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'containerTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerTypeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'containerTypeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerTypeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerTypeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'containerTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      enclosingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enclosing',
        value: value,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
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

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      moveableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moveable',
        value: value,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      preferredChildContainerEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredChildContainer',
        value: value,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      preferredChildContainerGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredChildContainer',
        value: value,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      preferredChildContainerLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredChildContainer',
        value: value,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      preferredChildContainerBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredChildContainer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ContainerTypeQueryObject
    on QueryBuilder<ContainerType, ContainerType, QFilterCondition> {
  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerColor(FilterQuery<EmbeddedColor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'containerColor');
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition> iconData(
      FilterQuery<EmbeddedIconData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'iconData');
    });
  }
}

extension ContainerTypeQueryLinks
    on QueryBuilder<ContainerType, ContainerType, QFilterCondition> {}

extension ContainerTypeQuerySortBy
    on QueryBuilder<ContainerType, ContainerType, QSortBy> {
  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      sortByContainerDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerDescription', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      sortByContainerDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerDescription', Sort.desc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      sortByContainerTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerTypeName', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      sortByContainerTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerTypeName', Sort.desc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> sortByEnclosing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enclosing', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      sortByEnclosingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enclosing', Sort.desc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> sortByMoveable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moveable', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      sortByMoveableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moveable', Sort.desc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      sortByPreferredChildContainer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredChildContainer', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      sortByPreferredChildContainerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredChildContainer', Sort.desc);
    });
  }
}

extension ContainerTypeQuerySortThenBy
    on QueryBuilder<ContainerType, ContainerType, QSortThenBy> {
  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      thenByContainerDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerDescription', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      thenByContainerDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerDescription', Sort.desc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      thenByContainerTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerTypeName', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      thenByContainerTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerTypeName', Sort.desc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> thenByEnclosing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enclosing', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      thenByEnclosingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enclosing', Sort.desc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> thenByMoveable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moveable', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      thenByMoveableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moveable', Sort.desc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      thenByPreferredChildContainer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredChildContainer', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      thenByPreferredChildContainerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredChildContainer', Sort.desc);
    });
  }
}

extension ContainerTypeQueryWhereDistinct
    on QueryBuilder<ContainerType, ContainerType, QDistinct> {
  QueryBuilder<ContainerType, ContainerType, QDistinct> distinctByCanContain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canContain');
    });
  }

  QueryBuilder<ContainerType, ContainerType, QDistinct>
      distinctByContainerDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'containerDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QDistinct>
      distinctByContainerTypeName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'containerTypeName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QDistinct> distinctByEnclosing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enclosing');
    });
  }

  QueryBuilder<ContainerType, ContainerType, QDistinct> distinctByMoveable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moveable');
    });
  }

  QueryBuilder<ContainerType, ContainerType, QDistinct>
      distinctByPreferredChildContainer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredChildContainer');
    });
  }
}

extension ContainerTypeQueryProperty
    on QueryBuilder<ContainerType, ContainerType, QQueryProperty> {
  QueryBuilder<ContainerType, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ContainerType, List<int>, QQueryOperations>
      canContainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canContain');
    });
  }

  QueryBuilder<ContainerType, EmbeddedColor, QQueryOperations>
      containerColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containerColor');
    });
  }

  QueryBuilder<ContainerType, String, QQueryOperations>
      containerDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containerDescription');
    });
  }

  QueryBuilder<ContainerType, String, QQueryOperations>
      containerTypeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containerTypeName');
    });
  }

  QueryBuilder<ContainerType, bool, QQueryOperations> enclosingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enclosing');
    });
  }

  QueryBuilder<ContainerType, EmbeddedIconData, QQueryOperations>
      iconDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconData');
    });
  }

  QueryBuilder<ContainerType, bool, QQueryOperations> moveableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moveable');
    });
  }

  QueryBuilder<ContainerType, int, QQueryOperations>
      preferredChildContainerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredChildContainer');
    });
  }
}
