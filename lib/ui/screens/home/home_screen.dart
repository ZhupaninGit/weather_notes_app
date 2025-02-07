import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_notes_app/ui/screens/home/notes_widgets/create_or_update_note_widget.dart';
import 'package:weather_notes_app/ui/screens/home/notes_widgets/notes_list_widget.dart';
import 'package:weather_notes_app/ui/screens/home/weather_widgets/colapsed_weather_widget.dart';
import 'package:weather_notes_app/ui/screens/home/weather_widgets/expanded_weather_widget.dart';
import 'package:weather_notes_app/ui/view_models/auth_view_model.dart';
import 'package:weather_notes_app/ui/view_models/notes_view_model.dart';

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
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => CreateOrUpdateNoteScreen()));
          },
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            _buildSliverAppBar(context),
            ChangeNotifierProvider(
              create: (_) => NotesViewModel(),
              child: NotesListWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
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
            await context.read<AuthViewModel>().onSignOutButtonPress(context);
          },
          icon: const Icon(Icons.logout_outlined),
        ),
      ],
      flexibleSpace: const FlexibleSpaceBar(
        background: ExpandedWeatherWidget(),
      ),
    );
  }
}
