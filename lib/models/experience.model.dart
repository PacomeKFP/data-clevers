part of models;

class WorkExperience extends StatelessWidget {
  final String title;
  final String? employer;
  final String? employerUrl;
  final String? employerContact;
  final String? domain;
  final DateTime? startDate;
  final DateTime? endDate;

  WorkExperience(
      {Key? key,
      required this.title,
      this.employer,
      this.employerUrl,
      this.employerContact,
      this.domain,
      this.startDate,
      this.endDate})
      : super(key: key);

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
              Text(title, style: Theme.of(context).textTheme.headline5),
              Text('Duration') //la durée
            ],
          ),
          const Divider(height: 10),
          Text('Domain :$domain'),
          ListTile(
            title: Text('Employer: $employer'),
            subtitle: Column(
              children: [
                Text('$employerUrl'),
                Text('$employerContact'),
              ],
            ),
          ),
const Divider(thickness: 1, color: Colors.grey, indent: 10),
          
        ],
      ),
    );
  }
}
