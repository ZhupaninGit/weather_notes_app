import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_notes_app/ui/screens/home/widgets/colapsed_weather_widget.dart';
import 'package:weather_notes_app/ui/screens/home/widgets/expanded_weather_widget.dart';
import 'package:weather_notes_app/ui/view_models/auth_view_model.dart';

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
    final needToCollapse = _scrollController.offset >
        (expandedBarHeight - collapsedBarHeight);
    
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
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            _buildSliverAppBar(context),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text("Index $index")),
                childCount: 20,
              ),
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
        background:  ExpandedWeatherWidget(),
      ),
    );
  }
}
