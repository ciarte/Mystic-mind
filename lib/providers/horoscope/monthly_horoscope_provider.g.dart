// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_horoscope_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$monthlyHoroscopeHash() => r'ad98c41654f7f31281979b6ff0bf5afa00512763';

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

/// See also [monthlyHoroscope].
@ProviderFor(monthlyHoroscope)
const monthlyHoroscopeProvider = MonthlyHoroscopeFamily();

/// See also [monthlyHoroscope].
class MonthlyHoroscopeFamily extends Family<AsyncValue<Horoscope>> {
  /// See also [monthlyHoroscope].
  const MonthlyHoroscopeFamily();

  /// See also [monthlyHoroscope].
  MonthlyHoroscopeProvider call(
    String sign,
    String date,
  ) {
    return MonthlyHoroscopeProvider(
      sign,
      date,
    );
  }

  @override
  MonthlyHoroscopeProvider getProviderOverride(
    covariant MonthlyHoroscopeProvider provider,
  ) {
    return call(
      provider.sign,
      provider.date,
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
  String? get name => r'monthlyHoroscopeProvider';
}

/// See also [monthlyHoroscope].
class MonthlyHoroscopeProvider extends AutoDisposeFutureProvider<Horoscope> {
  /// See also [monthlyHoroscope].
  MonthlyHoroscopeProvider(
    String sign,
    String date,
  ) : this._internal(
          (ref) => monthlyHoroscope(
            ref as MonthlyHoroscopeRef,
            sign,
            date,
          ),
          from: monthlyHoroscopeProvider,
          name: r'monthlyHoroscopeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$monthlyHoroscopeHash,
          dependencies: MonthlyHoroscopeFamily._dependencies,
          allTransitiveDependencies:
              MonthlyHoroscopeFamily._allTransitiveDependencies,
          sign: sign,
          date: date,
        );

  MonthlyHoroscopeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sign,
    required this.date,
  }) : super.internal();

  final String sign;
  final String date;

  @override
  Override overrideWith(
    FutureOr<Horoscope> Function(MonthlyHoroscopeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MonthlyHoroscopeProvider._internal(
        (ref) => create(ref as MonthlyHoroscopeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sign: sign,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Horoscope> createElement() {
    return _MonthlyHoroscopeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthlyHoroscopeProvider &&
        other.sign == sign &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sign.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MonthlyHoroscopeRef on AutoDisposeFutureProviderRef<Horoscope> {
  /// The parameter `sign` of this provider.
  String get sign;

  /// The parameter `date` of this provider.
  String get date;
}

class _MonthlyHoroscopeProviderElement
    extends AutoDisposeFutureProviderElement<Horoscope>
    with MonthlyHoroscopeRef {
  _MonthlyHoroscopeProviderElement(super.provider);

  @override
  String get sign => (origin as MonthlyHoroscopeProvider).sign;
  @override
  String get date => (origin as MonthlyHoroscopeProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
