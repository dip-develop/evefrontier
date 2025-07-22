// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TypeEntity> _$typeEntitySerializer = _$TypeEntitySerializer();

class _$TypeEntitySerializer implements StructuredSerializer<TypeEntity> {
  @override
  final Iterable<Type> types = const [TypeEntity, _$TypeEntity];
  @override
  final String wireName = 'TypeEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, TypeEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'categoryId',
      serializers.serialize(object.categoryId,
          specifiedType: const FullType(int)),
      'categoryName',
      serializers.serialize(object.categoryName,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'groupId',
      serializers.serialize(object.groupId, specifiedType: const FullType(int)),
      'groupName',
      serializers.serialize(object.groupName,
          specifiedType: const FullType(String)),
      'iconUrl',
      serializers.serialize(object.iconUrl,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'mass',
      serializers.serialize(object.mass, specifiedType: const FullType(double)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'portionSize',
      serializers.serialize(object.portionSize,
          specifiedType: const FullType(int)),
      'radius',
      serializers.serialize(object.radius,
          specifiedType: const FullType(double)),
      'volume',
      serializers.serialize(object.volume,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  TypeEntity deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TypeEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'categoryId':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'categoryName':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'groupId':
          result.groupId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'groupName':
          result.groupName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'mass':
          result.mass = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'portionSize':
          result.portionSize = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'radius':
          result.radius = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'volume':
          result.volume = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$TypeEntity extends TypeEntity {
  @override
  final int categoryId;
  @override
  final String categoryName;
  @override
  final String description;
  @override
  final int groupId;
  @override
  final String groupName;
  @override
  final String iconUrl;
  @override
  final int id;
  @override
  final double mass;
  @override
  final String name;
  @override
  final int portionSize;
  @override
  final double radius;
  @override
  final double volume;

  factory _$TypeEntity([void Function(TypeEntityBuilder)? updates]) =>
      (TypeEntityBuilder()..update(updates))._build();

  _$TypeEntity._(
      {required this.categoryId,
      required this.categoryName,
      required this.description,
      required this.groupId,
      required this.groupName,
      required this.iconUrl,
      required this.id,
      required this.mass,
      required this.name,
      required this.portionSize,
      required this.radius,
      required this.volume})
      : super._();
  @override
  TypeEntity rebuild(void Function(TypeEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeEntityBuilder toBuilder() => TypeEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeEntity &&
        categoryId == other.categoryId &&
        categoryName == other.categoryName &&
        description == other.description &&
        groupId == other.groupId &&
        groupName == other.groupName &&
        iconUrl == other.iconUrl &&
        id == other.id &&
        mass == other.mass &&
        name == other.name &&
        portionSize == other.portionSize &&
        radius == other.radius &&
        volume == other.volume;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, categoryName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, groupId.hashCode);
    _$hash = $jc(_$hash, groupName.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, mass.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, portionSize.hashCode);
    _$hash = $jc(_$hash, radius.hashCode);
    _$hash = $jc(_$hash, volume.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TypeEntity')
          ..add('categoryId', categoryId)
          ..add('categoryName', categoryName)
          ..add('description', description)
          ..add('groupId', groupId)
          ..add('groupName', groupName)
          ..add('iconUrl', iconUrl)
          ..add('id', id)
          ..add('mass', mass)
          ..add('name', name)
          ..add('portionSize', portionSize)
          ..add('radius', radius)
          ..add('volume', volume))
        .toString();
  }
}

class TypeEntityBuilder implements Builder<TypeEntity, TypeEntityBuilder> {
  _$TypeEntity? _$v;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _groupId;
  int? get groupId => _$this._groupId;
  set groupId(int? groupId) => _$this._groupId = groupId;

  String? _groupName;
  String? get groupName => _$this._groupName;
  set groupName(String? groupName) => _$this._groupName = groupName;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  double? _mass;
  double? get mass => _$this._mass;
  set mass(double? mass) => _$this._mass = mass;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _portionSize;
  int? get portionSize => _$this._portionSize;
  set portionSize(int? portionSize) => _$this._portionSize = portionSize;

  double? _radius;
  double? get radius => _$this._radius;
  set radius(double? radius) => _$this._radius = radius;

  double? _volume;
  double? get volume => _$this._volume;
  set volume(double? volume) => _$this._volume = volume;

  TypeEntityBuilder();

  TypeEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryId = $v.categoryId;
      _categoryName = $v.categoryName;
      _description = $v.description;
      _groupId = $v.groupId;
      _groupName = $v.groupName;
      _iconUrl = $v.iconUrl;
      _id = $v.id;
      _mass = $v.mass;
      _name = $v.name;
      _portionSize = $v.portionSize;
      _radius = $v.radius;
      _volume = $v.volume;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeEntity other) {
    _$v = other as _$TypeEntity;
  }

  @override
  void update(void Function(TypeEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TypeEntity build() => _build();

  _$TypeEntity _build() {
    final _$result = _$v ??
        _$TypeEntity._(
          categoryId: BuiltValueNullFieldError.checkNotNull(
              categoryId, r'TypeEntity', 'categoryId'),
          categoryName: BuiltValueNullFieldError.checkNotNull(
              categoryName, r'TypeEntity', 'categoryName'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'TypeEntity', 'description'),
          groupId: BuiltValueNullFieldError.checkNotNull(
              groupId, r'TypeEntity', 'groupId'),
          groupName: BuiltValueNullFieldError.checkNotNull(
              groupName, r'TypeEntity', 'groupName'),
          iconUrl: BuiltValueNullFieldError.checkNotNull(
              iconUrl, r'TypeEntity', 'iconUrl'),
          id: BuiltValueNullFieldError.checkNotNull(id, r'TypeEntity', 'id'),
          mass: BuiltValueNullFieldError.checkNotNull(
              mass, r'TypeEntity', 'mass'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'TypeEntity', 'name'),
          portionSize: BuiltValueNullFieldError.checkNotNull(
              portionSize, r'TypeEntity', 'portionSize'),
          radius: BuiltValueNullFieldError.checkNotNull(
              radius, r'TypeEntity', 'radius'),
          volume: BuiltValueNullFieldError.checkNotNull(
              volume, r'TypeEntity', 'volume'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
