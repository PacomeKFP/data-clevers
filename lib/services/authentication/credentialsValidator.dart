Map<String, dynamic> emailPassValidator(Map<String, String> credentials) {
  String emailReg =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  List<String> errors = [];
  if (!RegExp(emailReg).hasMatch(credentials['email']!)) {
    errors.add('Email invalide');
  }

  //TODO check if the email is already in use in the db;

  bool isValidUsername = true;
  //TODO check if the username is already in use
  if (credentials['password']!.trim().length < 6) {
    errors.add('Mot de passe trop court minimum 6 caracteres');
  }

  return {'isValid': errors.isEmpty, 'errors': errors};
}
