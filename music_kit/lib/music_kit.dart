import 'package:music_kit_platform_interface/method_channel/method_channel_music_kit.dart';
import 'package:music_kit_platform_interface/music_kit_platform_interface.dart';

export 'package:music_kit_platform_interface/music_kit_platform_interface.dart'
    show
        MusicAuthorizationStatus,
        MusicSubscription,
        MusicPlayerState,
        MusicPlayerQueue,
        MusicPlayerQueueEntry,
        MusicPlayerPlaybackStatus,
        MusicPlayerRepeatMode,
        MusicPlayerShuffleMode;

class MusicKit {
  factory MusicKit() {
    _singleton ??= MusicKit._();
    return _singleton!;
  }

  MusicKit._();

  static MusicKit? _singleton;

  static MusicKitPlatform get _platform {
    return MusicKitPlatform.instance;
  }

  final MethodChannelMusicKit _methodChannelMusicKit = MethodChannelMusicKit();

  Future<void> initialize(String developerToken, {String? musicUserToken}) =>
      _methodChannelMusicKit.initialize(developerToken,
          musicUserToken: musicUserToken);

  Future<MusicAuthorizationStatus> requestAuthorizationStatus() =>
      _methodChannelMusicKit.requestAuthorizationStatus();

  Future<MusicAuthorizationStatus> get authorizationStatus =>
      _methodChannelMusicKit.authorizationStatus;

  Future<String> requestDeveloperToken() =>
      _methodChannelMusicKit.requestDeveloperToken();

  Future<String> requestUserToken(String developerToken) =>
      _methodChannelMusicKit.requestUserToken(developerToken);

  Future<String> get currentCountryCode =>
      _methodChannelMusicKit.currentCountryCode;

  Stream<MusicSubscription> get onSubscriptionUpdated =>
      _methodChannelMusicKit.onSubscriptionUpdated;

  // player
  Future<bool> get isPreparedToPlay => _platform.isPreparedToPlay;

  Future<double> get playbackTime => _platform.playbackTime;

  Future<MusicPlayerState> get musicPlayerState => _platform.musicPlayerState;

  Stream<MusicPlayerState> get onMusicPlayerStateChanged =>
      _platform.onMusicPlayerStateChanged;

  Future<void> beginSeekingBackward() => _platform.beginSeekingBackward();

  Future<void> beginSeekingForward() => _platform.beginSeekingForward();

  Future<void> endSeeking() => _platform.endSeeking();

  Future<void> pause() => _platform.pause();

  Future<void> play() => _platform.play();

  Future<void> prepareToPlay() => _platform.prepareToPlay();

  Future<void> restartCurrentEntry() => _platform.restartCurrentEntry();

  Future<void> skipToNextEntry() => _platform.skipToNextEntry();

  Future<void> skipToPreviousEntry() => _platform.skipToPreviousEntry();

  Future<void> stop() => _platform.stop();

  Future<void> setQueue(String type, {required ResourceObject item}) =>
      _platform.setQueue(
        type,
        item: item,
      );

  Future<void> setQueueWithItems(
    String type, {
    required List<ResourceObject> items,
    int? startingAt,
  }) =>
      _platform.setQueueWithItems(
        type,
        items: items,
        startingAt: startingAt,
      );

  Stream<MusicPlayerQueue> get onPlayerQueueChanged =>
      _platform.onPlayerQueueChanged;

  Future<MusicPlayerRepeatMode> get repeatMode => _platform.repeatMode;

  Future<void> setRepeatMode(MusicPlayerRepeatMode mode) =>
      _platform.setRepeatMode(mode);

  Future<MusicPlayerRepeatMode> toggleRepeatMode() =>
      _platform.toggleRepeatMode();

  Future<MusicPlayerShuffleMode> get shuffleMode => _platform.shuffleMode;

  Future<void> setShuffleMode(MusicPlayerShuffleMode mode) =>
      _platform.setShuffleMode(mode);

  Future<MusicPlayerShuffleMode> toggleShuffleMode() =>
      _platform.toggleShuffleMode();
}
