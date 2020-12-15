import 'dart:async';

import 'package:background_location_tracker/src/channel/background_channel.dart';
import 'package:background_location_tracker/src/channel/foreground_channel.dart';
import 'package:background_location_tracker/src/model/background_location_update_data.dart';
import 'package:background_location_tracker/src/model/config/background_location_tracker_config.dart';
import 'package:background_location_tracker/src/util/logger.dart';

typedef LocationUpdateCallback = void Function(BackgroundLocationUpdateData data);

class BackgroundLocationTrackerManager {

  static Future<void> initialize(Function callback, {BackgroundLocationTrackerConfig config}) {
    final pluginConfig = config ??= const BackgroundLocationTrackerConfig();
    BackgroundLocationTrackerLogger.enableLogging = pluginConfig.loggingEnabled;
    return ForegroundChannel.initialize(callback, config: pluginConfig);
  }

  static Future<bool> isTracking() async => ForegroundChannel.isTracking();

  static Future<void> startTracking() async => ForegroundChannel.startTracking();

  static Future<void> stopTracking() async => ForegroundChannel.stopTracking();

  static void handleBackgroundUpdated(LocationUpdateCallback callback) => BackgroundChannel.handleBackgroundUpdated(callback);
}
