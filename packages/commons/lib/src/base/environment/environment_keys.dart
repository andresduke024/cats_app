enum EnvironmentKeys {
  api(value: "apiUrl"),
  apiKey(value: "apiKey");

  final String value;

  const EnvironmentKeys({
    required this.value,
  });
}
