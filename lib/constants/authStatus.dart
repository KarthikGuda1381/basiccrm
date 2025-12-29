class LoginState {
  final AuthStatus status;
  final String? errorMessage;

  const LoginState({required this.status, this.errorMessage});

  const LoginState.initial() : status = AuthStatus.initializing,
  errorMessage = null;

  const LoginState.unauthenticated() : status = AuthStatus.unauthenticated,
  errorMessage = null;

  const LoginState.authenticating() : status = AuthStatus.authenticating,
  errorMessage = null;

  const LoginState.authenticated() : status = AuthStatus.authenticated,
  errorMessage = null;

  const LoginState.error(String msg) : status = AuthStatus.error,
  errorMessage = msg;
}


enum AuthStatus {
  initializing,     
  unauthenticated, 
  authenticating,
  authenticated, 
  error
}