enum CatsEndpoints {
  breeds(value: "/breeds"),
  imageById(value: "/images");

  final String value;

  const CatsEndpoints({
    required this.value,
  });
}
