part of settings;

class AppStrings {
  AppStrings._();

  static String appName = "Data Clevers";

  static Map<AppLanguages, String> notFound = {
    AppLanguages.FRENCH: "404 | Page non trouvée",
    AppLanguages.ENGLISH: "404 | Page not Found",
  };

  static Map<AppLanguages, String> toat404 = {
    AppLanguages.FRENCH: "Vous serez redirigés sous peu ...",
    AppLanguages.ENGLISH: "You will be redirected sun ...",
  };

  //le principe est que pour chaque texte qu'on peut traduire on le mettra en *fr* et en *en*
  //ceci sous forme de dico, pour qu'on accede à la valuer en fonction de la clé qui est la langue

  static Map<AppLanguages, String> txt1 = {
    AppLanguages.FRENCH: "Bienvenu  !\n\tContinuez à apprendre pour progresser",
    AppLanguages.ENGLISH:
        "Welcome  !\n\t Stay learning to continue making progress",
  };

  static Map<AppLanguages, String> nbCours = {
    AppLanguages.FRENCH: " Cours",
    AppLanguages.ENGLISH: " Courses",
  };

  static Map<AppLanguages, String> titre1 = {
    AppLanguages.FRENCH: "Introduction à Python",
    AppLanguages.ENGLISH: "Introduction to Python",
  };
  static Map<AppLanguages, String> description1 = {
    AppLanguages.FRENCH:
        'Python est le langage de programmation de prédilection de référence,'
            'je dirais même préféré des Data Scientists',
    AppLanguages.ENGLISH:
        "Python is the reference programming language par excellence"
            'I would even say preferred by Data Scientists',
  };
  static Map<AppLanguages, String> domaine1 = {
    AppLanguages.FRENCH: 'Data Science',
    AppLanguages.ENGLISH: 'Data Scientist',
  };

  static Map<AppLanguages, String> landingTitle = {
    AppLanguages.FRENCH: 'Apprentissage Pratique',
    AppLanguages.ENGLISH: 'Practice Learning',
  };

  static Map<AppLanguages, String> landingText = {
    AppLanguages.FRENCH: 'Il est temps de retrousser vos manches nous apprenons mieux en faisant. Tous nos cours interactifs',
    AppLanguages.ENGLISH: "It's time to roll up your sleeves we learn best by doing. All our interactive courses",
  };
static Map<AppLanguages, String> frLang = {
    AppLanguages.FRENCH: 'Francais',
    AppLanguages.ENGLISH: 'French',
  };

  static Map<AppLanguages, String> enLang = {
    AppLanguages.FRENCH: 'Anglais',
    AppLanguages.ENGLISH: 'English',
  };
  
}
