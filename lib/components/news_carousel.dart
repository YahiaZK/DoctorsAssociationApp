import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:doctors_association_app/models/news_model.dart';
import 'package:doctors_association_app/providers/news_provider.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class NewsCarousel extends ConsumerStatefulWidget {
  const NewsCarousel({super.key});

  @override
  ConsumerState<NewsCarousel> createState() => _NewsCarouselState();
}

class _NewsCarouselState extends ConsumerState<NewsCarousel> {
  int _currentPage = 0;
  Timer? _autoPlayTimer;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    super.dispose();
  }

  void _startAutoPlay(int itemCount) {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (itemCount <= 1) return;

      if (_currentPage >= itemCount - 1) {
        // At last card, animate back to first
        _carouselController.animateToPage(
          0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
        );
      } else {
        _carouselController.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsAsync = ref.watch(newsProvider);

    return newsAsync.when(
      data: (allNews) {
        final news = allNews.take(3).toList();
        if (news.isEmpty) {
          return _buildEmptyState();
        }

        // Start auto play when data is loaded
        if (_autoPlayTimer == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _startAutoPlay(news.length);
          });
        }

        return Column(
          children: [
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: news.length,
              itemBuilder: (context, index, realIndex) {
                return _buildNewsCard(news[index]);
              },
              options: CarouselOptions(
                height: 195,
                viewportFraction: 0.9,
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 12),
            _buildDotIndicator(news.length),
          ],
        );
      },
      loading: () => _buildLoadingState(),
      error: (error, stack) => _buildErrorState(),
    );
  }

  Widget _buildNewsCard(NewsModel news) {
    final languageCode = Localizations.localeOf(context).languageCode;
    return GestureDetector(
      onTap: () => context.go('/news/news-details', extra: news),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background Image
              if (news.imageUrl.isNotEmpty)
                Image.network(
                  news.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, size: 50),
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                )
              else
                Container(color: Colors.grey[300]),

              // Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.8),
                    ],
                  ),
                ),
              ),

              // Title and Brief at bottom
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      news.getTitle(languageCode),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      news.getBrief(languageCode),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDotIndicator(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: _currentPage == index ? AppColors.mainGradient : null,
            color: _currentPage == index ? null : Colors.grey[400],
          ),
        );
      }),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      width: 343,
      height: 195,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: 343,
      height: 195,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.newspaper, size: 60, color: Colors.grey[600]),
          const SizedBox(height: 12),
          Text(
            "No news available",
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Container(
      width: 343,
      height: 195,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 60, color: Colors.grey[600]),
          const SizedBox(height: 12),
          Text(
            "Failed to load news",
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
