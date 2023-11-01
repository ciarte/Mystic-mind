// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dayli_horoscope_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dayliHoroscopeHash() => r'7451f76916a985d7eba6b23eda9ece78227b7369';

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

/// See also [dayliHoroscope].
@ProviderFor(dayliHoroscope)
const dayliHoroscopeProvider = DayliHoroscopeFamily();

/// See also [dayliHoroscope].
class DayliHoroscopeFamily extends Family<AsyncValue<Horoscope>> {
  /// See also [dayliHoroscope].
  const DayliHoroscopeFamily();

  /// See also [dayliHoroscope].
  DayliHoroscopeProvider call(
    String sign,
    String date,
    String language,
  ) {
    return DayliHoroscopeProvider(
      sign,
      date,
      language,
    );
  }

  @override
  DayliHoroscopeProvider getProviderOverride(
    covariant DayliHoroscopeProvider provider,
  ) {
    return call(
      provider.sign,
      provider.date,
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
  String? get name => r'dayliHoroscopeProvider';
}

/// See also [dayliHoroscope].
class DayliHoroscopeProvider extends AutoDisposeFutureProvider<Horoscope> {
  /// See also [dayliHoroscope].
  DayliHoroscopeProvider(
    String sign,
    String date,
    String language,
  ) : this._internal(
          (ref) => dayliHoroscope(
            ref as DayliHoroscopeRef,
            sign,
            date,
            language,
          ),
          from: dayliHoroscopeProvider,
          name: r'dayliHoroscopeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dayliHoroscopeHash,
          dependencies: DayliHoroscopeFamily._dependencies,
          allTransitiveDependencies:
              DayliHoroscopeFamily._allTransitiveDependencies,
          sign: sign,
          date: date,
          language: language,
        );

  DayliHoroscopeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sign,
    required this.date,
    required this.language,
  }) : super.internal();

  final String sign;
  final String date;
  final String language;

  @override
  Override overrideWith(
    FutureOr<Horoscope> Function(DayliHoroscopeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DayliHoroscopeProvider._internal(
        (ref) => create(ref as DayliHoroscopeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sign: sign,
        date: date,
        language: language,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Horoscope> createElement() {
    return _DayliHoroscopeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DayliHoroscopeProvider &&
        other.sign == sign &&
        other.date == date &&
        other.language == language;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sign.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, language.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DayliHoroscopeRef on AutoDisposeFutureProviderRef<Horoscope> {
  /// The parameter `sign` of this provider.
  String get sign;

  /// The parameter `date` of this provider.
  String get date;

  /// The parameter `language` of this provider.
  String get language;
}

class _DayliHoroscopeProviderElement
    extends AutoDisposeFutureProviderElement<Horoscope> with DayliHoroscopeRef {
  _DayliHoroscopeProviderElement(super.provider);

  @override
  String get sign => (origin as DayliHoroscopeProvider).sign;
  @override
  String get date => (origin as DayliHoroscopeProvider).date;
  @override
  String get language => (origin as DayliHoroscopeProvider).language;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
