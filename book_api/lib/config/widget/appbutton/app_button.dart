

import 'package:flutter_setup/view.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    required this.onTap,
    this.height = 60,
    this.width = double.infinity,
    this.loading = false,
    super.key});

  final String text;
  final double? height;
  final double? width;
  final loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: loading ? AppColor.grey : AppColor.primaryColor,
          borderRadius: Constant.borderRadius,
          border: Constant.border,
        ),
        child: loading ?
        const Center(child: CircularProgressIndicator()) :
        Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: loading ? AppColor.grey : AppColor.black,
            ),
          ),
        ),
      ),
    );
  }
}
