sealed class SyncStatus {}

class SyncStatusReady implements SyncStatus {
  const SyncStatusReady();
}

class SyncStatusProgress implements SyncStatus {
  const SyncStatusProgress({
    required this.count,
    required this.total,
  })  : assert(count >= 0 && total >= 0),
        assert(count <= total);

  final int count;
  final int total;

  double get progress => count / total;

  @override
  String toString() => 'SyncStatusProgress(count: $count, total: $total)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SyncStatusProgress && other.count == count && other.total == total;
  }

  @override
  int get hashCode => count.hashCode ^ total.hashCode;
}

class SyncStatusCompleted implements SyncStatus {
  const SyncStatusCompleted({
    required this.itemsSynced,
  });

  final int itemsSynced;

  @override
  String toString() => 'SyncStatusCompleted(itemsSynced: $itemsSynced)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SyncStatusCompleted && other.itemsSynced == itemsSynced;
  }

  @override
  int get hashCode => itemsSynced.hashCode;
}
