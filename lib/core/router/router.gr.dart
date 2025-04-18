// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthScreen();
    },
  );
}

/// generated route for
/// [CreateOrUpdateNoteScreen]
class CreateOrUpdateNoteRoute
    extends PageRouteInfo<CreateOrUpdateNoteRouteArgs> {
  CreateOrUpdateNoteRoute({Key? key, Note? note, List<PageRouteInfo>? children})
    : super(
        CreateOrUpdateNoteRoute.name,
        args: CreateOrUpdateNoteRouteArgs(key: key, note: note),
        initialChildren: children,
      );

  static const String name = 'CreateOrUpdateNoteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateOrUpdateNoteRouteArgs>(
        orElse: () => const CreateOrUpdateNoteRouteArgs(),
      );
      return CreateOrUpdateNoteScreen(key: args.key, note: args.note);
    },
  );
}

class CreateOrUpdateNoteRouteArgs {
  const CreateOrUpdateNoteRouteArgs({this.key, this.note});

  final Key? key;

  final Note? note;

  @override
  String toString() {
    return 'CreateOrUpdateNoteRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LocationSelectScreen]
class LocationSelectRoute extends PageRouteInfo<void> {
  const LocationSelectRoute({List<PageRouteInfo>? children})
    : super(LocationSelectRoute.name, initialChildren: children);

  static const String name = 'LocationSelectRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LocationSelectScreen();
    },
  );
}
