import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:doctors_association_app/components/scaffold_with_bottom_nav_bar.dart';
import 'package:doctors_association_app/models/course_model.dart';
import 'package:doctors_association_app/models/job_model.dart';
import 'package:doctors_association_app/providers/auth_provider.dart';
import 'package:doctors_association_app/screens/auth/member/forget_password_screen.dart';
import 'package:doctors_association_app/screens/auth/guest/guest_login_screen.dart';
import 'package:doctors_association_app/screens/home_screen.dart';
import 'package:doctors_association_app/screens/auth/member/member_login_screen.dart';
import 'package:doctors_association_app/screens/auth/member/member_signup_screen.dart';
import 'package:doctors_association_app/screens/news_screen.dart';
import 'package:doctors_association_app/screens/news_details_screen.dart';
import 'package:doctors_association_app/screens/settings_screens/account_details_screen.dart';
import 'package:doctors_association_app/screens/settings_screens/change_password_screen.dart';
import 'package:doctors_association_app/screens/settings_screens/documents_screen.dart';
import 'package:doctors_association_app/screens/settings_screens/faq_screen.dart';
import 'package:doctors_association_app/screens/settings_screens/feedback_screen.dart';
import 'package:doctors_association_app/screens/settings_screens/language_screen.dart';
import 'package:doctors_association_app/screens/settings_screens/notification_screen.dart';
import 'package:doctors_association_app/models/news_model.dart';
import 'package:doctors_association_app/screens/profile_screen.dart';
import 'package:doctors_association_app/screens/services_screen.dart';
import 'package:doctors_association_app/screens/auth/welcome_screen.dart';
import 'package:doctors_association_app/screens/services_screens/complaints_screen.dart';
import 'package:doctors_association_app/screens/services_screens/continuous_learning_screen.dart';
import 'package:doctors_association_app/screens/services_screens/course_details_screen.dart';
import 'package:doctors_association_app/screens/services_screens/doctors_badge_screen.dart';
import 'package:doctors_association_app/screens/services_screens/doctors_card_screen.dart';
import 'package:doctors_association_app/screens/services_screens/job_details_screen.dart';
import 'package:doctors_association_app/screens/services_screens/membership_certificate_screen.dart';
import 'package:doctors_association_app/screens/services_screens/search_job_screen.dart';
import 'package:doctors_association_app/screens/settings_screens/privacy_policy_screen.dart';
import 'package:doctors_association_app/screens/settings_screens/terms_conditions_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateStreamProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: authState.when(
      data: (_) => null,
      error: (_, _) => null,
      loading: () => null,
    ),
    redirect: (context, state) {
      final user = authState.value;
      final isLoggedIn = user != null;
      final goingTo = state.matchedLocation;

      // Routes accessible by everyone (even when logged in)
      final isPublicRoute = goingTo == '/guest-login';

      // Auth-specific routes (login/signup/welcome)
      final isAuthRoute =
          goingTo == '/' ||
          goingTo == '/member-login' ||
          goingTo == '/member-signup' ||
          goingTo == '/forget-password';

      // SCENARIO: User is NOT logged in
      if (!isLoggedIn) {
        // Allow public and auth pages
        if (isPublicRoute || isAuthRoute) return null;

        // Redirect to welcome for protected routes
        return '/';
      }

      // SCENARIO: User IS logged in
      // Redirect away from auth routes to home
      if (isAuthRoute) return '/home';

      return null;
    },
    routes: [
      // Auth routes (outside the shell)
      GoRoute(path: '/', builder: (context, state) => const WelcomeScreen()),
      GoRoute(
        path: '/member-login',
        builder: (context, state) => MemberLoginScreen(),
      ),
      GoRoute(
        path: '/member-signup',
        builder: (context, state) => MemberSignupScreen(),
      ),
      GoRoute(
        path: '/guest-login',
        builder: (context, state) => const GuestLoginScreen(),
      ),
      GoRoute(
        path: '/forget-password',
        builder: (context, state) => const ForgetPasswordScreen(),
      ),

      // Main app routes with bottom navigation bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithBottomNavBar(navigationShell: navigationShell);
        },
        branches: [
          // Home branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
                routes: [],
              ),
            ],
          ),
          // Services branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/services',
                builder: (context, state) => const ServicesScreen(),
                routes: [
                  GoRoute(
                    path: 'continuous-learning',
                    builder: (context, state) =>
                        const ContinuousLearningScreen(),
                    routes: [
                      GoRoute(
                        path: 'course-details',
                        builder: (context, state) {
                          final course = state.extra as CourseModel;
                          return CourseDetailsScreen(course: course);
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'doctors-badge',
                    builder: (context, state) => const DoctorsBadgeScreen(),
                  ),
                  GoRoute(
                    path: 'doctors-card',
                    builder: (context, state) => const DoctorsCardScreen(),
                  ),
                  GoRoute(
                    path: 'membership-certificate',
                    builder: (context, state) =>
                        const MembershipCertificateScreen(),
                  ),
                  GoRoute(
                    path: 'search-job',
                    builder: (context, state) => const SearchJobScreen(),
                    routes: [
                      GoRoute(
                        path: 'job-details',
                        builder: (context, state) {
                          final job = state.extra as JobModel;
                          return JobDetailsScreen(job: job);
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'complaints',
                    builder: (context, state) => const ComplaintsScreen(),
                  ),
                ],
              ),
            ],
          ),
          // News branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/news',
                builder: (context, state) => const NewsScreen(),
                routes: [
                  GoRoute(
                    path: 'news-details',
                    builder: (context, state) {
                      final news = state.extra as NewsModel;
                      return NewsDetailsScreen(news: news);
                    },
                  ),
                ],
              ),
            ],
          ),
          // Profile branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    path: '/account-details',
                    builder: (context, state) => const AccountDetailsScreen(),
                  ),
                  GoRoute(
                    path: '/documents',
                    builder: (context, state) => const DocumentsScreen(),
                  ),
                  GoRoute(
                    path: '/change-password',
                    builder: (context, state) => const ChangePasswordScreen(),
                  ),
                  GoRoute(
                    path: '/notifications',
                    builder: (context, state) => const NotificationScreen(),
                  ),
                  GoRoute(
                    path: '/language',
                    builder: (context, state) => const LanguageScreen(),
                  ),
                  GoRoute(
                    path: '/faq',
                    builder: (context, state) => const FaqScreen(),
                  ),
                  GoRoute(
                    path: '/feedback',
                    builder: (context, state) => const FeedbackScreen(),
                  ),
                  GoRoute(
                    path: '/terms-conditions',
                    builder: (context, state) => const TermsConditionsScreen(),
                  ),
                  GoRoute(
                    path: '/privacy-policy',
                    builder: (context, state) => const PrivacyPolicyScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
