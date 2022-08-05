part of models;

class Certification extends StatelessWidget {
  final String certificateName;
  final String? domain;
  final String? transmitter;
  final DateTime? date;

  const Certification({super.key, required this.certificateName, this.domain, this.transmitter, this.date});



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
              Text(certificateName, style: Theme.of(context).textTheme.headline5),
              Text(date.toString()) //la durée
            ],
          ),
          const Divider(height: 10),
          ListTile(
            title: Text('Domain: $domain'),
            subtitle: Column(
              children: [
                Text('Emitted by: $transmitter'),
              ],
            ),
          ),

          const Divider(thickness: 1, color: Colors.grey, indent: 10),
        ],
      ),
    );
  }
}
