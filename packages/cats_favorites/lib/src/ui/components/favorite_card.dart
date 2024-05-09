import 'package:cats_favorites/src/bloc/cats_favorites/cats_favorites_bloc.dart';
import 'package:cats_favorites/src/bloc/cats_favorites/cats_favorites_events.dart';
import 'package:cats_favorites/src/ui/components/base_favorite_card.dart';
import 'package:cats_favorites/src/ui/components/favorite_card_button.dart';
import 'package:commons/commons.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class FavoriteCard extends StatelessWidget {
  final Cat data;

  const FavoriteCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final event = NavigateToDetails(data: data);
        context.read<CatsFavoritesBloc>().add(event);
      },
      child: BaseFavoriteCard(
        children: [
          _buildImage(data),
          _buildDescription(context, data),
          const SizedBox(height: 10),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildImage(Cat data) {
    return SizedBox(
      width: 80,
      child: CatImage(cat: data),
    );
  }

  Widget _buildDescription(BuildContext context, Cat data) {
    return Column(
      children: [
        EllipsisText(
          text: data.breedName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        EllipsisText(
          text: data.origin,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FavoriteCardButton(
          icon: Icons.delete,
          onTap: () {
            final event = DeleteFavoriteCat(data: data);
            context.read<CatsFavoritesBloc>().add(event);
          },
        ),
        FavoriteCardButton(
          icon: Icons.rocket_launch_sharp,
          onTap: () {
            final event = AdoptFavoriteCat(data: data);
            context.read<CatsFavoritesBloc>().add(event);
          },
        ),
      ],
    );
  }
}
