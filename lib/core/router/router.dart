import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_notes_app/core/router/guards/auth_guard.dart';
import 'package:weather_notes_app/data/models/note.dart';
import 'package:weather_notes_app/features/auth/view/auth_screen.dart';
import 'package:weather_notes_app/features/home/view/home_screen.dart';
import 'package:weather_notes_app/features/home/widgets/create_or_update_note_widget.dart';
import 'package:weather_notes_app/features/location_select/view/location_select_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          guards: [
            AuthGuard(),
          ],
        ),
        AutoRoute(
          page: LocationSelectRoute.page,
        ),
        AutoRoute(page: CreateOrUpdateNoteRoute.page,)
   
      ];
}
