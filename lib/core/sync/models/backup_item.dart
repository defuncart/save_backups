class BackupItem {
  const BackupItem({
    required this.path,
    required this.folderName,
  });

  final String path;
  final String folderName;

  @override
  String toString() => 'BackupItem(path: $path, folderName: $folderName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BackupItem && other.path == path && other.folderName == folderName;
  }

  @override
  int get hashCode => path.hashCode ^ folderName.hashCode;
}
