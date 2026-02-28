import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:mocktail/mocktail.dart';
import 'package:local_storage_manager/local_storage_manager.dart';
import 'package:network_manager/network_manager.dart';
import 'package:pragma_acercamiento/core/di/injection_container.dart';
import 'package:pragma_acercamiento/data/repositories/cat_local_repository_impl.dart';
import 'package:pragma_acercamiento/data/repositories/cat_repository_impl.dart';
import 'package:pragma_acercamiento/data/services/cat_service.dart';
import 'package:pragma_acercamiento/domain/repositories/cat_repository.dart';
import 'package:pragma_acercamiento/domain/repositories/i_cat_local_repository.dart';
import 'package:pragma_acercamiento/flavors/flavor.dart';
import 'package:pragma_acercamiento/flavors/flavor_config.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    // We need to initialize the flavor config before using the InjectionContainer
    // because it depends on FlavorConfig for the base URL.
    FlavorConfig.setFlavor(flavor: Flavor.dev, appName: 'Development', apiBaseUrl: 'http://test.url.com', isProduction: false);
  });

  group('InjectionContainer Smoke Test', () {
    late InjectionContainer injectionContainer;

    setUp(() {
      injectionContainer = InjectionContainer();
      getItApp.allowReassignment = true;
    });

    tearDown(() async {
      await getItApp.reset();
    });

    test('should register all core dependencies correctly', () async {
      // Act
      await injectionContainer.init();

      // Assert registrations
      expect(getItApp.isRegistered<ILocalStorage>(), isTrue);
      expect(getItApp.isRegistered<AppNetworkClient>(), isTrue);
      expect(getItApp.isRegistered<CatService>(), isTrue);
      expect(getItApp.isRegistered<ICatLocalRepository>(), isTrue);
      expect(getItApp.isRegistered<CatRepository>(), isTrue);

      // Assert resolution doesn't throw and returns the correct instance types
      expect(getItApp<ILocalStorage>(), isA<ObjectBoxLocalStorage>());
      expect(getItApp<AppNetworkClient>(), isA<AppDioNetworkClient>());
      expect(getItApp<CatService>(), isNotNull);

      final localRepo = getItApp<ICatLocalRepository>();
      expect(localRepo, isA<CatLocalRepositoryImpl>());

      final catRepo = getItApp<CatRepository>();
      expect(catRepo, isA<CatRepositoryImpl>());
    });

    test('completeObjectBoxInitialization should initialize local storage', () async {
      // Mock path_provider channel
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/path_provider'),
        (MethodCall methodCall) async {
          return '/temp/dir';
        },
      );
      // For Windows/Linux path provider might use a different channel, so we mock it generically if possible or rely on the abstract platform.
      // Easiest is to avoid the channel crash by registering mock before init if possible, but path_provider makes an async channel call.

      final mockLocalStorage = _MockLocalStorage();
      when(() => mockLocalStorage.init(any(), any())).thenAnswer((_) async {});

      getItApp.allowReassignment = true;
      getItApp.registerSingleton<ILocalStorage>(mockLocalStorage);

      setupPathProviderMock();

      await injectionContainer.completeObjectBoxInitialization();

      verify(() => mockLocalStorage.init(any(), any())).called(1);
    });

    test('disposeDependencies should close local storage and reset GetIt', () async {
      final mockLocalStorage = _MockLocalStorage();
      when(() => mockLocalStorage.close()).thenAnswer((_) async {});

      getItApp.registerSingleton<ILocalStorage>(mockLocalStorage);

      await injectionContainer.disposeDependencies();

      verify(() => mockLocalStorage.close()).called(1);
      // getItApp.reset() clears all registered instances
      expect(getItApp.isRegistered<ILocalStorage>(), isFalse);
    });
  });
}

class _MockLocalStorage extends Mock implements ILocalStorage {}

// Helper to mock path provider for tests
void setupPathProviderMock() {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
    const MethodChannel('plugins.flutter.io/path_provider'),
    (MethodCall methodCall) async {
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return '/temp/dir';
      }
      return null;
    },
  );

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
    const MethodChannel('plugins.flutter.io/path_provider_windows'),
    (MethodCall methodCall) async {
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return '/temp/dir';
      }
      return null;
    },
  );
}
