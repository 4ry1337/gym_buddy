import 'package:flutter/material.dart';

import '../../../Shared/index.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({Key? key, this.title, required this.actions}) : super(key: key);

  final String? title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppPadding.p0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if(title != null) Column(
            children: [
              Container(
                padding: AppPadding.p12,
                alignment: Alignment.center,
                child: Text(title!, style: AppTypography.body),
              ),
              const Divider(),
            ],
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
              itemBuilder: (context, index) => actions[index],
              separatorBuilder: (context, index) => const Divider(),
              itemCount: actions.length
          ),
          const SizedBox(height: AppSpacing.s8),
        ],
      ),
    );
  }
}
