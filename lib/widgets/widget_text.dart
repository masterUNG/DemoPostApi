// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:getwidget/components/typography/gf_typography.dart';
import 'package:getwidget/types/gf_typography_type.dart';

class WidgetText extends StatelessWidget {
  const WidgetText({
    Key? key,
    required this.text,
    this.gfTypographyType,
  }) : super(key: key);

  final String text;
  final GFTypographyType? gfTypographyType;

  @override
  Widget build(BuildContext context) {
    return GFTypography(
      showDivider: false,
      text: text,
      type: gfTypographyType ?? GFTypographyType.typo5,
    );
  }
}
