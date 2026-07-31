import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/enums.dart';
import '../../../../shared/widgets/common_widgets.dart';

class RoleSelectionScreen extends ConsumerStatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  ConsumerState<RoleSelectionScreen> createState() =>
      _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends ConsumerState<RoleSelectionScreen> {
  UserRole? _selectedRole;

  final _roles = [
    _RoleOption(
      role: UserRole.donor,
      icon: Icons.favorite_rounded,
      title: 'Donor',
      description: 'Donate blood and save lives',
      color: const Color(0xFFE53935),
    ),
    _RoleOption(
      role: UserRole.patient,
      icon: Icons.person_rounded,
      title: 'Patient / Requester',
      description: 'Search donors and create requests',
      color: const Color(0xFF1E88E5),
    ),
    _RoleOption(
      role: UserRole.hospital,
      icon: Icons.local_hospital_rounded,
      title: 'Hospital',
      description: 'Manage donations and issue certificates',
      color: const Color(0xFF43A047),
    ),
    _RoleOption(
      role: UserRole.bloodBank,
      icon: Icons.bloodtype_rounded,
      title: 'Blood Bank',
      description: 'Manage blood inventory',
      color: const Color(0xFFFF8F00),
    ),
    _RoleOption(
      role: UserRole.ngo,
      icon: Icons.groups_rounded,
      title: 'NGO',
      description: 'Organize donation camps',
      color: const Color(0xFF8E24AA),
    ),
  ];

  void _handleContinue() {
    if (_selectedRole == null) return;
    context.go('/profile-setup');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Select Your Role',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose how you want to use LifeLink',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: colorScheme.outline,
                    ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: _roles.length,
                  itemBuilder: (context, index) {
                    final role = _roles[index];
                    final isSelected = _selectedRole == role.role;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? role.color
                                : colorScheme.outline.withOpacity(0.3),
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          color: isSelected
                              ? role.color.withOpacity(0.05)
                              : null,
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: role.color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(role.icon,
                                color: role.color, size: 28),
                          ),
                          title: Text(
                            role.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              role.description,
                              style: TextStyle(
                                color: colorScheme.outline,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          trailing: Radio<UserRole>(
                            value: role.role,
                            groupValue: _selectedRole,
                            activeColor: role.color,
                            onChanged: (value) {
                              setState(() => _selectedRole = value);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              AppButton(
                text: 'Continue',
                onPressed: _selectedRole != null ? _handleContinue : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleOption {
  final UserRole role;
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _RoleOption({
    required this.role,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}
