import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doctors_association_app/components/news_card.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/providers/news_provider.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  Future<void> _refreshNews(WidgetRef ref) async {
    ref.invalidate(newsProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(newsProvider);

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.latestNews),
        elevation: 0,
        scrolledUnderElevation: 1,
        surfaceTintColor: AppColors.dentalTealDark,
      ),
      body: newsAsync.when(
        data: (newsList) {
          if (newsList.isEmpty) {
            return RefreshIndicator(
              onRefresh: () => _refreshNews(ref),
              child: Stack(
                children: [
                  ListView(),
                  Center(
                    child: Text(AppLocalizations.of(context)!.noNewsAvailable),
                  ),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _refreshNews(ref),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return NewsCard(news: news);
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => RefreshIndicator(
          onRefresh: () => _refreshNews(ref),
          child: Stack(
            children: [
              ListView(),
              Center(
                child: Text(
                  '${AppLocalizations.of(context)!.errorLoadingNews}: $error',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
