part of models;

enum SideNavigationIndex {
  dashboard,
  reccomandation,
  planification,

  job,
  profile,
  forum,
  quiz,

  setting,
  logout;

  String get label => this == dashboard
      ? "Dashboard"
      : this == reccomandation
          ? "Reccomandations"
          : this == planification
              ? "Planify"
              : this == job
                  ? "Look for a Job"
                  : this == profile
                      ? "My Profile"
                      : this == forum
                          ? "Forum"
                          : this == quiz
                              ? "Quiz"
                              : this == setting
                                  ? "Settings"
                                  : "logout";
  IconData get icon => this == dashboard
      ? Feather.home
      : this == reccomandation
          ? Icons.switch_access_shortcut_add_outlined
          : this == planification
              ? Feather.calendar
              : this == job
                  ? Icons.work_outline_rounded
                  : this == profile
                      ? Feather.user
                      : this == forum
                          ? Feather.message_circle
                          : this == quiz
                              ? Feather.map
                              : this == setting
                                  ? Feather.settings
                                  : Feather.log_out;

  void tapEvent(BuildContext context) {
    switch (this) {
      case logout:
        return logOut(context);
      case setting:
        showDialog(
            context: context,
            builder: (context) => AppSettings(),
            routeSettings: RouteSettings(
                name: '${ModalRoute.of(context)!.settings.name}/appSettings'));
        return;
      default:
        return context.read<SideNavigationBloc>().add(NavigateTo(this));
    }
  }
}

void logOut(context) {
  AuthenticationBloc().add(LogoutUser());
  Navigator.pushNamed(context, '/');
}
