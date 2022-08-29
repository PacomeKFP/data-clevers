part of models;

enum AuthState {
  unAuthenticated,
  authenticated,
  unknown;

  String get label => this == unAuthenticated
      ? 'unAuthenticated'
      : this == authenticated
          ? 'Authenticated'
          : '';
}
