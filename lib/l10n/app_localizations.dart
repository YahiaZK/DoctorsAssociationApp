import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Doctors Association'**
  String get appTitle;

  /// No description provided for @doctors.
  ///
  /// In en, this message translates to:
  /// **'Doctors'**
  String get doctors;

  /// No description provided for @associ.
  ///
  /// In en, this message translates to:
  /// **'Association'**
  String get associ;

  /// No description provided for @member.
  ///
  /// In en, this message translates to:
  /// **'I\'m a Member'**
  String get member;

  /// No description provided for @notMember.
  ///
  /// In en, this message translates to:
  /// **'I\'m Not a Member'**
  String get notMember;

  /// No description provided for @welcomeScreenText.
  ///
  /// In en, this message translates to:
  /// **'Welcome. Please identify yourself below to access your account dashboard or browse our public services.'**
  String get welcomeScreenText;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @loginWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get loginWelcome;

  /// No description provided for @loginWelcomeText.
  ///
  /// In en, this message translates to:
  /// **'Log in to access your account'**
  String get loginWelcomeText;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccount;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @firstNameRequired.
  ///
  /// In en, this message translates to:
  /// **'First name is required'**
  String get firstNameRequired;

  /// No description provided for @lastNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Last name is required'**
  String get lastNameRequired;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordUppercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter'**
  String get passwordUppercase;

  /// No description provided for @passwordLowercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lowercase letter'**
  String get passwordLowercase;

  /// No description provided for @passwordNumber.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number'**
  String get passwordNumber;

  /// No description provided for @pleaseConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get pleaseConfirmPassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @hiWelcome.
  ///
  /// In en, this message translates to:
  /// **'Hi, Welcome'**
  String get hiWelcome;

  /// No description provided for @quickServices.
  ///
  /// In en, this message translates to:
  /// **'Quick Services'**
  String get quickServices;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'see all'**
  String get seeAll;

  /// No description provided for @membershipCertificate.
  ///
  /// In en, this message translates to:
  /// **'Membership Certificate'**
  String get membershipCertificate;

  /// No description provided for @doctorsBadge.
  ///
  /// In en, this message translates to:
  /// **'Doctors Badge'**
  String get doctorsBadge;

  /// No description provided for @doctorsCard.
  ///
  /// In en, this message translates to:
  /// **'Doctors Card'**
  String get doctorsCard;

  /// No description provided for @continuousLearning.
  ///
  /// In en, this message translates to:
  /// **'Continuous Learning'**
  String get continuousLearning;

  /// No description provided for @searchJob.
  ///
  /// In en, this message translates to:
  /// **'Search Job'**
  String get searchJob;

  /// No description provided for @complaints.
  ///
  /// In en, this message translates to:
  /// **'Complaints'**
  String get complaints;

  /// No description provided for @latestNews.
  ///
  /// In en, this message translates to:
  /// **'Latest News'**
  String get latestNews;

  /// No description provided for @noNewsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No news available'**
  String get noNewsAvailable;

  /// No description provided for @errorLoadingNews.
  ///
  /// In en, this message translates to:
  /// **'Error loading news'**
  String get errorLoadingNews;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @associationMember.
  ///
  /// In en, this message translates to:
  /// **'Association Member'**
  String get associationMember;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @accountDetails.
  ///
  /// In en, this message translates to:
  /// **'Account Details'**
  String get accountDetails;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @helpAndSupport.
  ///
  /// In en, this message translates to:
  /// **'Help and Support'**
  String get helpAndSupport;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @giveUsFeedback.
  ///
  /// In en, this message translates to:
  /// **'Give us feedback'**
  String get giveUsFeedback;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @logOutTitle.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOutTitle;

  /// No description provided for @areYouSureLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get areYouSureLogout;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @findYourService.
  ///
  /// In en, this message translates to:
  /// **'Find your service'**
  String get findYourService;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// No description provided for @noServicesFound.
  ///
  /// In en, this message translates to:
  /// **'No services found'**
  String get noServicesFound;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @documentsCategory.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documentsCategory;

  /// No description provided for @learningCategory.
  ///
  /// In en, this message translates to:
  /// **'Learning'**
  String get learningCategory;

  /// No description provided for @supportCategory.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get supportCategory;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @submitComplaints.
  ///
  /// In en, this message translates to:
  /// **'Submit Complaints'**
  String get submitComplaints;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @membershipId.
  ///
  /// In en, this message translates to:
  /// **'Membership ID'**
  String get membershipId;

  /// No description provided for @complaintDetails.
  ///
  /// In en, this message translates to:
  /// **'Complaint Details'**
  String get complaintDetails;

  /// No description provided for @complaintTitle.
  ///
  /// In en, this message translates to:
  /// **'Complaint Title'**
  String get complaintTitle;

  /// No description provided for @enterShortTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter a short title'**
  String get enterShortTitle;

  /// No description provided for @complaintDescription.
  ///
  /// In en, this message translates to:
  /// **'Complaint Description'**
  String get complaintDescription;

  /// No description provided for @pleaseDescribeYourIssue.
  ///
  /// In en, this message translates to:
  /// **'Please describe your issue in detail'**
  String get pleaseDescribeYourIssue;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name is required'**
  String get fullNameRequired;

  /// No description provided for @membershipIdRequired.
  ///
  /// In en, this message translates to:
  /// **'Membership ID is required'**
  String get membershipIdRequired;

  /// No description provided for @membershipIdInvalid.
  ///
  /// In en, this message translates to:
  /// **'Membership ID must be a 6-digit number'**
  String get membershipIdInvalid;

  /// No description provided for @complaintTitleRequired.
  ///
  /// In en, this message translates to:
  /// **'Complaint title is required'**
  String get complaintTitleRequired;

  /// No description provided for @complaintDescriptionRequired.
  ///
  /// In en, this message translates to:
  /// **'Complaint description is required'**
  String get complaintDescriptionRequired;

  /// No description provided for @complaintSubmittedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Complaint submitted successfully'**
  String get complaintSubmittedSuccess;

  /// No description provided for @failedToSubmitComplaint.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit complaint'**
  String get failedToSubmitComplaint;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @searchCourses.
  ///
  /// In en, this message translates to:
  /// **'Search courses...'**
  String get searchCourses;

  /// No description provided for @noCoursesFound.
  ///
  /// In en, this message translates to:
  /// **'No courses found.'**
  String get noCoursesFound;

  /// No description provided for @errorLoadingCourses.
  ///
  /// In en, this message translates to:
  /// **'Error loading courses'**
  String get errorLoadingCourses;

  /// No description provided for @courseDetails.
  ///
  /// In en, this message translates to:
  /// **'Course Details'**
  String get courseDetails;

  /// No description provided for @onlineViaZoom.
  ///
  /// In en, this message translates to:
  /// **'Online via Zoom'**
  String get onlineViaZoom;

  /// No description provided for @aboutTheCourse.
  ///
  /// In en, this message translates to:
  /// **'About the Course'**
  String get aboutTheCourse;

  /// No description provided for @registerFor.
  ///
  /// In en, this message translates to:
  /// **'Register for'**
  String get registerFor;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @searchJobs.
  ///
  /// In en, this message translates to:
  /// **'Search jobs...'**
  String get searchJobs;

  /// No description provided for @noJobsFound.
  ///
  /// In en, this message translates to:
  /// **'No jobs found.'**
  String get noJobsFound;

  /// No description provided for @errorLoadingJobs.
  ///
  /// In en, this message translates to:
  /// **'Error loading jobs'**
  String get errorLoadingJobs;

  /// No description provided for @jobDetails.
  ///
  /// In en, this message translates to:
  /// **'Job Details'**
  String get jobDetails;

  /// No description provided for @jobDescription.
  ///
  /// In en, this message translates to:
  /// **'Job Description'**
  String get jobDescription;

  /// No description provided for @jobRequirements.
  ///
  /// In en, this message translates to:
  /// **'Job Requirements'**
  String get jobRequirements;

  /// No description provided for @applyNow.
  ///
  /// In en, this message translates to:
  /// **'Apply Now'**
  String get applyNow;

  /// No description provided for @perMonth.
  ///
  /// In en, this message translates to:
  /// **'/month'**
  String get perMonth;

  /// No description provided for @requestBadge.
  ///
  /// In en, this message translates to:
  /// **'Request Badge'**
  String get requestBadge;

  /// No description provided for @requestCard.
  ///
  /// In en, this message translates to:
  /// **'Request Card'**
  String get requestCard;

  /// No description provided for @requestCertificate.
  ///
  /// In en, this message translates to:
  /// **'Request Certificate'**
  String get requestCertificate;

  /// No description provided for @badgePreview.
  ///
  /// In en, this message translates to:
  /// **'Badge Preview'**
  String get badgePreview;

  /// No description provided for @cardPreview.
  ///
  /// In en, this message translates to:
  /// **'Card Preview'**
  String get cardPreview;

  /// No description provided for @certificatePreview.
  ///
  /// In en, this message translates to:
  /// **'Certificate Preview'**
  String get certificatePreview;

  /// No description provided for @doctorsBadgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Doctor\'s Badge'**
  String get doctorsBadgeTitle;

  /// No description provided for @doctorsCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Doctor\'s Card'**
  String get doctorsCardTitle;

  /// No description provided for @membershipCertificateTitle.
  ///
  /// In en, this message translates to:
  /// **'Membership Certificate'**
  String get membershipCertificateTitle;

  /// No description provided for @badgeDescription.
  ///
  /// In en, this message translates to:
  /// **'This Doctor\'s Badge confirms your active membership in '**
  String get badgeDescription;

  /// No description provided for @cardDescription.
  ///
  /// In en, this message translates to:
  /// **'This Doctor\'s Card confirms your active membership in '**
  String get cardDescription;

  /// No description provided for @certificateDescription.
  ///
  /// In en, this message translates to:
  /// **'This Membership Certificate confirms your active membership in '**
  String get certificateDescription;

  /// No description provided for @theDoctorsAssociation.
  ///
  /// In en, this message translates to:
  /// **'the Doctors Association.'**
  String get theDoctorsAssociation;

  /// No description provided for @officialPdfFormat.
  ///
  /// In en, this message translates to:
  /// **'Official PDF format'**
  String get officialPdfFormat;

  /// No description provided for @processingTime.
  ///
  /// In en, this message translates to:
  /// **'Processing time: 1-2 business days'**
  String get processingTime;

  /// No description provided for @deliveredToEmail.
  ///
  /// In en, this message translates to:
  /// **'Delivered to email + App downloads page'**
  String get deliveredToEmail;

  /// No description provided for @yourInformation.
  ///
  /// In en, this message translates to:
  /// **'Your Information'**
  String get yourInformation;

  /// No description provided for @doctorName.
  ///
  /// In en, this message translates to:
  /// **'Doctor Name: '**
  String get doctorName;

  /// No description provided for @membershipIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Membership ID: '**
  String get membershipIdLabel;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status: '**
  String get status;

  /// No description provided for @activeMember.
  ///
  /// In en, this message translates to:
  /// **'Active Member'**
  String get activeMember;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @byProceeding.
  ///
  /// In en, this message translates to:
  /// **'By proceeding, you agree to the '**
  String get byProceeding;

  /// No description provided for @termsAndRefundPolicy.
  ///
  /// In en, this message translates to:
  /// **'Terms & Refund Policy.'**
  String get termsAndRefundPolicy;

  /// No description provided for @continueToPayment.
  ///
  /// In en, this message translates to:
  /// **'continue to payment'**
  String get continueToPayment;

  /// No description provided for @rateYourExperience.
  ///
  /// In en, this message translates to:
  /// **'Rate Your Experience'**
  String get rateYourExperience;

  /// No description provided for @yourFeedback.
  ///
  /// In en, this message translates to:
  /// **'Your Feedback'**
  String get yourFeedback;

  /// No description provided for @pleaseSelectRating.
  ///
  /// In en, this message translates to:
  /// **'Please select a rating'**
  String get pleaseSelectRating;

  /// No description provided for @feedbackHint.
  ///
  /// In en, this message translates to:
  /// **'Tell us what you think about the app or how we can improve...'**
  String get feedbackHint;

  /// No description provided for @pleaseEnterYourFeedback.
  ///
  /// In en, this message translates to:
  /// **'Please enter your feedback'**
  String get pleaseEnterYourFeedback;

  /// No description provided for @thankYouForFeedback.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your feedback!'**
  String get thankYouForFeedback;

  /// No description provided for @failedToSubmitFeedback.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit feedback'**
  String get failedToSubmitFeedback;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @allCaughtUp.
  ///
  /// In en, this message translates to:
  /// **'You\'re All Caught Up!'**
  String get allCaughtUp;

  /// No description provided for @stayTuned.
  ///
  /// In en, this message translates to:
  /// **'Stay tuned! Updates and alerts will show up here.'**
  String get stayTuned;

  /// No description provided for @pageUnderDevelopment.
  ///
  /// In en, this message translates to:
  /// **'This page is under development'**
  String get pageUnderDevelopment;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @faqQuestion1.
  ///
  /// In en, this message translates to:
  /// **'How do I become a member of the Doctors Association?'**
  String get faqQuestion1;

  /// No description provided for @faqAnswer1.
  ///
  /// In en, this message translates to:
  /// **'To become a member, you need to hold a valid Doctor degree from an accredited institution, submit your application along with required documents (degree certificate, ID, professional license), and pay the annual membership fee. Applications can be submitted through this app or at our main office.'**
  String get faqAnswer1;

  /// No description provided for @faqQuestion2.
  ///
  /// In en, this message translates to:
  /// **'What are the benefits of DA membership?'**
  String get faqQuestion2;

  /// No description provided for @faqAnswer2.
  ///
  /// In en, this message translates to:
  /// **'Members enjoy access to continuing education courses, professional development workshops, networking events, job opportunities, discounts on equipment and supplies, legal support, and representation in professional matters.'**
  String get faqAnswer2;

  /// No description provided for @faqQuestion3.
  ///
  /// In en, this message translates to:
  /// **'How do I renew my membership?'**
  String get faqQuestion3;

  /// No description provided for @faqAnswer3.
  ///
  /// In en, this message translates to:
  /// **'Membership can be renewed annually through the app by navigating to Account Details and selecting \"Renew Membership\". You can pay online or at any authorized payment center. Renewal reminders are sent 30 days before expiration.'**
  String get faqAnswer3;

  /// No description provided for @faqQuestion4.
  ///
  /// In en, this message translates to:
  /// **'How can I register for continuing education courses?'**
  String get faqQuestion4;

  /// No description provided for @faqAnswer4.
  ///
  /// In en, this message translates to:
  /// **'Browse available courses in the \"Courses\" section of the app. Select your desired course, check the schedule and requirements, then tap \"Register\". Payment can be made online, and you will receive a confirmation email with course details.'**
  String get faqAnswer4;

  /// No description provided for @faqQuestion5.
  ///
  /// In en, this message translates to:
  /// **'Are the certificates recognized internationally?'**
  String get faqQuestion5;

  /// No description provided for @faqAnswer5.
  ///
  /// In en, this message translates to:
  /// **'Yes, certificates issued by DA for continuing education courses are recognized by many international associations and can count towards your CPD (Continuing Professional Development) requirements.'**
  String get faqAnswer5;

  /// No description provided for @faqQuestion6.
  ///
  /// In en, this message translates to:
  /// **'How do I update my contact information?'**
  String get faqQuestion6;

  /// No description provided for @faqAnswer6.
  ///
  /// In en, this message translates to:
  /// **'Go to Profile > Account Details to update your phone number, email, address, and other personal information. Some changes may require verification documents.'**
  String get faqAnswer6;

  /// No description provided for @faqQuestion7.
  ///
  /// In en, this message translates to:
  /// **'What should I do if I forget my password?'**
  String get faqQuestion7;

  /// No description provided for @faqAnswer7.
  ///
  /// In en, this message translates to:
  /// **'On the login screen, tap \"Forgot Password\" and enter your registered email. You will receive a password reset link. If you don\'t receive the email, check your spam folder or contact support.'**
  String get faqAnswer7;

  /// No description provided for @faqQuestion8.
  ///
  /// In en, this message translates to:
  /// **'How can I report a professional misconduct?'**
  String get faqQuestion8;

  /// No description provided for @faqAnswer8.
  ///
  /// In en, this message translates to:
  /// **'Professional misconduct can be reported through the \"Give us feedback\" section or by contacting the Ethics Committee directly. All reports are handled confidentially and investigated thoroughly.'**
  String get faqAnswer8;

  /// No description provided for @faqQuestion9.
  ///
  /// In en, this message translates to:
  /// **'Does DAoffer job placement services?'**
  String get faqQuestion9;

  /// No description provided for @faqAnswer9.
  ///
  /// In en, this message translates to:
  /// **'Yes, the \"Jobs\" section lists current openings at clinics and hospitals. You can filter by location, specialty, and employment type. Members can also post their availability for employers to find.'**
  String get faqAnswer9;

  /// No description provided for @faqQuestion10.
  ///
  /// In en, this message translates to:
  /// **'How do I contact DA support?'**
  String get faqQuestion10;

  /// No description provided for @faqAnswer10.
  ///
  /// In en, this message translates to:
  /// **'You can reach us through:\n• Email: support@da.org\n• Phone: +1-800-123-4567\n• In-app feedback form\n• Visit our office in London\nSupport hours: Monday-Thursday, 8AM-4PM'**
  String get faqAnswer10;

  /// No description provided for @doctorsAssociation.
  ///
  /// In en, this message translates to:
  /// **'Doctors Association'**
  String get doctorsAssociation;

  /// No description provided for @effectiveDate.
  ///
  /// In en, this message translates to:
  /// **'Effective Date: January 1, 2026'**
  String get effectiveDate;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: January 1, 2026'**
  String get lastUpdated;

  /// No description provided for @privacyPolicySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicySubtitle;

  /// No description provided for @termsConditionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions of Use'**
  String get termsConditionsSubtitle;

  /// No description provided for @ppIntroductionTitle.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get ppIntroductionTitle;

  /// No description provided for @ppIntroductionContent.
  ///
  /// In en, this message translates to:
  /// **'The Doctors Association (\"DA\", \"we\", \"us\", or \"our\") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this policy carefully to understand our practices regarding your personal data.'**
  String get ppIntroductionContent;

  /// No description provided for @ppInfoCollectTitle.
  ///
  /// In en, this message translates to:
  /// **'Information We Collect'**
  String get ppInfoCollectTitle;

  /// No description provided for @ppInfoCollectContent.
  ///
  /// In en, this message translates to:
  /// **'We collect information you provide directly, including:\n\n• Personal identification (name, ID number, date of birth)\n• Contact information (email, phone, address)\n• Professional credentials (medical license, degrees, certifications)\n• Employment history and workplace information\n• Profile photo and professional documents\n• Course registrations and educational records\n• Payment information for membership and courses'**
  String get ppInfoCollectContent;

  /// No description provided for @ppHowWeUseTitle.
  ///
  /// In en, this message translates to:
  /// **'How We Use Your Information'**
  String get ppHowWeUseTitle;

  /// No description provided for @ppHowWeUseContent.
  ///
  /// In en, this message translates to:
  /// **'We use collected information to:\n\n• Verify your professional credentials and membership eligibility\n• Process membership applications and renewals\n• Facilitate course registrations and issue certificates\n• Send important notifications about your membership\n• Provide job matching services\n• Improve our services and user experience\n• Comply with legal and regulatory requirements\n• Communicate association news and updates'**
  String get ppHowWeUseContent;

  /// No description provided for @ppInfoSharingTitle.
  ///
  /// In en, this message translates to:
  /// **'Information Sharing'**
  String get ppInfoSharingTitle;

  /// No description provided for @ppInfoSharingContent.
  ///
  /// In en, this message translates to:
  /// **'We may share your information with:\n\n• Authorized DA staff for membership management\n• Course instructors for educational purposes\n• Healthcare regulatory bodies when required by law\n• Third-party service providers (payment processors, email services)\n• Other medical associations for credential verification\n\nWe do not sell your personal information to third parties.'**
  String get ppInfoSharingContent;

  /// No description provided for @ppDataSecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Security'**
  String get ppDataSecurityTitle;

  /// No description provided for @ppDataSecurityContent.
  ///
  /// In en, this message translates to:
  /// **'We implement appropriate technical and organizational measures to protect your personal information, including:\n\n• Encryption of data in transit and at rest\n• Secure access controls and authentication\n• Regular security audits and updates\n• Staff training on data protection\n\nHowever, no method of transmission over the Internet is 100% secure.'**
  String get ppDataSecurityContent;

  /// No description provided for @ppDataRetentionTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Retention'**
  String get ppDataRetentionTitle;

  /// No description provided for @ppDataRetentionContent.
  ///
  /// In en, this message translates to:
  /// **'We retain your personal information for as long as your membership is active and for a period thereafter as required by law or for legitimate business purposes. Educational records and certificates are retained permanently. You may request deletion of your data, subject to legal retention requirements.'**
  String get ppDataRetentionContent;

  /// No description provided for @ppYourRightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Rights'**
  String get ppYourRightsTitle;

  /// No description provided for @ppYourRightsContent.
  ///
  /// In en, this message translates to:
  /// **'You have the right to:\n\n• Access your personal information\n• Correct inaccurate or incomplete data\n• Request deletion of your data (with limitations)\n• Object to certain processing activities\n• Receive a copy of your data in portable format\n• Withdraw consent where processing is based on consent\n\nTo exercise these rights, contact us at privacy@da.org.'**
  String get ppYourRightsContent;

  /// No description provided for @ppCookiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Cookies and Tracking'**
  String get ppCookiesTitle;

  /// No description provided for @ppCookiesContent.
  ///
  /// In en, this message translates to:
  /// **'Our application may use local storage and analytics tools to improve functionality and understand usage patterns. This helps us enhance user experience and troubleshoot issues. You can manage these settings through your device preferences.'**
  String get ppCookiesContent;

  /// No description provided for @ppChildrenTitle.
  ///
  /// In en, this message translates to:
  /// **'Children\'s Privacy'**
  String get ppChildrenTitle;

  /// No description provided for @ppChildrenContent.
  ///
  /// In en, this message translates to:
  /// **'Our application is intended for licensed medical professionals and is not directed at individuals under 18 years of age. We do not knowingly collect personal information from children.'**
  String get ppChildrenContent;

  /// No description provided for @ppChangesTitle.
  ///
  /// In en, this message translates to:
  /// **'Changes to This Policy'**
  String get ppChangesTitle;

  /// No description provided for @ppChangesContent.
  ///
  /// In en, this message translates to:
  /// **'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new policy in the app and updating the \"Effective Date\". You are advised to review this policy periodically.'**
  String get ppChangesContent;

  /// No description provided for @ppContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get ppContactTitle;

  /// No description provided for @ppContactContent.
  ///
  /// In en, this message translates to:
  /// **'If you have questions about this Privacy Policy or our data practices, please contact:\n\nDoctors Association\nData Protection Officer\nEmail: privacy@da.org\nPhone: +1-800-123-4567'**
  String get ppContactContent;

  /// No description provided for @tcAcceptanceTitle.
  ///
  /// In en, this message translates to:
  /// **'1. Acceptance of Terms'**
  String get tcAcceptanceTitle;

  /// No description provided for @tcAcceptanceContent.
  ///
  /// In en, this message translates to:
  /// **'By accessing and using the Doctors Association (DA) mobile application, you agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use this application. The DA reserves the right to modify these terms at any time, and continued use of the app constitutes acceptance of any changes.'**
  String get tcAcceptanceContent;

  /// No description provided for @tcEligibilityTitle.
  ///
  /// In en, this message translates to:
  /// **'2. Membership Eligibility'**
  String get tcEligibilityTitle;

  /// No description provided for @tcEligibilityContent.
  ///
  /// In en, this message translates to:
  /// **'Membership in the DA is open to licensed medical professionals who hold valid credentials from recognized medical institutions. Applicants must provide accurate information during registration and maintain current licensure throughout their membership. False or misleading information may result in membership termination.'**
  String get tcEligibilityContent;

  /// No description provided for @tcAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'3. User Account Responsibilities'**
  String get tcAccountTitle;

  /// No description provided for @tcAccountContent.
  ///
  /// In en, this message translates to:
  /// **'You are responsible for maintaining the confidentiality of your account credentials. You agree to notify the DA immediately of any unauthorized use of your account. The DA is not liable for any loss or damage arising from your failure to protect your account information. Each member is permitted one account only.'**
  String get tcAccountContent;

  /// No description provided for @tcConductTitle.
  ///
  /// In en, this message translates to:
  /// **'4. Professional Conduct'**
  String get tcConductTitle;

  /// No description provided for @tcConductContent.
  ///
  /// In en, this message translates to:
  /// **'Members agree to uphold the highest standards of professional ethics and conduct as outlined by the DA Code of Ethics. This includes maintaining patient confidentiality, providing quality care, engaging in honest business practices, and respecting fellow professionals. Violations may result in disciplinary action.'**
  String get tcConductContent;

  /// No description provided for @tcEducationTitle.
  ///
  /// In en, this message translates to:
  /// **'5. Continuing Education'**
  String get tcEducationTitle;

  /// No description provided for @tcEducationContent.
  ///
  /// In en, this message translates to:
  /// **'Members are required to complete a minimum number of continuing education credits annually to maintain active membership status. The DA provides various educational opportunities, and members may also submit external courses for credit approval. Failure to meet CE requirements may affect membership status.'**
  String get tcEducationContent;

  /// No description provided for @tcFeesTitle.
  ///
  /// In en, this message translates to:
  /// **'6. Fees and Payments'**
  String get tcFeesTitle;

  /// No description provided for @tcFeesContent.
  ///
  /// In en, this message translates to:
  /// **'Membership fees are due annually and must be paid to maintain active status. Course registration fees are non-refundable unless the course is cancelled by the DA. The DA reserves the right to adjust fees with appropriate notice to members. Payment methods accepted include credit cards and bank transfers.'**
  String get tcFeesContent;

  /// No description provided for @tcIpTitle.
  ///
  /// In en, this message translates to:
  /// **'7. Intellectual Property'**
  String get tcIpTitle;

  /// No description provided for @tcIpContent.
  ///
  /// In en, this message translates to:
  /// **'All content within the DA application, including but not limited to text, graphics, logos, and course materials, is the property of the DA or its content suppliers. Members may not reproduce, distribute, or create derivative works without explicit written permission from the DA.'**
  String get tcIpContent;

  /// No description provided for @tcLiabilityTitle.
  ///
  /// In en, this message translates to:
  /// **'8. Limitation of Liability'**
  String get tcLiabilityTitle;

  /// No description provided for @tcLiabilityContent.
  ///
  /// In en, this message translates to:
  /// **'The DA provides this application \"as is\" without warranties of any kind. The DA shall not be liable for any indirect, incidental, or consequential damages arising from the use of this application. The DA does not guarantee continuous, uninterrupted access to the application.'**
  String get tcLiabilityContent;

  /// No description provided for @tcTerminationTitle.
  ///
  /// In en, this message translates to:
  /// **'9. Termination'**
  String get tcTerminationTitle;

  /// No description provided for @tcTerminationContent.
  ///
  /// In en, this message translates to:
  /// **'The DA may suspend or terminate your account for violations of these terms, non-payment of fees, professional misconduct, or other reasons deemed appropriate. Upon termination, your right to use the application ceases immediately. You may appeal termination decisions through the established grievance process.'**
  String get tcTerminationContent;

  /// No description provided for @tcContactTitle.
  ///
  /// In en, this message translates to:
  /// **'10. Contact Information'**
  String get tcContactTitle;

  /// No description provided for @tcContactContent.
  ///
  /// In en, this message translates to:
  /// **'For questions regarding these Terms and Conditions, please contact:\n\nDoctors Association\nEmail: legal@da.org\nPhone: +1-800-123-4567'**
  String get tcContactContent;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
