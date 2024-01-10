

import '../../data/model/base/api_response.dart';

abstract class NotificationRepository {

  Future<ApiResponse> getNotifications({required int page});
  Future<ApiResponse> getUnreadNotificationCount();
  Future<ApiResponse> readNotification({required String notificationId});


}
