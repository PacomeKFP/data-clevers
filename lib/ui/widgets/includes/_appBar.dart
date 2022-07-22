part of ui.widgets;

class applicationBar {
  Widget getAppBar({path = "../../assets/images/avatar.jpeg"}) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                AppLogo(),
                SizedBox(width: 5),
                Text(
                  AppStrings.appName,
                  style: TextStyle(color: AppColors.col1),
                ),
                SizedBox(width: 5),
                DecoratedBox(
                    decoration: BoxDecoration(
                        color: AppColors.col1,
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(50),
                            right: Radius.circular(50))),
                    child: Text(
                      "Apprendre",
                      style: TextStyle(backgroundColor: Colors.amber),
                    )),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: CircleAvatar(
                backgroundImage: AssetImage(path),
                radius: 20,
              ))
        ],
      ),
    );
  }
}
