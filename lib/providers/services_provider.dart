import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doctors_association_app/models/service_model.dart';

// All services provider
final allServicesProvider = Provider<List<ServiceModel>>(
  (ref) => [
    ServiceModel(
      iconPath: 'assets/icons/continuous_learning.svg',
      titleKey: 'continuousLearning',
      route: '/services/continuous-learning',
      category: ServiceCategory.learning,
    ),
    ServiceModel(
      iconPath: 'assets/icons/badge.svg',
      titleKey: 'doctorsBadge',
      route: '/services/doctors-badge',
      category: ServiceCategory.documents,
    ),
    ServiceModel(
      iconPath: 'assets/icons/card.svg',
      titleKey: 'doctorsCard',
      route: '/services/doctors-card',
      category: ServiceCategory.documents,
    ),
    ServiceModel(
      iconPath: 'assets/icons/membership_certificate.svg',
      titleKey: 'membershipCertificate',
      route: '/services/membership-certificate',
      category: ServiceCategory.documents,
    ),
    ServiceModel(
      iconPath: 'assets/icons/job.svg',
      titleKey: 'searchJob',
      route: '/services/search-job',
      category: ServiceCategory.support,
    ),
    ServiceModel(
      iconPath: 'assets/icons/complaint.svg',
      titleKey: 'complaints',
      route: '/services/complaints',
      category: ServiceCategory.support,
    ),
  ],
);

// Category filter notifier
class ServiceCategoryNotifier extends Notifier<ServiceCategory> {
  @override
  ServiceCategory build() => ServiceCategory.all;

  void setCategory(ServiceCategory category) {
    state = category;
  }
}

// Category filter provider
final serviceCategoryProvider =
    NotifierProvider<ServiceCategoryNotifier, ServiceCategory>(
      ServiceCategoryNotifier.new,
    );

// Search query notifier
class ServiceSearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateQuery(String query) {
    state = query;
  }

  void clear() {
    state = '';
  }
}

// Search query provider
final serviceSearchQueryProvider =
    NotifierProvider<ServiceSearchQueryNotifier, String>(
      ServiceSearchQueryNotifier.new,
    );

// Category filtered services provider (without search - search needs context for localization)
final categoryFilteredServicesProvider = Provider<List<ServiceModel>>((ref) {
  final category = ref.watch(serviceCategoryProvider);
  final allServices = ref.watch(allServicesProvider);

  return allServices.where((service) {
    return category == ServiceCategory.all || service.category == category;
  }).toList();
});
