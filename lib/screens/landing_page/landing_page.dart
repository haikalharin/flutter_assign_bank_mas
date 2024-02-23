import 'package:flutter/material.dart';
import 'package:flutter_assigment_bank_mas/core/network/network_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/dialog/retry_dialog.dart';
import '../../core/router/routes.dart';
import '../../core/widget/spinkit_indicator.dart';
import '../../di.dart';
import 'bloc/landing_page_bloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<_LandingPageState> myWidgetKey = GlobalKey();

  Future<void> _openURL(Uri url) async {
    await canLaunchUrl(url)
        ? await launchUrl(url)
        : throw 'Could not launch $url';
  }

  @override
  void initState() {
    getIt<LandingPageBloc>().add(FetchDataEvent());
    super.initState();
  }

  Future<void> _handleRefresh() async {
    getIt<LandingPageBloc>().add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Flutter Assignment'),
      ),
      body: BlocListener<LandingPageBloc, LandingPageState>(
        listener: (context, state) {
          if (state.submitStatus.isFailure) {
            showDialog(
                context: context,
                builder: (BuildContext context) =>
                    RetryDialog(
                      title: state.failureMessage ?? '',
                      onClosePressed: () {
                        return Navigator.pop(context);
                      },
                    ));
          }
        },
        child: BlocBuilder<LandingPageBloc, LandingPageState>(
          builder: (context, state) {
            return LiquidPullToRefresh(
              onRefresh: _handleRefresh,
              child: ListView(
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Container(
                      height: 200.h,
                      margin: EdgeInsets.all(8.0),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: state.gridView?.items?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (await NetworkInfoImpl().isConnected) {
                                    Navigator.pushNamed(
                                        myWidgetKey.currentContext ?? context,
                                        Routes.webViewPage,
                                        arguments: {
                                          'url': state.gridView?.items?[index]
                                              .link ??
                                              '-',
                                          'title': state.gridView?.items?[index]
                                              .productName ??
                                              '-'
                                        });
                                  } else {
                                    showDialog(
                                        context: myWidgetKey.currentContext ??
                                            context,
                                        builder: (BuildContext context) =>
                                            RetryDialog(
                                              title: 'No Connection',
                                              onClosePressed: () {
                                                return Navigator.pop(context);
                                              },
                                            ));
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8.0),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      state.gridView != null
                                          ? Image.network(
                                        state.gridView?.items?[index]
                                            .productImage ??
                                            'https://via.placeholder.com/150',
                                        height: 50.h,
                                        fit: BoxFit.cover,
                                      )
                                          : Image.asset(
                                        'assets/Image_not_available.png',
                                        height: 50.h,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        state.gridView?.items?[index]
                                            .productName ??
                                            '-',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              BlocBuilder<LandingPageBloc, LandingPageState>(
                                builder: (context, state) {
                                  return state.submitStatus.isInProgress
                                      ? Container(
                                    color: Colors.white,
                                    child: const SpinKitIndicator(
                                        type: SpinKitType.circle),
                                  )
                                      : Container();
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Text(
                      'Our Blog',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 200,
                    margin: EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ListView.builder(
                          itemCount: state.listView?.items?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () async {
                                if (await NetworkInfoImpl().isConnected) {
                                  Navigator.pushNamed(
                                      myWidgetKey.currentContext ?? context,
                                      Routes.webViewPage,
                                      arguments: {
                                        'url': state
                                            .listView?.items?[index].link ??
                                            '-',
                                        'title': state.listView?.items?[index]
                                            .articleTitle ??
                                            '-'
                                      });
                                } else {
                                  showDialog(
                                      context:
                                      myWidgetKey.currentContext ?? context,
                                      builder: (BuildContext context) =>
                                          RetryDialog(
                                            title: 'No Connection',
                                            onClosePressed: () {
                                              return Navigator.pop(context);
                                            },
                                          ));
                                }
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery
                                          .sizeOf(context)
                                          .width,
                                      height: 150.h,
                                      decoration: BoxDecoration(
                                        image: state.listView != null &&
                                            state.listView?.items?[index]
                                                .articleImage != null
                                            ? DecorationImage(
                                          image: NetworkImage(state
                                              .listView
                                              ?.items?[index]
                                              .articleImage ??
                                              'https://via.placeholder.com/150'),
                                          fit: BoxFit.cover,
                                        ): const DecorationImage(
                                          image: AssetImage(
                                              'assets/Image_not_available.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Text(
                                        state.listView?.items?[index]
                                            .articleTitle ??
                                            '-',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        BlocBuilder<LandingPageBloc, LandingPageState>(
                          builder: (context, state) {
                            return state.submitStatus.isInProgress
                                ? Container(
                              color: Colors.white,
                              child: const SpinKitIndicator(
                                  type: SpinKitType.circle),
                            )
                                : Container();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
