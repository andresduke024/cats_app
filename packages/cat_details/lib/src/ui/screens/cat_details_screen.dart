import 'package:cat_details/src/bloc/router/cat_details_router_bloc.dart';

import '../../bloc/cat_details/cat_details_bloc.dart';
import '../../bloc/cat_details/cat_details_event.dart';
import '../../bloc/cat_details/cat_details_state.dart';
import '../../models/cat_detail.dart';

import 'package:commons/commons.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants.dart';

class CatDetailsScreen extends StatelessWidget {
  final Cat cat;

  const CatDetailsScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatDetailsBloc(cat: cat),
      child: GenericScaffold<CatDetailsRouterBloc>(
        origin: NavigationPoint.root,
        title: Constants.navigationHeaderName,
        body: BlocBuilder<CatDetailsBloc, CatDetailsState>(
          builder: _builder,
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, CatDetailsState state) {
    switch (state) {
      case CatDetailsStarted(details: final data):
        return _buildDetails(context, data);
      case CatLoadedState(details: final data):
        return _buildDetails(context, data);
      case CatDetailsState():
        return const SizedBox();
    }
  }

  Widget _buildDetails(BuildContext context, CatDetail data) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageRow(data.details, data.imageUrl),
          const SizedBox(height: 20),
          _buildHeader(context, data),
          const SizedBox(height: 20),
          _buildDescription(cat),
          const SizedBox(height: 20),
          _buildRatings(cat),
        ],
      ),
    );
  }

  Widget _buildImageRow(Cat data, String? imageUrl) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImage(data, imageUrl),
        ],
      ),
    );
  }

  Widget _buildImage(Cat data, String? imageUrl) {
    final url = imageUrl ?? "";

    if (url.isEmpty) {
      return CatImage(cat: cat);
    }

    const double size = 190;

    return CircleAvatar(
      radius: 150,
      backgroundColor: Colors.deepPurple,
      child: ClipOval(
        child: Image.network(
          url,
          fit: BoxFit.cover,
          width: size,
          height: size,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, CatDetail data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(cat),
            CatOriginText(origin: cat.origin),
          ],
        ),
        _buildFavoritesButton(context, data),
      ],
    );
  }

  Widget _buildTitle(Cat cat) {
    return Text(
      cat.breedName,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _buildFavoritesButton(BuildContext context, CatDetail data) {
    final color = data.isFavorite ? Colors.deepPurple : Colors.grey;
    final icon = data.isFavorite ? Icons.auto_awesome_rounded : Icons.auto_awesome_outlined;

    return IconButton(
      onPressed: () {
        context.read<CatDetailsBloc>().add(ToggleFavoritesEvent(data: data));
      },
      icon: Icon(
        icon,
        color: color,
        size: 35,
      ),
    );
  }

  Widget _buildDescription(Cat cat) {
    return Text(
      cat.description,
      textAlign: TextAlign.start,
      style: const TextStyle(fontWeight: FontWeight.w300),
    );
  }

  Widget _buildRatings(Cat cat) {
    final ratingImage = CatImage(cat: cat);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingBar(
          ratingImage: ratingImage,
          rating: cat.intelligence,
          text: "Intelligence",
        ),
        RatingBar(
          ratingImage: ratingImage,
          rating: cat.affectionLevel,
          text: "Affection level",
        ),
      ],
    );
  }
}
