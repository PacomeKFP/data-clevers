part of models;

enum SideNavigationIndex {
  dashboard,
  folder,
  message,
  setting,
  logout;

  String get label => this == dashboard
      ? "Dashboard"
      : this == folder
          ? "Folder"
          : this == message
              ? "Message"
              : this == setting
                  ? "Settings"
                  : "logout";
  IconData get icon => this == dashboard
      ? Feather.home
      : this == folder
          ? Feather.folder
          : this == message
              ? Feather.message_square
              : this == setting
                  ? Feather.settings
                  : Feather.log_out;

  void tapEvent(BuildContext context) => this == logout
      ? AuthenticationBloc().add(LogoutUser())
      : context.read<SideNavigationBloc>().add(NavigateTo(this));


}
