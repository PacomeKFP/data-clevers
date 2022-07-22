part of ui.widgets;

class Scaffolder {
  Scaffold getScaffold({
    required BuildContext context,
    required Widget Home,
  }) {
    List<SideBlockItem> items = [
      SideBlockItem("Formation", "Formation"),
      SideBlockItem("Cours", "cours"),
      SideBlockItem("Evaluation", "Evaluation")
    ];
    List<SideBlock> blocks = <SideBlock>[SideBlock("Categorie", items)];

    bool drawer = (MediaQuery.of(context).size.width < 820);
    return Scaffold(
        drawer: !drawer
            ? null
            : Drawer(
                width: MediaQuery.of(context).size.width * 0.6,
                child: SideMenu(
                  context: context,
                  blocks: blocks,
                  activeKey: "cours",
                ),
              ),
        appBar: AppBar(
          title: applicationBar().getAppBar(),
          iconTheme: IconThemeData(color: AppColors.col1),
        ),
        body: SafeArea(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!drawer)
              SideMenu(
                context: context,
                blocks: blocks,
                activeKey: "cours",
              ),
            Home
          ],
        )));
  }
}
