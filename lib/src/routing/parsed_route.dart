class ParsedRoute {
  final String path;
  final Map<String, String> parameters;

  ParsedRoute({required this.path, this.parameters = const {}});
}
