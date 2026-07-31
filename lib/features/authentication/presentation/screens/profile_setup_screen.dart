import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/common_widgets.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() =>
      _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  String? _selectedGender;
  BloodGroup? _selectedBloodGroup;
  int _currentStep = 0;

  final _genders = ['Male', 'Female', 'Other'];

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() => _currentStep++);
    } else {
      context.go('/donor');
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Profile'),
        leading: _currentStep > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _prevStep,
              )
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => context.go('/login'),
              ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: EdgeInsets.only(right: index < 2 ? 8 : 0),
                      decoration: BoxDecoration(
                        color: index <= _currentStep
                            ? colorScheme.primary
                            : colorScheme.outline.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: _buildStep(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  AppButton(
                    text: _currentStep == 2 ? 'Complete' : 'Next',
                    onPressed: _nextStep,
                  ),
                  if (_currentStep < 2) ...[
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => context.go('/donor'),
                      child: Text(
                        'Skip for now',
                        style: TextStyle(color: colorScheme.outline),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep() {
    switch (_currentStep) {
      case 0:
        return _buildPersonalInfoStep();
      case 1:
        return _buildMedicalProfileStep();
      case 2:
        return _buildDocumentUploadStep();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildPersonalInfoStep() {
    final colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Tell us about yourself',
            style: TextStyle(color: colorScheme.outline),
          ),
          const SizedBox(height: 24),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: colorScheme.primary,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'Full Name',
              prefixIcon: Icon(Icons.person_outlined),
            ),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'Name is required' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Age',
              prefixIcon: Icon(Icons.cake_outlined),
              suffixText: 'years',
            ),
            validator: (v) {
              if (v == null || v.isEmpty) return 'Age is required';
              final age = int.tryParse(v);
              if (age == null || age < 18 || age > 100) {
                return 'Enter valid age (18-100)';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            initialValue: _selectedGender,
            decoration: const InputDecoration(
              labelText: 'Gender',
              prefixIcon: Icon(Icons.wc_outlined),
            ),
            items: _genders
                .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                .toList(),
            onChanged: (v) => setState(() => _selectedGender = v),
            validator: (v) => v == null ? 'Select gender' : null,
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalProfileStep() {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Medical Profile',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Your blood group and weight help us match you',
          style: TextStyle(color: colorScheme.outline),
        ),
        const SizedBox(height: 24),
        Text(
          'Blood Group',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: BloodGroup.values.map((group) {
            return BloodGroupChip(
              bloodGroup: group.displayName,
              isSelected: _selectedBloodGroup == group,
              onTap: () => setState(() => _selectedBloodGroup = group),
              isLarge: true,
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        TextFormField(
          controller: _weightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Weight',
            prefixIcon: Icon(Icons.monitor_weight_outlined),
            suffixText: 'kg',
          ),
          validator: (v) {
            if (v == null || v.isEmpty) return 'Weight is required';
            final w = double.tryParse(v);
            if (w == null || w < 50) return 'Minimum weight is 50 kg';
            return null;
          },
        ),
        const SizedBox(height: 24),
        const InfoBanner(
          icon: Icons.info_outline,
          message:
              'You will still be screened by clinical staff at the donation site. This information helps us pre-qualify matches.',
          type: InfoBannerType.info,
        ),
      ],
    );
  }

  Widget _buildDocumentUploadStep() {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verification',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Upload your ID for verification (optional for donors)',
          style: TextStyle(color: colorScheme.outline),
        ),
        const SizedBox(height: 24),
        _buildUploadCard(
          icon: Icons.badge_outlined,
          title: 'Government ID',
          subtitle: 'Aadhaar, Passport, or Driver\'s License',
        ),
        const SizedBox(height: 16),
        _buildUploadCard(
          icon: Icons.health_and_safety_outlined,
          title: 'Medical Certificate',
          subtitle: 'Recent health checkup (optional)',
        ),
        const SizedBox(height: 24),
        const InfoBanner(
          icon: Icons.verified_user,
          message:
              'Your documents are encrypted and only visible to admin for verification.',
          type: InfoBannerType.success,
        ),
        const SizedBox(height: 24),
        Text(
          'Location & Notifications',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildPermissionCard(
          icon: Icons.location_on_outlined,
          title: 'Enable Location',
          subtitle: 'Find nearby donation requests',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _buildPermissionCard(
          icon: Icons.notifications_outlined,
          title: 'Enable Notifications',
          subtitle: 'Get alerted for urgent requests',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildUploadCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.upload_outlined),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPermissionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        leading: Icon(icon, color: colorScheme.primary),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: FilledButton.tonal(
          onPressed: onTap,
          child: const Text('Enable'),
        ),
      ),
    );
  }
}
