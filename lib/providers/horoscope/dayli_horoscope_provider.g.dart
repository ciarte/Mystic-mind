// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dayli_horoscope_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dayliHoroscopeHash() => r'6a676660a5e8b32ca7e8079cb07b466be0080c32';

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
  ) {
    return DayliHoroscopeProvider(
      sign,
    );
  }

  @override
  DayliHoroscopeProvider getProviderOverride(
    covariant DayliHoroscopeProvider provider,
  ) {
    return call(
      provider.sign,
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
  ) : this._internal(
          (ref) => dayliHoroscope(
            ref as DayliHoroscopeRef,
            sign,
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
        );

  DayliHoroscopeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sign,
  }) : super.internal();

  final String sign;

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
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Horoscope> createElement() {
    return _DayliHoroscopeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DayliHoroscopeProvider && other.sign == sign;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sign.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DayliHoroscopeRef on AutoDisposeFutureProviderRef<Horoscope> {
  /// The parameter `sign` of this provider.
  String get sign;
}

class _DayliHoroscopeProviderElement
    extends AutoDisposeFutureProviderElement<Horoscope> with DayliHoroscopeRef {
  _DayliHoroscopeProviderElement(super.provider);

  @override
  String get sign => (origin as DayliHoroscopeProvider).sign;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
