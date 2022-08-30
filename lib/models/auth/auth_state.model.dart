part of authentication.model;

enum AuthState {
  unAuthenticated,
  authenticated,
  unknown;

  String get label => this == unAuthenticated
      ? 'unAuthenticated'
      : this == authenticated
          ? 'Authenticated'
          : 'UnKnown';
}
