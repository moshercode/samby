import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class ImageDetailView extends StatelessWidget {

  // Variables

  final String imageUrl;

  // Constructor

  const ImageDetailView({required this.imageUrl, super.key});

  // Build

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: InteractiveViewer(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            errorWidget: (_, __, ___) => const Icon(
              Icons.broken_image_rounded,
              color: Colors.white54,
              size: 64,
            ),
          ),
        ),
      ),
    );
  }
}
