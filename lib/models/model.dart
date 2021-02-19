class Paths {
  final String id;
  final String title;
  final List<SubPath> subPath;

  Paths({this.id, this.title, this.subPath});

  factory Paths.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['sub_paths'] as List;
    final sublist = list.cast<Map<String, dynamic>>();
    List<SubPath> subPath2;

    List<SubPath> parsesubPaths(responseBody1) {
      return responseBody1
          .map<SubPath>((json) => SubPath.fromJson(json))
          .toList();
    }

    subPath2 = parsesubPaths(sublist);

    return Paths(
        id: parsedJson['id'] as String,
        title: parsedJson['title'] as String,
        subPath: subPath2);
  }
}

class SubPath {
  final String subId;
  final String subTitle;
  final String subImage;

  SubPath({this.subId, this.subTitle, this.subImage});

  factory SubPath.fromJson(Map<String, dynamic> parsedJson) {
    return SubPath(
        subId: parsedJson['id'] as String,
        subTitle: parsedJson['title'] as String,
        subImage: parsedJson['image'] as String);
  }
}
