// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/login/application/login_command_handler.dart'
    as _i10;
import '../../features/auth/login/domain/interfaces/login_repository_interface.dart'
    as _i5;
import '../../features/auth/login/infrastructure/repositories/login_repository.dart'
    as _i6;
import '../../features/auth/sign_up/application/sign_up_command_handler.dart'
    as _i9;
import '../../features/auth/sign_up/domain/interfaces/sign_up_repository_interface.dart'
    as _i7;
import '../../features/auth/sign_up/infrastructure/repositories/sign_up_repository.dart'
    as _i8;
import '../../features/splash/application/auto_login_command_handler.dart'
    as _i13;
import '../../features/splash/domain/interfaces/log_in_repository_interface.dart'
    as _i11;
import '../../features/splash/domain/interfaces/logged_user_repository_interface.dart'
    as _i3;
import '../../features/splash/infrastructure/repositories/log_in_repository.dart'
    as _i12;
import '../../features/splash/infrastructure/repositories/logged_user_repository.dart'
    as _i4;

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
    gh.factory<_i3.LoggedUserRepositoryInterface>(
        () => _i4.LoggedUserRepository());
    gh.factory<_i5.LoginRepositoryInterface>(() => _i6.LoginRepository());
    gh.factory<_i7.SignUpRepositoryInterface>(() => _i8.SignUpRepository());
    gh.factory<_i9.SingUpCommandHandler>(
        () => _i9.SingUpCommandHandler(gh<_i7.SignUpRepositoryInterface>()));
    gh.factory<_i10.LoginCommandHandler>(
        () => _i10.LoginCommandHandler(gh<_i5.LoginRepositoryInterface>()));
    gh.factory<_i11.LogInRepositoryInterface>(
        () => _i12.LogInRepository(gh<_i10.LoginCommandHandler>()));
    gh.factory<_i13.AutoLoginCommandHandler>(() => _i13.AutoLoginCommandHandler(
          gh<_i11.LogInRepositoryInterface>(),
          gh<_i3.LoggedUserRepositoryInterface>(),
        ));
    return this;
  }
}
