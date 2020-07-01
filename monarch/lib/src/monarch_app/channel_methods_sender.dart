import 'package:flutter/services.dart';

import 'package:monarch_utils/log.dart';
import 'channel_methods.dart';

class ChannelMethodsSender with Log {
  
  final MethodChannel _dropsourceStorybookChannel = Channels.dropsourceStorybookChannel;

  Future<T> _invokeStorybookChannelMethod<T>(String method, [ dynamic arguments ]) async {
    log.info('sending channel method: $method');
    return _dropsourceStorybookChannel.invokeMethod(method, arguments);
  }

  Future sendPing() {
    return _invokeStorybookChannelMethod(MethodNames.ping);
  }

  Future sendDeviceDefinitions(OutboundChannelArgument definitions) {
    return _invokeStorybookChannelMethod(MethodNames.deviceDefinitions, definitions.toStandardMap());
  }

  Future sendStandardThemes(OutboundChannelArgument definitions) {
    return _invokeStorybookChannelMethod(MethodNames.standardThemes, definitions.toStandardMap());
  }

  Future sendDefaultTheme(String id) {
    return _invokeStorybookChannelMethod(MethodNames.defaultTheme, { 'themeId' : id });
  }

  Future sendStorybookData(OutboundChannelArgument storybookData) {
    return _invokeStorybookChannelMethod(MethodNames.storybookData, storybookData.toStandardMap());
  }

  Future sendReadySignal() {
    return _invokeStorybookChannelMethod(MethodNames.readySignal);
  }
}

final channelMethodsSender = ChannelMethodsSender();