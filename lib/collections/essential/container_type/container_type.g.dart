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
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'enclosing': PropertySchema(
      id: 3,
      name: r'enclosing',
      type: IsarType.bool,
    ),
    r'iconData': PropertySchema(
      id: 4,
      name: r'iconData',
      type: IsarType.stringList,
    ),
    r'moveable': PropertySchema(
      id: 5,
      name: r'moveable',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
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
  embeddedSchemas: {},
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
  bytesCount += 3 + object.color.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.iconData.length * 3;
  {
    for (var i = 0; i < object.iconData.length; i++) {
      final value = object.iconData[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _containerTypeSerialize(
  ContainerType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.canContain);
  writer.writeString(offsets[1], object.color);
  writer.writeString(offsets[2], object.description);
  writer.writeBool(offsets[3], object.enclosing);
  writer.writeStringList(offsets[4], object.iconData);
  writer.writeBool(offsets[5], object.moveable);
  writer.writeString(offsets[6], object.name);
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
  object.color = reader.readString(offsets[1]);
  object.description = reader.readString(offsets[2]);
  object.enclosing = reader.readBool(offsets[3]);
  object.iconData = reader.readStringList(offsets[4]) ?? [];
  object.id = id;
  object.moveable = reader.readBool(offsets[5]);
  object.name = reader.readString(offsets[6]);
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
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
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
      containerColorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerColorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'containerColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerColorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'containerColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerColorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'containerColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'containerColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'containerColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerColorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'containerColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerColorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'containerColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerColor',
        value: '',
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      containerColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'containerColor',
        value: '',
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
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

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconData',
        value: '',
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconData',
        value: '',
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'iconData',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'iconData',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'iconData',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'iconData',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'iconData',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      iconDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'iconData',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
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
    on QueryBuilder<ContainerType, ContainerType, QFilterCondition> {}

extension ContainerTypeQueryLinks
    on QueryBuilder<ContainerType, ContainerType, QFilterCondition> {}

extension ContainerTypeQuerySortBy
    on QueryBuilder<ContainerType, ContainerType, QSortBy> {
  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      sortByContainerColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerColor', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      sortByContainerColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerColor', Sort.desc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
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

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
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
      thenByContainerColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerColor', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      thenByContainerColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerColor', Sort.desc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
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

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
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
      distinctByContainerColor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'containerColor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContainerType, ContainerType, QDistinct> distinctByEnclosing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enclosing');
    });
  }

  QueryBuilder<ContainerType, ContainerType, QDistinct> distinctByIconData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconData');
    });
  }

  QueryBuilder<ContainerType, ContainerType, QDistinct> distinctByMoveable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moveable');
    });
  }

  QueryBuilder<ContainerType, ContainerType, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
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

  QueryBuilder<ContainerType, String, QQueryOperations>
      containerColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containerColor');
    });
  }

  QueryBuilder<ContainerType, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ContainerType, bool, QQueryOperations> enclosingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enclosing');
    });
  }

  QueryBuilder<ContainerType, List<String>, QQueryOperations>
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

  QueryBuilder<ContainerType, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ContainerType, int, QQueryOperations>
      preferredChildContainerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredChildContainer');
    });
  }
}
