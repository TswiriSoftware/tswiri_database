// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPhotoCollection on Isar {
  IsarCollection<Photo> get photos => this.collection();
}

const PhotoSchema = CollectionSchema(
  name: r'Photo',
  id: 7605685642742149252,
  properties: {
    r'containerUID': PropertySchema(
      id: 0,
      name: r'containerUID',
      type: IsarType.string,
    ),
    r'extention': PropertySchema(
      id: 1,
      name: r'extention',
      type: IsarType.string,
    ),
    r'photoName': PropertySchema(
      id: 2,
      name: r'photoName',
      type: IsarType.long,
    ),
    r'photoSize': PropertySchema(
      id: 3,
      name: r'photoSize',
      type: IsarType.doubleList,
    ),
    r'thumbnailExtention': PropertySchema(
      id: 4,
      name: r'thumbnailExtention',
      type: IsarType.string,
    ),
    r'thumbnailName': PropertySchema(
      id: 5,
      name: r'thumbnailName',
      type: IsarType.string,
    )
  },
  estimateSize: _photoEstimateSize,
  serialize: _photoSerialize,
  deserialize: _photoDeserialize,
  deserializeProp: _photoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _photoGetId,
  getLinks: _photoGetLinks,
  attach: _photoAttach,
  version: '3.0.2',
);

int _photoEstimateSize(
  Photo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.containerUID;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.extention.length * 3;
  bytesCount += 3 + object.photoSize.length * 8;
  bytesCount += 3 + object.thumbnailExtention.length * 3;
  bytesCount += 3 + object.thumbnailName.length * 3;
  return bytesCount;
}

void _photoSerialize(
  Photo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.containerUID);
  writer.writeString(offsets[1], object.extention);
  writer.writeLong(offsets[2], object.photoName);
  writer.writeDoubleList(offsets[3], object.photoSize);
  writer.writeString(offsets[4], object.thumbnailExtention);
  writer.writeString(offsets[5], object.thumbnailName);
}

Photo _photoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Photo();
  object.containerUID = reader.readStringOrNull(offsets[0]);
  object.extention = reader.readString(offsets[1]);
  object.id = id;
  object.photoName = reader.readLong(offsets[2]);
  object.photoSize = reader.readDoubleList(offsets[3]) ?? [];
  object.thumbnailExtention = reader.readString(offsets[4]);
  object.thumbnailName = reader.readString(offsets[5]);
  return object;
}

P _photoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _photoGetId(Photo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _photoGetLinks(Photo object) {
  return [];
}

void _photoAttach(IsarCollection<dynamic> col, Id id, Photo object) {
  object.id = id;
}

extension PhotoQueryWhereSort on QueryBuilder<Photo, Photo, QWhere> {
  QueryBuilder<Photo, Photo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PhotoQueryWhere on QueryBuilder<Photo, Photo, QWhereClause> {
  QueryBuilder<Photo, Photo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Photo, Photo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Photo, Photo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Photo, Photo, QAfterWhereClause> idBetween(
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

extension PhotoQueryFilter on QueryBuilder<Photo, Photo, QFilterCondition> {
  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'containerUID',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'containerUID',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'containerUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'containerUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'containerUID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'containerUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'containerUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'containerUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'containerUID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerUID',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> containerUIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'containerUID',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> extentionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> extentionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> extentionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> extentionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extention',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> extentionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'extention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> extentionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'extention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> extentionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'extention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> extentionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'extention',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> extentionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extention',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> extentionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'extention',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Photo, Photo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Photo, Photo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoNameEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoName',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoNameGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoName',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoNameLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoName',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoNameBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoSizeElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoSizeElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoSizeElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoSizeElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoSizeLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoSize',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoSizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoSize',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoSizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoSize',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoSizeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoSize',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoSizeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoSize',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> photoSizeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoSize',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailExtentionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnailExtention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition>
      thumbnailExtentionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbnailExtention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailExtentionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbnailExtention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailExtentionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbnailExtention',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition>
      thumbnailExtentionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thumbnailExtention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailExtentionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thumbnailExtention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailExtentionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thumbnailExtention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailExtentionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thumbnailExtention',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition>
      thumbnailExtentionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnailExtention',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition>
      thumbnailExtentionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thumbnailExtention',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnailName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbnailName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbnailName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbnailName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thumbnailName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thumbnailName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thumbnailName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thumbnailName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnailName',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> thumbnailNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thumbnailName',
        value: '',
      ));
    });
  }
}

extension PhotoQueryObject on QueryBuilder<Photo, Photo, QFilterCondition> {}

extension PhotoQueryLinks on QueryBuilder<Photo, Photo, QFilterCondition> {}

extension PhotoQuerySortBy on QueryBuilder<Photo, Photo, QSortBy> {
  QueryBuilder<Photo, Photo, QAfterSortBy> sortByContainerUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerUID', Sort.asc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> sortByContainerUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerUID', Sort.desc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> sortByExtention() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extention', Sort.asc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> sortByExtentionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extention', Sort.desc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> sortByPhotoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.asc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> sortByPhotoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.desc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> sortByThumbnailExtention() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailExtention', Sort.asc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> sortByThumbnailExtentionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailExtention', Sort.desc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> sortByThumbnailName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailName', Sort.asc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> sortByThumbnailNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailName', Sort.desc);
    });
  }
}

extension PhotoQuerySortThenBy on QueryBuilder<Photo, Photo, QSortThenBy> {
  QueryBuilder<Photo, Photo, QAfterSortBy> thenByContainerUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerUID', Sort.asc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> thenByContainerUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerUID', Sort.desc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> thenByExtention() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extention', Sort.asc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> thenByExtentionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extention', Sort.desc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> thenByPhotoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.asc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> thenByPhotoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.desc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> thenByThumbnailExtention() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailExtention', Sort.asc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> thenByThumbnailExtentionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailExtention', Sort.desc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> thenByThumbnailName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailName', Sort.asc);
    });
  }

  QueryBuilder<Photo, Photo, QAfterSortBy> thenByThumbnailNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailName', Sort.desc);
    });
  }
}

extension PhotoQueryWhereDistinct on QueryBuilder<Photo, Photo, QDistinct> {
  QueryBuilder<Photo, Photo, QDistinct> distinctByContainerUID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'containerUID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Photo, Photo, QDistinct> distinctByExtention(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'extention', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Photo, Photo, QDistinct> distinctByPhotoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoName');
    });
  }

  QueryBuilder<Photo, Photo, QDistinct> distinctByPhotoSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoSize');
    });
  }

  QueryBuilder<Photo, Photo, QDistinct> distinctByThumbnailExtention(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbnailExtention',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Photo, Photo, QDistinct> distinctByThumbnailName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbnailName',
          caseSensitive: caseSensitive);
    });
  }
}

extension PhotoQueryProperty on QueryBuilder<Photo, Photo, QQueryProperty> {
  QueryBuilder<Photo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Photo, String?, QQueryOperations> containerUIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containerUID');
    });
  }

  QueryBuilder<Photo, String, QQueryOperations> extentionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'extention');
    });
  }

  QueryBuilder<Photo, int, QQueryOperations> photoNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoName');
    });
  }

  QueryBuilder<Photo, List<double>, QQueryOperations> photoSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoSize');
    });
  }

  QueryBuilder<Photo, String, QQueryOperations> thumbnailExtentionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbnailExtention');
    });
  }

  QueryBuilder<Photo, String, QQueryOperations> thumbnailNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbnailName');
    });
  }
}
