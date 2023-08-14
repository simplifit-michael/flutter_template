extension DurationExtension on Duration {
  String toFormattedString() {
    final hoursStr = '$inHours'.padLeft(2, '0');
    final minStr = '${inMinutes % 60}'.padLeft(2, '0');
    final secStr = '${inSeconds % 60}'.padLeft(2, '0');
    return '$hoursStr:$minStr:$secStr';
  }
}
