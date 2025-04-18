import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_notes_app/core/router/router.dart';
import 'package:weather_notes_app/features/auth/view/bloc/auth_bloc.dart';
import 'package:weather_notes_app/features/home/view/bloc/notes_bloc/notes_bloc.dart';
import 'package:weather_notes_app/features/home/view/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_notes_app/features/home/widgets/widget.dart';


@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isCollapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    context.read<WeatherBloc>().add(FetchWeatherEvent());
    context.read<NotesBloc>().add(FetchNotesEvent());
  }

  void _handleScroll() {
    const collapsedBarHeight = 60.0;
    const expandedBarHeight = 220.0;
    final needToCollapse =
        _scrollController.offset > (expandedBarHeight - collapsedBarHeight);

    if (needToCollapse != _isCollapsed) {
      setState(() => _isCollapsed = needToCollapse);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_outlined),
          onPressed: () => context.router.navigate(CreateOrUpdateNoteRoute())
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            _buildSliverAppBar(context),
            NotesListWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.router.replaceAll([const AuthRoute()]);
        }
      },
      builder: (context, state) {
        return SliverAppBar(
          expandedHeight: 220.0,
          collapsedHeight: 60.0,
          centerTitle: false,
          pinned: true,
          title: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: _isCollapsed ? 1 : 0,
            child: const CollapsedWeatherWidget(),
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () async {
                context.read<AuthBloc>().add(const AuthEvent.logOutEvent());
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
          flexibleSpace: const FlexibleSpaceBar(
            background: ExpandedWeatherWidget(),
          ),
        );
      },
    );
  }
}
