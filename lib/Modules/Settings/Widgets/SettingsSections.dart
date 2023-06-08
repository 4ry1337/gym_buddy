import 'package:flutter/material.dart';

import '../../../Shared/index.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({Key? key, this.title, required this.actions}) : super(key: key);

  final String? title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if(title != null) Container(
          padding: AppPadding.p24h + AppPadding.p8v,
          child: Text(title!, style: AppTypography.body),
        ),
        Container(
          color: Theme.of(context).colorScheme.surface,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
              itemBuilder: (context, index) => actions[index],
              separatorBuilder: (context, index) => const Divider(),
              itemCount: actions.length
          ),
        ),
      ],
    );
  }
}
