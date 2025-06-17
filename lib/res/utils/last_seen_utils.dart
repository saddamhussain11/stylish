import 'package:intl/intl.dart';

class LastSeenUtils {
  static String formatLastSeen(DateTime? lastSeen) {
    if (lastSeen == null) return 'Offline';

    final now = DateTime.now().toUtc();
    final difference = now.difference(lastSeen.toUtc());

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return ' ${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return ' ${difference.inHours} hours ago';
    } else if (difference.inDays == 1) {
      return ' yesterday';
    } else if (difference.inDays < 7) {
      return ' ${difference.inDays} days ago';
    } else {
      return ' ${DateFormat('dd MMM yyyy').format(lastSeen)}';
    }
  }
}
