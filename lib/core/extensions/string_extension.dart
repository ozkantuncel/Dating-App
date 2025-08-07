extension NullStringExtensions on String? {
  bool isNotBlank() => this != null && this!.isNotEmpty;

  bool isBlank() => !isNotBlank();

  bool _isBlankContent() =>
      this == null || this!.trim().isEmpty || this!.trim() == 'null';

  String orBlank() => _isBlankContent() ? '' : this!;

  String orIfBlank(String s) => _isBlankContent() ? s : this!;
}

extension StringExtensions on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return substring(0, 1).toUpperCase() + substring(1);
  }
}

extension QueryStringParser on String {
  Map<String, String> get queryParameters {
    try {
      final uri = Uri.parse(this);
      return uri.queryParameters;
    } catch (e) {
      return {};
    }
  }
}
