class GitEvent {
  late String id;
  late String userName;
  late String avatarUrl;
  late String repoName;

  GitEvent(dynamic json) {
    id = json["id"];
    userName = json['actor']['login'];
    avatarUrl = json['actor']['avatar_url'];
    repoName = json['repo']['name'];
  }

  @override
  String toString() {
    return 'GitEvent{id: $id, userName: $userName, avatarUrl: $avatarUrl, repoName: $repoName}';
  }
}