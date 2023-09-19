enum SyncStatus {
  ready,
  inProgress,
  complete,
}

class SyncProgress {
  const SyncProgress({
    required this.status,
    required this.progress,
  });

  final SyncStatus status;
  final double progress;

  @override
  String toString() => 'SyncProgress(status: $status, progress: $progress)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SyncProgress && other.status == status && other.progress == progress;
  }

  @override
  int get hashCode => status.hashCode ^ progress.hashCode;
}
