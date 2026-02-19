import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/components/service_card.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/models/service_model.dart';
import 'package:doctors_association_app/providers/services_provider.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class ServicesScreen extends ConsumerStatefulWidget {
  const ServicesScreen({super.key});

  @override
  ConsumerState<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends ConsumerState<ServicesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryFilteredServices = ref.watch(
      categoryFilteredServicesProvider,
    );
    final searchQuery = ref.watch(serviceSearchQueryProvider).toLowerCase();

    // Apply search filter with localized titles
    final filteredServices = categoryFilteredServices.where((service) {
      return searchQuery.isEmpty ||
          service
              .getLocalizedTitle(context)
              .toLowerCase()
              .contains(searchQuery);
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: CustomAppBar(
          title: Text(
            AppLocalizations.of(context)!.services,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpaceContent: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                AppLocalizations.of(context)!.findYourService,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      ref
                          .read(serviceSearchQueryProvider.notifier)
                          .updateQuery(value);
                    },
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.search,
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      suffixIcon: searchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                _searchController.clear();
                                ref
                                    .read(serviceSearchQueryProvider.notifier)
                                    .clear();
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Category filter chips
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: ServiceCategory.values.length,
                separatorBuilder: (context, index) => SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = ServiceCategory.values[index];
                  final selectedCategory = ref.watch(serviceCategoryProvider);
                  final isSelected = category == selectedCategory;
                  return FilterChip(
                    label: Text(category.getLocalizedLabel(context)),
                    selected: isSelected,
                    onSelected: (selected) {
                      ref
                          .read(serviceCategoryProvider.notifier)
                          .setCategory(category);
                    },
                    selectedColor: AppColors.dentalTealDark.withAlpha(20),
                    checkmarkColor: AppColors.dentalTealDark,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? AppColors.dentalTealDark
                          : Colors.grey[700],
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? AppColors.dentalTealDark
                            : Colors.transparent,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Services grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: filteredServices.isEmpty
                  ? Center(
                      child: Text(
                        AppLocalizations.of(context)!.noServicesFound,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: filteredServices
                          .map(
                            (service) => ServiceCard(
                              iconPath: service.iconPath,
                              title: service.getLocalizedTitle(context),
                              onPressed: () => context.push(service.route),
                            ),
                          )
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
