import 'package:flutter/material.dart';

import '../../models/cat.dart';

class CatListTile extends StatelessWidget {
  final Cat _data;
  final Function(Cat) _onTap;

  const CatListTile({
    super.key,
    required Cat data,
    required Function(Cat) onTap,
  })  : _data = data,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _onTap(_data);
      },
      leading: Text(
        _data.breedName,
      ),
    );
  }
}
