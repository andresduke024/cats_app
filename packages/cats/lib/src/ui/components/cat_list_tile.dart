import 'package:commons/commons.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';

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
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      leading: _buildListTileLeading(),
      title: _buildListTileTitle(),
      subtitle: _buildListTileSubtitle(context),
      trailing: _buildListTileTrailing(context),
      onTap: () {
        _onTap(_data);
      },
    );
  }

  Widget _buildListTileLeading() {
    return Container(
      padding: const EdgeInsets.only(right: 12.0),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(width: 1.0, color: Colors.white24),
        ),
      ),
      child: CatImage(
        cat: _data,
      ),
    );
  }

  Widget _buildListTileTitle() {
    return Text(
      _data.breedName,
      overflow: TextOverflow.clip,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildListTileSubtitle(BuildContext context) {
    return Row(
      children: [
        CatOriginText(origin: _data.origin),
      ],
    );
  }

  Widget _buildListTileTrailing(BuildContext context) {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Theme.of(context).primaryColor,
      size: 30.0,
    );
  }
}
