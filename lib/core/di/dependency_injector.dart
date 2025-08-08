import 'package:get_it/get_it.dart';
import 'package:pickle_rick/core/network/api/api_handler.dart';
import 'package:pickle_rick/core/network/api/client/api.dart';
import 'package:pickle_rick/core/network/impls/api/api_handler_impl.dart';
import 'package:pickle_rick/core/network/impls/api/client/api_client.dart';
import 'package:pickle_rick/core/network/impls/api/interceptors/custom_interceptors.dart';
import 'package:pickle_rick/data/characteres/datasource/characteres_datasource.dart';
import 'package:pickle_rick/data/characteres/repository/characteres_repository_impl.dart';
import 'package:pickle_rick/domain/characteres/repository/characteres_repository.dart';
import 'package:pickle_rick/domain/characteres/usecases/get_characteres_usecase.dart';
import 'package:pickle_rick/presentation/characteres/provider/characteres_provider.dart';

class DependencyInjector {
  static GetIt getIt = GetIt.instance;

  void setup() {
    _setupCore();
    _setupApi();
    _setupDatasources();
    _setupRepositories();
    _setupUsecases();
    _setupProviders();
  }

  void _setupCore() {}

  void _setupApi() {
    getIt.registerFactory<CustomInterceptors>(() => CustomInterceptors());
    getIt.registerFactory<Api>(() => ApiClient(getIt()));
    getIt.registerFactory<ApiHandler>(() => ApiHandlerImpl(getIt()));
  }

  void _setupDatasources() {
    getIt.registerFactory<CharacteresDatasource>(
      () => CharacteresDatasource(getIt()),
    );
  }

  void _setupRepositories() {
    getIt.registerFactory<CharacteresRepository>(
      () => CharacteresRepositoryImpl(getIt()),
    );
  }

  void _setupUsecases() {
    getIt.registerFactory<GetCharactersUseCase>(
      () => GetCharactersUseCase(getIt()),
    );
  }

  void dispose() {
    getIt.reset();
  }

  void _setupProviders() {
    getIt.registerFactory<CharacteresListProvider>(
      () => CharacteresListProvider(getIt()),
    );
  }
}
