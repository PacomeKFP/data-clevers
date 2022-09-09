part of home.components;

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    UserInfo userInfo =
        (ModalRoute.of(context)!.settings.arguments! as Map)['user']!;

    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 13.0,
              spreadRadius: 0,
            )
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CircleAvatar(
          radius: 40,
          child: Image.network(userInfo.photoURL ?? "images/user.png"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 10),
            Text(
              userInfo.displayName ?? 'UserName',
              style:
                  GoogleFonts.ubuntu(color: AppColors.darkBlue, fontSize: 24),
            ),
            Text(userInfo.email!,
                style: GoogleFonts.ubuntu(
                    color: AppColors.darkBlue.withOpacity(0.8), fontSize: 16))
          ],
        )
      ]),
    );
  }
}
