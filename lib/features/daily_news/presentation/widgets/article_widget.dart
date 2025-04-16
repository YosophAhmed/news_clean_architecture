import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_clean_architecture/features/daily_news/domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, this.article});

  final ArticleEntity? article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 14),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(children: [_buildImage(context), _buildTitleAndDescription()]),
    );
  }

  Widget _buildImage(BuildContext context) => CachedNetworkImage(
    imageUrl: article!.urlToImage ?? '',
    imageBuilder:
        (context, imageProvider) => Padding(
          padding: EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(8),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
    errorWidget: (context, url, error) => _fallbackImage(context),
    placeholder:  (context, url) => Center(child: CircularProgressIndicator()),
  );

  Widget _fallbackImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width / 3,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            image: const DecorationImage(
              image: AssetImage('assets/images/Placeholder_view_vector.svg.png'), // your local asset image
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() => Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article!.title ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(article!.description ?? '', maxLines: 2),
            ),
          ),
          Row(
            children: [
              Icon(Icons.timeline_outlined, size: 16),
              SizedBox(width: 4),
              Text(article!.publishedAt ?? '', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    ),
  );
}
