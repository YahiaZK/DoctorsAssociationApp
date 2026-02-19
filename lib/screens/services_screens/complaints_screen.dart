import 'package:flutter/material.dart';
import 'package:doctors_association_app/components/app_button.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/models/complaint_model.dart';
import 'package:doctors_association_app/services/complaints_service.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _complaintsService = ComplaintsService();

  final _fullNameController = TextEditingController();
  final _membershipIdController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _membershipIdController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submitComplaint() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final complaint = ComplaintModel(
        fullName: _fullNameController.text.trim(),
        membershipId: _membershipIdController.text.trim(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        submittedAt: DateTime.now(),
      );

      await _complaintsService.submitComplaint(complaint);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.complaintSubmittedSuccess,
            ),
            backgroundColor: Colors.green,
          ),
        );
        _formKey.currentState!.reset();
        _fullNameController.clear();
        _membershipIdController.clear();
        _titleController.clear();
        _descriptionController.clear();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${AppLocalizations.of(context)!.failedToSubmitComplaint}: $e',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          AppLocalizations.of(context)!.submitComplaints,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 26),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.personalInformation,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: AppColors.compliantBorderColor,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 1,
                      children: [
                        Text(AppLocalizations.of(context)!.fullName),
                        CompliantTextFormField(
                          controller: _fullNameController,
                          hintText: 'Ahmad Mohammad',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.fullNameRequired;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8),
                        Text(AppLocalizations.of(context)!.membershipId),
                        CompliantTextFormField(
                          controller: _membershipIdController,
                          hintText: '123456',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.membershipIdRequired;
                            }
                            if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                              return AppLocalizations.of(
                                context,
                              )!.membershipIdInvalid;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  AppLocalizations.of(context)!.complaintDetails,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: AppColors.compliantBorderColor,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 1,
                      children: [
                        Text(AppLocalizations.of(context)!.complaintTitle),
                        CompliantTextFormField(
                          controller: _titleController,
                          hintText: AppLocalizations.of(
                            context,
                          )!.enterShortTitle,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.complaintTitleRequired;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.complaintDescription,
                        ),
                        CompliantTextFormField(
                          controller: _descriptionController,
                          hintText: AppLocalizations.of(
                            context,
                          )!.pleaseDescribeYourIssue,
                          maxLines: 5,
                          minLines: 4,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.complaintDescriptionRequired;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: AppButton(
                    gradient: AppColors.mainGradient,
                    onPressed: _isSubmitting ? null : _submitComplaint,
                    child: _isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            AppLocalizations.of(context)!.submit,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompliantTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int maxLines;
  final int? minLines;

  const CompliantTextFormField({
    super.key,
    this.hintText = '',
    this.validator,
    this.controller,
    this.maxLines = 1,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
      cursorColor: AppColors.dentalTealDark,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
        filled: true,
        fillColor: AppColors.compliantfeildColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.compliantBorderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.compliantBorderColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}
