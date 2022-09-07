enum AppLanguages {
  french,
  english;

  ///the Abbrevitions (or short term) getter for [AppLanguages] values
  String get abbr => this == french ? 'fr' : 'en';

  Map<AppLanguages, String> get label => this == french
      ? {french: "Français", english: "French"}
      : {french: "Anglais", english: "English"};

  /// the factory that allow us to get an [AppLanguages] based on a given String
  /// those String  represent the language
  factory AppLanguages.fromString(String? str) => str == null
      ? AppLanguages.english
      : ['fr', 'fr_fr', 'français', 'french'].contains(str.toLowerCase())
          ? AppLanguages.french
          : AppLanguages.english;
}
