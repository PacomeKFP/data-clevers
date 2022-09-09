part of home.components;

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            const SizedBox(height: 20),
            const ProfileTab(),
            const SizedBox(height: 30),

            ///here we will display the form
            AboutForm(user: FirebaseAuth.instance.currentUser!.providerData[0])
          ],
        ),
      ),
    );
  }
}
