import 'package:flutter/material.dart';

import '../styles/styles.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SizedBox.square(
          dimension: 40,
          child: CircularProgressIndicator(
            //backgroundColor: Color(0xFFE3E6ED),
            strokeCap: StrokeCap.round,
            color: AppColors.primaryBlack,
            strokeWidth: 5.0,
          ),
        ),
      ),
    );
  }
}
