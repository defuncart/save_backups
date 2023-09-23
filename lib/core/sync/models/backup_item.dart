class BackupItem {
  const BackupItem({
    required this.id,
    required this.path,
    required this.folderName,
  });

  final String id;
  final String path;
  final String folderName;

  Map<String, dynamic> toJson() => {
        'id': id,
        'path': path,
        'folderName': folderName,
      };

  factory BackupItem.fromJson(Map<String, dynamic> json) {
    return BackupItem(
      id: json['id'] ?? '',
      path: json['path'] ?? '',
      folderName: json['folderName'] ?? '',
    );
  }

  @override
  String toString() => 'BackupItem(id: $id, path: $path, folderName: $folderName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BackupItem && other.id == id && other.path == path && other.folderName == folderName;
  }

  @override
  int get hashCode => id.hashCode ^ path.hashCode ^ folderName.hashCode;
}
