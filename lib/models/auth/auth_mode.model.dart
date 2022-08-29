part of models;


enum AuthMode {
  none,
  login,
  register;

  String get label => this == AuthMode.login
      ? 'Login'
      : this == AuthMode.register
          ? 'Register'
          : '';
  String get changeText => this == AuthMode.login
      ? "You don't have an account  yet ? Register"
      : this == AuthMode.register
          ? 'You have an account ? Login'
          : '';
}