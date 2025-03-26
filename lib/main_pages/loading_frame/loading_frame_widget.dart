import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_frame_model.dart';
export 'loading_frame_model.dart';

class LoadingFrameWidget extends StatefulWidget {
  const LoadingFrameWidget({super.key});

  static String routeName = 'LoadingFrame';
  static String routePath = '/loadingFrame';

  @override
  State<LoadingFrameWidget> createState() => _LoadingFrameWidgetState();
}

class _LoadingFrameWidgetState extends State<LoadingFrameWidget>
    with TickerProviderStateMixin {
  late LoadingFrameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingFrameModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 600));

      context.pushNamed(HomePageWidget.routeName);
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF161616),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/VanGuard_(Phone_Wallpaper).png',
                  width: 427.53,
                  height: 927.7,
                  fit: BoxFit.cover,
                ),
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
            ],
          ),
        ),
      ),
    );
  }
}
