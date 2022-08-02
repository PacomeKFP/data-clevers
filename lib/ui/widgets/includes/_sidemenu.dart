part of ui.widgets;

Widget SideMenu(
    {required BuildContext context,
    required List<SideBlock> blocks,
    required String activeKey,}) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  TextStyle activeStyle = const TextStyle(//style appliqué à un ongle de me,nu actif
      color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24);
  TextStyle unactiveStyle = const TextStyle(//Style appliqué à un on glet demenu non actif
      color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18);

  return Container(
    width: width *0.2,
    padding: EdgeInsets.symmetric(vertical: height/8),
    color: AppColors.col1,
    child: ListView(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: const Text("Mes Progres"),
            onTap: (){},
          ),
        ),
      ),
      Divider(
                height: 1,
                indent: 10,
                color: AppColors.col1,
              ),
      for (SideBlock bloc in blocks)
        ListTile(
          title: Center(child: Text(bloc.title.toUpperCase())),
          subtitle: Column(
            children: [
              for (SideBlockItem item in bloc.items)
                GestureDetector(
                  child: Text(
                    item.title,
                    style:
                        activeKey == item.itemId ? activeStyle : unactiveStyle,
                  ),
                  onTap: (){},
                ),
              Divider(
                height: 1,
                indent: 25,
                color: AppColors.col1,
              )
            ],
          ),
        )
    ]),
  );
}
