import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../utils/extensions/colors.dart';

class StateLoading extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const StateLoading({super.key, this.isLoading = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: SNOColors.black,
      opacity: 0.5,
      progressIndicator: LoadingAnimationWidget.staggeredDotsWave(
        color: SNOColors.springGreen,
        size: 80,
      ),
      inAsyncCall: isLoading,
      child: child,
    );
  }
}
