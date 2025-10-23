import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/check_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/home/widgets/discover_songs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVectors.logo, height: 40),
        hideBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_homepageHeroCard(), _tabs(), _tabsContent()],
        ),
      ),
    );
  }

  Widget _homepageHeroCard() {
    return Center(
      child: SizedBox(
        height: 150,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.homepageHeroCard),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Image.asset(AppImages.homepageHeroImg),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary,
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      dividerHeight: 0,
      tabs: [
        Text(
          "Discover",
          style: TextStyle(
            fontVariations: [FontVariation("wght", 500)],
            fontSize: 16,
          ),
        ),
        Text(
          "Videos",
          style: TextStyle(
            fontVariations: [FontVariation("wght", 500)],
            fontSize: 16,
          ),
        ),
        Text(
          "Artists",
          style: TextStyle(
            fontVariations: [FontVariation("wght", 500)],
            fontSize: 16,
          ),
        ),
        Text(
          "Podcasts",
          style: TextStyle(
            fontVariations: [FontVariation("wght", 500)],
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _tabsContent() {
    return SizedBox(
      height: 240,
      child: TabBarView(
        controller: _tabController,
        children: [DiscoverSongs(), Container(), Container(), Container()],
      ),
    );
  }
}
