import 'package:bdgol/data/country_map_data.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../data/recently_join_provider_data.dart';
import '../utils/app_theme_color.dart';
import '../widgets/bdgol_appbar.dart';
import '../widgets/featured_provider_listview_item.dart';
import '../widgets/home_country_grid_item.dart';
import '../widgets/recently_joined_provider_listiew_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<Map<String, dynamic>> countries = CountryMapData.countries;
final List<Map<String, dynamic>> providerdata =
    RecentlyJoinProviderData.ProviderData;

final int _visitorscount = 300;
final int _categoriesCount = 40;
final int _providersCount = 38;

class _HomeScreenState extends State<HomeScreen> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'q_pSlaO01-8',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BDGOLAppBar(),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            _buildAppLogo(),
            SizedBox(height: 14),
            _buildVideoBannerwithSummary(),
            SizedBox(height: 12),
            _buildSelectYourCountryText(),
            _buildCountryGridView(),
            SizedBox(height: 8),
            _buildRecentlyJoinedProviderText(),
            _buildProviderListview(),
            SizedBox(height: 16),
            _buildFeaturedProviderText(),
            _buildFeaturedProviderListView(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  SizedBox _buildFeaturedProviderListView() {
    return SizedBox(
      height: 330,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return FeaturedProviderListviewItem();
        },
      ),
    );
  }

  Padding _buildFeaturedProviderText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: RichText(
        text: TextSpan(
          text: 'FEATURED ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: ' PROVIDER',
              style: TextStyle(
                color: AppColor.LabelTextColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentlyJoinedProviderText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: RichText(
        text: TextSpan(
          text: 'RECENTLY JOINED',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: ' PROVIDER',
              style: TextStyle(
                color: AppColor.LabelTextColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectYourCountryText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'SELECT YOUR',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: ' COUNTRY',
                style: TextStyle(
                  color: AppColor.LabelTextColor,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProviderListview() {
    return SizedBox(
      height: 125,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: providerdata.length,
        itemBuilder: (context, index) {
          return ProviderListViewItme(
            providerMap: providerdata[index],
          );
        },
      ),
    );
  }

  Widget _buildAppLogo() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://bdgol.com/frontend-assets/assets/img/hero-logo.png',
            height: 56,
          ),
          Text(
            'WE BUILD YOUR TRUST',
            style: TextStyle(
              fontSize: 24,
              color: AppColor.LabelTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountryGridView() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GridView.builder(
        primary: false,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return CountryGridItem(
            countries: countries[index],
          );
        },
      ),
    );
  }

  Widget _buildVideoBannerwithSummary() {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: _buildBannerStyle(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 6,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: AppColor.themeColor,
                progressColors: const ProgressBarColors(
                  playedColor: AppColor.themeColor,
                  handleColor: AppColor.themeColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.summaryBoxColor,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(36),
                          bottomLeft: Radius.circular(18),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$_visitorscount\nVisitors',
                          textAlign: TextAlign.center,
                          style: textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.summaryBoxColor,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(36),
                          bottomLeft: Radius.circular(36),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$_categoriesCount\nCategories',
                          textAlign: TextAlign.center,
                          style: textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.summaryBoxColor,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(34),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$_providersCount\nProviders',
                          textAlign: TextAlign.center,
                          style: textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _buildBannerStyle() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColor.colorForBannerGradiun,
          Colors.white,
        ],
        stops: [0.85, 6.0],
      ),
      boxShadow: [
        BoxShadow(color: Colors.grey.shade400, blurRadius: 2),
      ],
    );
  }
}
