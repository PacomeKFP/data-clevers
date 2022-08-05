part of models;

class Competence extends StatelessWidget {
  final String title;
  final String? domain;

  const Competence({super.key, required this.title, this.domain});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(style: BorderStyle.values[0])),
      child: Column(
        children: [
          ListTile(
            title: Text('$title'),
            subtitle: Column(
              children: [
                Text('domain ${domain == null ? "Not Specified" : domain}'),
              ],
            ),
          ),
          Divider(thickness: 1, color: Colors.grey, indent: 10),
          const Divider(height: 5)
        ],
      ),
    );
  }
}
