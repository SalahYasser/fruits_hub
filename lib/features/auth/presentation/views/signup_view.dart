import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_app_bar.dart';
import 'package:fruits_hub/core/services/git_it_service.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: SignupViewBody(),
      ),
    );
  }
}
