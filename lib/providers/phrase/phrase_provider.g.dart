// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dayliPhraseHash() => r'253d654978948608211a93aab545cc25720e0dbd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [dayliPhrase].
@ProviderFor(dayliPhrase)
const dayliPhraseProvider = DayliPhraseFamily();

/// See also [dayliPhrase].
class DayliPhraseFamily extends Family<AsyncValue<String>> {
  /// See also [dayliPhrase].
  const DayliPhraseFamily();

  /// See also [dayliPhrase].
  DayliPhraseProvider call(
    String language,
  ) {
    return DayliPhraseProvider(
      language,
    );
  }

  @override
  DayliPhraseProvider getProviderOverride(
    covariant DayliPhraseProvider provider,
  ) {
    return call(
      provider.language,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dayliPhraseProvider';
}

/// See also [dayliPhrase].
class DayliPhraseProvider extends AutoDisposeFutureProvider<String> {
  /// See also [dayliPhrase].
  DayliPhraseProvider(
    String language,
  ) : this._internal(
          (ref) => dayliPhrase(
            ref as DayliPhraseRef,
            language,
          ),
          from: dayliPhraseProvider,
          name: r'dayliPhraseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dayliPhraseHash,
          dependencies: DayliPhraseFamily._dependencies,
          allTransitiveDependencies:
              DayliPhraseFamily._allTransitiveDependencies,
          language: language,
        );

  DayliPhraseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.language,
  }) : super.internal();

  final String language;

  @override
  Override overrideWith(
    FutureOr<String> Function(DayliPhraseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DayliPhraseProvider._internal(
        (ref) => create(ref as DayliPhraseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        language: language,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _DayliPhraseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DayliPhraseProvider && other.language == language;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, language.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DayliPhraseRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `language` of this provider.
  String get language;
}

class _DayliPhraseProviderElement
    extends AutoDisposeFutureProviderElement<String> with DayliPhraseRef {
  _DayliPhraseProviderElement(super.provider);

  @override
  String get language => (origin as DayliPhraseProvider).language;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
