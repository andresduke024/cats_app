enum CatsEndpoints {
  breeds(value: "/breeds");

  final String value;

  const CatsEndpoints({
    required this.value,
  });
}
