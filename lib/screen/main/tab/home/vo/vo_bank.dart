class Bank{
  final String name;
  final String logoImagePath;

  Bank(this.name, this.logoImagePath);

  //chatGPT 추가
  @override
  String toString() {
    return 'Bank: $name, Logo: $logoImagePath';
  }
}