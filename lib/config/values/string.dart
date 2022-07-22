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
    AppLanguages.ENGLISH: "Welcome  !\n\t Stay learning to continue making progress",
  };

  
}
