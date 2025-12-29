import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
    @JsonKey(name: "token")
    String token;
    @JsonKey(name: "user")
    User user;
    @JsonKey(name: "user_gas")
    List<UserGas> userGas;
    @JsonKey(name: "roles")
    List<Role> roles;
    @JsonKey(name: "modules")
    List<dynamic> modules;

    Login({
        required this.token,
        required this.user,
        required this.userGas,
        required this.roles,
        required this.modules,
    });

    factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

    Map<String, dynamic> toJson() => _$LoginToJson(this);
}

@JsonSerializable()
class Role {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "name")
    String name;

    Role({
        required this.id,
        required this.name,
    });

    factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

    Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable()
class User {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "first_name")
    String firstName;
    @JsonKey(name: "last_name")
    String lastName;
    @JsonKey(name: "email")
    String email;
    @JsonKey(name: "email_verified_at")
    dynamic emailVerifiedAt;
    @JsonKey(name: "emp_id")
    String empId;
    @JsonKey(name: "mobile")
    String mobile;
    @JsonKey(name: "mobile_b")
    dynamic mobileB;
    @JsonKey(name: "gender")
    dynamic gender;
    @JsonKey(name: "dob")
    dynamic dob;
    @JsonKey(name: "image")
    dynamic image;
    @JsonKey(name: "type")
    int type;
    @JsonKey(name: "status")
    int status;
    @JsonKey(name: "ga_id")
    dynamic gaId;
    @JsonKey(name: "department_id")
    int departmentId;
    @JsonKey(name: "created_at")
    DateTime createdAt;
    @JsonKey(name: "updated_at")
    DateTime updatedAt;

    User({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.emailVerifiedAt,
        required this.empId,
        required this.mobile,
        required this.mobileB,
        required this.gender,
        required this.dob,
        required this.image,
        required this.type,
        required this.status,
        required this.gaId,
        required this.departmentId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserGas {
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "ga_id")
    int gaId;

    UserGas({
        required this.name,
        required this.gaId,
    });

    factory UserGas.fromJson(Map<String, dynamic> json) => _$UserGasFromJson(json);

    Map<String, dynamic> toJson() => _$UserGasToJson(this);
}
