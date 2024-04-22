import 'package:cats_app/utils/modules.dart';
import 'package:flutter/material.dart';

class ModuleEntryButton extends StatelessWidget {
  final Module _module;
  final Function(Module) _onTap;

  const ModuleEntryButton({
    super.key,
    required Module module,
    required Function(Module) onTap,
  })  : _module = module,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: _buildListTile(),
      ),
    );
  }

  Widget _buildListTile() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      leading: _buildListTileLeading(),
      title: _buildListTileTitle(),
      subtitle: _buildListTileSubtitle(),
      trailing: _buildListTileTrailing(),
      onTap: () {
        _onTap(_module);
      },
    );
  }

  Widget _buildListTileLeading() {
    return Container(
      padding: const EdgeInsets.only(right: 12.0),
      decoration: const BoxDecoration(border: Border(right: BorderSide(width: 1.0, color: Colors.white24))),
      child: Image(image: AssetImage(_module.relatedImage.value)),
    );
  }

  Widget _buildListTileTitle() {
    return Text(
      _module.description,
      overflow: TextOverflow.clip,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildListTileSubtitle() {
    return Row(
      children: [
        const Icon(Icons.linear_scale, color: Colors.yellowAccent),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            "Open to see ${_module.description.toLowerCase()}",
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: false,
          ),
        ),
      ],
    );
  }

  Widget _buildListTileTrailing() {
    return const Icon(
      Icons.keyboard_arrow_right,
      color: Colors.white,
      size: 30.0,
    );
  }
}
