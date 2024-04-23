import 'package:cats/src/bloc/cat_details/cat_details_bloc.dart';
import 'package:cats/src/bloc/cat_details/cat_details_state.dart';
import 'package:cats/src/models/cat.dart';
import 'package:cats/src/ui/components/cat_image.dart';
import 'package:cats/src/ui/components/cat_origin_text.dart';
import 'package:cats/src/ui/components/cats_scaffold.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatDetailsScreen extends StatelessWidget {
  final Cat cat;

  const CatDetailsScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatDetailsBloc(cat: cat),
      child: CatsScaffold(
        body: SafeArea(
          child: BlocBuilder<CatDetailsBloc, CatDetailsState>(
            builder: _builder,
          ),
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, CatDetailsState state) {
    switch (state) {
      case CatDetailsStarted(cat: final cat):
        return _buildDetails(data: cat);
      case CatLoadedState(details: final data):
        return _buildDetails(data: data.details, imageUrl: data.imageUrl);
    }
  }

  Widget _buildDetails({required Cat data, String? imageUrl}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildImageRow(data, imageUrl),
          const SizedBox(height: 20),
          _buildHeader(cat),
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

  Widget _buildHeader(Cat cat) {
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
        _buildFavoritesButton(),
      ],
    );
  }

  Widget _buildTitle(Cat cat) {
    return Text(
      cat.breedName,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _buildFavoritesButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.thumb_up_alt_outlined,
        color: Colors.grey,
        size: 30,
      ),
    );
  }

  Widget _buildDescription(Cat cat) {
    return Text(
      cat.description,
      style: TextStyle(fontWeight: FontWeight.w300),
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
