# Doctors Association App

A demo mobile application built with Flutter for the Doctors Association (DA). The app provides members with access to association services, news, job opportunities, and professional development resources.

## Features

- **Authentication** - Member login and guest access modes
- **News & Announcements** - Stay updated with the latest association news
- **Services Portal** - Access to various association services:
  - Job Search - Browse and apply for job opportunities
  - Continuous Learning - Professional development courses
  - Doctors Badge & Card - Request official credentials
  - Membership Certificate - Obtain membership documentation
  - Complaints System - Submit and track complaints
  - Feedback Submission - Provide feedback to the association
- **User Profile** - Manage personal information and settings
- **Multi-language Support** - Arabic and English localization

## Tech Stack

- **Framework:** Flutter (SDK ^3.10.7)
- **State Management:** Riverpod
- **Navigation:** GoRouter
- **Backend:** Firebase (Authentication, Cloud Firestore)
- **Localization:** Flutter Intl

## Dependencies

| Package              | Version  | Description                    |
| -------------------- | -------- | ------------------------------ |
| `flutter_riverpod`   | ^3.2.0   | State management solution      |
| `go_router`          | ^17.0.1  | Declarative routing            |
| `firebase_core`      | ^4.4.0   | Firebase core functionality    |
| `firebase_auth`      | ^6.1.4   | User authentication            |
| `cloud_firestore`    | ^6.1.2   | Cloud database                 |
| `flutter_svg`        | ^2.2.3   | SVG rendering support          |
| `carousel_slider`    | ^5.1.1   | Image carousel widget          |
| `file_picker`        | ^10.3.10 | File selection                 |
| `dotted_border`      | ^3.1.0   | Decorative borders             |
| `shared_preferences` | ^2.3.5   | Local storage                  |
| `cupertino_icons`    | ^1.0.8   | iOS-style icons                |
| `intl`               | any      | Internationalization utilities |

## Project Structure

```
lib/
├── main.dart              # App entry point
├── firebase_options.dart  # Firebase configuration
├── components/            # Reusable UI components
├── l10n/                  # Localization files (AR/EN)
├── models/                # Data models
├── providers/             # Riverpod providers
├── router/                # Navigation configuration
├── screens/               # App screens
│   ├── auth/              # Authentication screens
│   ├── services_screens/  # Service-related screens
│   └── settings_screens/  # Settings screens
├── services/              # Business logic & API services
└── theme/                 # App theming
```

## Localization

The app supports Arabic and English. Localization files are located in `lib/l10n/`:

- `app_en.arb` - English translations
- `app_ar.arb` - Arabic translations

## 📸 Preview

Some screenshots from the app.

<table align="center" border="0" cellspacing="0">
  <tr>
    <td align="center" width="33%">
      <img src="screenshots\Screenshot_1.png" alt="Screenshot 1" width="60%"/>
    </td>
    <td align="center" width="33%">
      <img src="screenshots\Screenshot_2.png" alt="Screenshot 2" width="60%"/>
    </td>
    <td align="center" width="33%">
      <img src="screenshots\Screenshot_3.png" alt="Screenshot 2" width="60%"/>
    </td>
  </tr>
  <tr>
    <td align="center" width="33%">
      <img src="screenshots\Screenshot_4.png" alt="Screenshot 1" width="60%"/>
    </td>
    <td align="center" width="33%">
      <img src="screenshots\Screenshot_5.png" alt="Screenshot 2" width="60%"/>
    </td>
    <td align="center" width="33%">
      <img src="screenshots\Screenshot_6.png" alt="Screenshot 2" width="60%"/>
    </td>
  </tr>
  <tr>
    <td align="center" width="33%">
      <img src="screenshots\Screenshot_7.png" alt="Screenshot 1" width="60%"/>
    </td>
  </tr>
</table>
