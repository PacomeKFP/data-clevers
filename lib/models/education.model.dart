part of models;

class Education extends StatelessWidget {
  final String diplomas;
  final String? domain;
  final String? school;
  final DateTime? startDate;
  final DateTime? endDate;

  const Education(
      {super.key,
      required this.diplomas,
      this.domain,
      this.school,
      this.startDate,
      this.endDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(style: BorderStyle.values[0])),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(diplomas, style: Theme.of(context).textTheme.headline5),
              Text(endDate.toString()) //la durée
            ],
          ),
          const Divider(height: 10),
          ListTile(
            title: Text('Domain: $domain'),
            subtitle: Column(
              children: [
                Text('$school'),
              ],
            ),
          ),
          const Divider(thickness: 1, color: Colors.grey, indent: 10),
        ],
      ),
    );
  }
}
