// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_ddd_template/src/features/login/application/login_command_handler.dart'
    as _i7;
import 'package:flutter_ddd_template/src/features/login/domain/interfaces/login_api_provider_interface.dart'
    as _i3;
import 'package:flutter_ddd_template/src/features/login/domain/interfaces/login_repository_interface.dart'
    as _i5;
import 'package:flutter_ddd_template/src/features/login/infrastructure/repositories/login_api_provider.dart'
    as _i4;
import 'package:flutter_ddd_template/src/features/login/infrastructure/repositories/login_repository.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LoginApiProviderInterface>(() => _i4.LoginApiProvider());
    gh.factory<_i5.LoginRepositoryInterface>(
        () => _i6.LoginRepository(gh<_i3.LoginApiProviderInterface>()));
    gh.factory<_i7.LoginCommandHandler>(
        () => _i7.LoginCommandHandler(gh<_i5.LoginRepositoryInterface>()));
    return this;
  }
}
