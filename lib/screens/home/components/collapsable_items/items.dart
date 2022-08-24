part of user_home.components;

List<CollapsibleItem> generateItems(
    Function(String headline) callback) {
  return [
    CollapsibleItem(
      text: 'Dashboard',
      icon: Icons.assessment,
      onPressed: () => callback('Dashboard'),
      isSelected: true,
    ),
    CollapsibleItem(
      text: 'Search',
      icon: Icons.search,
      onPressed: () => callback('Search'),
    ),
    CollapsibleItem(
      text: 'Notifications',
      icon: Icons.notifications,
      onPressed: () => callback('Notifications'),
    ),
    CollapsibleItem(
      text: 'Settings',
      icon: Icons.settings,
      onPressed: () => callback('Settings'),
    ),
    CollapsibleItem(
      text: 'Home',
      icon: Icons.home,
      onPressed: () => callback('Home'),
    ),
    CollapsibleItem(
      text: 'Logout',
      icon: Icons.logout,
      onPressed: () => callback('Logout'),
    ),
  ];
}
