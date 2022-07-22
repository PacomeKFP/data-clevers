part of settings;

class AppStrings {
  AppStrings._();

  static String appName = "Data Clevers";

  //le principe est que pour chaque texte qu'on peut traduire on le mettra en *fr* et en *en*
  //ceci sous forme de dico, pour qu'on accede à la valuer en fonction de la clé qui est la langue

  static Map<String, String> txt1 = {
    'fr': "Bienvenu  !\n\tContinuez à apprendre pour progresser",
    'en': "Welcome  !\n\t Stay learning to continue making progress",
  };
  
}
