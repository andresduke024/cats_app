enum CommonResources {
  error(name: "error_illustration.png");

  final String value;

  const CommonResources({required String name}) : value = "packages/commons_ui/assets/images/$name";
}
