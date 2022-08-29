part of home.components;

class SubHeader extends StatelessWidget {
  const SubHeader({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 5,
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              'View All',
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.black45),
            ),
          ],
        ));
  }
}
