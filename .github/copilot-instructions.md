# Workspace Notes

This workspace contains the Flutter app Compra Clara. Keep the existing separation between screens, widgets, model, and service. Purchase arithmetic belongs in `lib/services/compra_service.dart`; screens should validate and present data, not duplicate the calculation.

## Setup Checklist

- [x] Verify project instructions file exists.
- [x] Clarify requirements: Flutter Android app with purchase registration and result screens.
- [x] Scaffold the Flutter project in the workspace root as `actividad_celular`.
- [x] Implement the purchase workflow and reusable widgets.
- [x] Extensions: none required by the project setup.
- [x] Compile and validate: `flutter analyze`, `flutter test`, and `flutter build apk --debug` pass.
- [x] Create/run task: skipped; the Flutter project is run with `flutter run`.
- [ ] Launch app: no Android device or emulator is currently connected; launch only after the user confirms and connects one.
- [x] Document project structure, run commands, and demo explanations in `README.md`.
inci