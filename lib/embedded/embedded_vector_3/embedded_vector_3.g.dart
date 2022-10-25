// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embedded_vector_3.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const EmbeddedVector3Schema = Schema(
  name: r'EmbeddedVector3',
  id: -6074029966329296680,
  properties: {
    r'data': PropertySchema(
      id: 0,
      name: r'data',
      type: IsarType.doubleList,
    )
  },
  estimateSize: _embeddedVector3EstimateSize,
  serialize: _embeddedVector3Serialize,
  deserialize: _embeddedVector3Deserialize,
  deserializeProp: _embeddedVector3DeserializeProp,
);

int _embeddedVector3EstimateSize(
  EmbeddedVector3 object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.data;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _embeddedVector3Serialize(
  EmbeddedVector3 object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDoubleList(offsets[0], object.data);
}

EmbeddedVector3 _embeddedVector3Deserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EmbeddedVector3(
    data: reader.readDoubleList(offsets[0]),
  );
  return object;
}

P _embeddedVector3DeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension EmbeddedVector3QueryFilter
    on QueryBuilder<EmbeddedVector3, EmbeddedVector3, QFilterCondition> {
  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'data',
      ));
    });
  }

  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'data',
      ));
    });
  }

  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'data',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'data',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'data',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EmbeddedVector3, EmbeddedVector3, QAfterFilterCondition>
      dataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'data',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension EmbeddedVector3QueryObject
    on QueryBuilder<EmbeddedVector3, EmbeddedVector3, QFilterCondition> {}
