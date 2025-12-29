
class LoginRequest {
  final String empId;
  final String password;

  LoginRequest({required this.empId, required this.password});

  Map<String, dynamic> toJson() => {
    "emp_id": empId,
    "password": password,
  };
}