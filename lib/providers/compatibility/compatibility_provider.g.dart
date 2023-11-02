// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compatibility_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$compatibilityHash() => r'2e88f15e817fb3c5d3cbc2ce1179828cbe9f6613';

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

/// See also [compatibility].
@ProviderFor(compatibility)
const compatibilityProvider = CompatibilityFamily();

/// See also [compatibility].
class CompatibilityFamily extends Family<AsyncValue<String>> {
  /// See also [compatibility].
  const CompatibilityFamily();

  /// See also [compatibility].
  CompatibilityProvider call(
    String sign1,
    String sign2,
    String language,
  ) {
    return CompatibilityProvider(
      sign1,
      sign2,
      language,
    );
  }

  @override
  CompatibilityProvider getProviderOverride(
    covariant CompatibilityProvider provider,
  ) {
    return call(
      provider.sign1,
      provider.sign2,
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
  String? get name => r'compatibilityProvider';
}

/// See also [compatibility].
class CompatibilityProvider extends AutoDisposeFutureProvider<String> {
  /// See also [compatibility].
  CompatibilityProvider(
    String sign1,
    String sign2,
    String language,
  ) : this._internal(
          (ref) => compatibility(
            ref as CompatibilityRef,
            sign1,
            sign2,
            language,
          ),
          from: compatibilityProvider,
          name: r'compatibilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$compatibilityHash,
          dependencies: CompatibilityFamily._dependencies,
          allTransitiveDependencies:
              CompatibilityFamily._allTransitiveDependencies,
          sign1: sign1,
          sign2: sign2,
          language: language,
        );

  CompatibilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sign1,
    required this.sign2,
    required this.language,
  }) : super.internal();

  final String sign1;
  final String sign2;
  final String language;

  @override
  Override overrideWith(
    FutureOr<String> Function(CompatibilityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CompatibilityProvider._internal(
        (ref) => create(ref as CompatibilityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sign1: sign1,
        sign2: sign2,
        language: language,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _CompatibilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompatibilityProvider &&
        other.sign1 == sign1 &&
        other.sign2 == sign2 &&
        other.language == language;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sign1.hashCode);
    hash = _SystemHash.combine(hash, sign2.hashCode);
    hash = _SystemHash.combine(hash, language.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CompatibilityRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `sign1` of this provider.
  String get sign1;

  /// The parameter `sign2` of this provider.
  String get sign2;

  /// The parameter `language` of this provider.
  String get language;
}

class _CompatibilityProviderElement
    extends AutoDisposeFutureProviderElement<String> with CompatibilityRef {
  _CompatibilityProviderElement(super.provider);

  @override
  String get sign1 => (origin as CompatibilityProvider).sign1;
  @override
  String get sign2 => (origin as CompatibilityProvider).sign2;
  @override
  String get language => (origin as CompatibilityProvider).language;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
