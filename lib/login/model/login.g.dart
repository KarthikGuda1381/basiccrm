// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
  token: json['token'] as String,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  userGas: (json['user_gas'] as List<dynamic>)
      .map((e) => UserGas.fromJson(e as Map<String, dynamic>))
      .toList(),
  roles: (json['roles'] as List<dynamic>)
      .map((e) => Role.fromJson(e as Map<String, dynamic>))
      .toList(),
  modules: json['modules'] as List<dynamic>,
);

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
  'token': instance.token,
  'user': instance.user,
  'user_gas': instance.userGas,
  'roles': instance.roles,
  'modules': instance.modules,
};

Role _$RoleFromJson(Map<String, dynamic> json) =>
    Role(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  email: json['email'] as String,
  emailVerifiedAt: json['email_verified_at'],
  empId: json['emp_id'] as String,
  mobile: json['mobile'] as String,
  mobileB: json['mobile_b'],
  gender: json['gender'],
  dob: json['dob'],
  image: json['image'],
  type: (json['type'] as num).toInt(),
  status: (json['status'] as num).toInt(),
  gaId: json['ga_id'],
  departmentId: (json['department_id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'email_verified_at': instance.emailVerifiedAt,
  'emp_id': instance.empId,
  'mobile': instance.mobile,
  'mobile_b': instance.mobileB,
  'gender': instance.gender,
  'dob': instance.dob,
  'image': instance.image,
  'type': instance.type,
  'status': instance.status,
  'ga_id': instance.gaId,
  'department_id': instance.departmentId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

UserGas _$UserGasFromJson(Map<String, dynamic> json) =>
    UserGas(name: json['name'] as String, gaId: (json['ga_id'] as num).toInt());

Map<String, dynamic> _$UserGasToJson(UserGas instance) => <String, dynamic>{
  'name': instance.name,
  'ga_id': instance.gaId,
};
