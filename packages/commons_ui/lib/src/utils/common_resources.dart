enum CommonResources {
  cat1(name: "cat1.png"),
  cat2(name: "cat2.png"),
  cat3(name: "cat3.png"),
  cat4(name: "cat4.png"),
  cat5(name: "cat5.png"),
  cat6(name: "cat6.png"),
  cat7(name: "cat7.png"),
  error(name: "error_illustration.png"),
  empty(name: "empty_illustration.png");

  final String value;

  const CommonResources({required String name}) : value = "packages/commons_ui/assets/images/$name";
}
