import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/user.dart';

import '../cubit/home_cubit.dart';
import 'widgets.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    required this.profile,
    super.key,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: HomeSideMenu(
          profile: profile,
          onLogOut: context.read<HomeCubit>().signOut,
        ),
      ),
      backgroundColor: TokioMarineColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: TokioMarineColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: TokioMarineColors.white,
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: TokioMarineLogo.white(
          height: TokioMarineSpacing.of_7,
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_none,
                  color: TokioMarineColors.white,
                  size: 28,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: TokioMarineColors.pink,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                // maxWidth: kIsWeb ? 1100 : double.infinity,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadWidget(
                  profile: profile,
                ),
                const SizedBox(height: TokioMarineSpacing.of_4),
                QuickActionsMenu(),
                const SizedBox(height: TokioMarineSpacing.of_5),
                const MyFamilyWidget(),
                const SizedBox(height: TokioMarineSpacing.of_5),
                const PoliciesContractedWidget(),
                const SizedBox(height: TokioMarineSpacing.of_6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
