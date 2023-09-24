class BackupItem {
  const BackupItem({
    required this.id,
    required this.path,
    required this.folderName,
  });

  final String id;
  final String path;
  final String folderName;

  @override
  String toString() => 'BackupItem(id: $id, path: $path, folderName: $folderName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BackupItem && other.id == id && other.path == path && other.folderName == folderName;
  }

  @override
  int get hashCode => path.hashCode ^ folderName.hashCode;
}
