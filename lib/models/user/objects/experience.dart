part of user.model;

class Experience {
  final String id;
  final String title;
  final String employer;
  final String employerUrl;
  final String employerContact;
  final String domain;
  final DateTime debut;
  final DateTime fin;

  Experience(this.id, this.title, this.employer, this.employerUrl,
      this.employerContact, this.domain, this.debut, this.fin);
}
