enum EnvironmentKeys {
  api(value: "apiUrl"),
  apiKey(value: "apiKey"),
  favoritesLocalDB(value: "favoritesLocalDB");

  final String value;

  const EnvironmentKeys({
    required this.value,
  });
}
