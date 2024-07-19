import 'package:flutter/foundation.dart';

class NotificationProvider extends ChangeNotifier {
  int _unreadCount = 2; // Initialize with your initial unread count

  int get unreadCount => _unreadCount;

  void updateUnreadCount(int count) {
    _unreadCount = count;
    notifyListeners();
  }

  void decrementUnreadCount() {
    if (_unreadCount > 0) {
      _unreadCount--;
      notifyListeners();
    }
  }
}
