import 'package:bdgol/data/country_map_data.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../data/recently_join_provider_data.dart';
import '../widgets/home_country_grid_item.dart';
import '../widgets/home_provider_listiew_item.dart';

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
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: RichText(
          text: TextSpan(
            text: 'BDGOL',
            style: TextStyle(
              fontSize: 24,
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(text: '.com'),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp))
        ],
      ),
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
            Center(
              child: Text(
                'Select Your Country',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildCountryGridView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: RichText(
                text: TextSpan(
                  text: 'RESENTLY JOIN',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '  PROVIDER',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildProviderListview(),
            SizedBox(height: 20)
          ],
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
            'We Build Your Trust',
            style: TextStyle(
              fontSize: 24,
              color: Colors.orangeAccent,
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
                progressIndicatorColor: Colors.orangeAccent,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.orangeAccent,
                  handleColor: Colors.orangeAccent,
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
                        color: Color(0xFFFFBC55),
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
                        color: Color(0xFFFFBC55),
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
                        color: Color(0xFFFFBC55),
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
          Color(0xffffdaae),
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
