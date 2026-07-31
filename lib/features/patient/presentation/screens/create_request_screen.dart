import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/common_widgets.dart';

class CreateRequestScreen extends ConsumerStatefulWidget {
  const CreateRequestScreen({super.key});

  @override
  ConsumerState<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends ConsumerState<CreateRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _patientNameController = TextEditingController();
  final _patientAgeController = TextEditingController();
  final _unitsController = TextEditingController(text: '1');
  final _doctorNameController = TextEditingController();
  final _contactController = TextEditingController();
  final _notesController = TextEditingController();

  BloodGroup? _selectedBloodGroup;
  UrgencyLevel _urgency = UrgencyLevel.urgent;
  bool _isLoading = false;

  @override
  void dispose() {
    _patientNameController.dispose();
    _patientAgeController.dispose();
    _unitsController.dispose();
    _doctorNameController.dispose();
    _contactController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submitRequest() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request submitted successfully!')),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Blood Request')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUrgencySelector(),
              const SizedBox(height: 20),
              Text(
                'Blood Group Needed',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: BloodGroup.values.map((group) {
                  return BloodGroupChip(
                    bloodGroup: group.displayName,
                    isSelected: _selectedBloodGroup == group,
                    onTap: () => setState(() => _selectedBloodGroup = group),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text(
                'Patient Information',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _patientNameController,
                decoration: const InputDecoration(
                  labelText: 'Patient Name',
                  prefixIcon: Icon(Icons.person_outlined),
                ),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _patientAgeController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Age',
                        prefixIcon: Icon(Icons.cake_outlined),
                      ),
                      validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _unitsController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Units Required',
                        prefixIcon: Icon(Icons.bloodtype_outlined),
                      ),
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Required';
                        final n = int.tryParse(v);
                        if (n == null || n < 1) return 'Minimum 1';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _doctorNameController,
                decoration: const InputDecoration(
                  labelText: 'Doctor Name (optional)',
                  prefixIcon: Icon(Icons.medical_services_outlined),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _contactController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Contact Phone',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _notesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Additional Notes (optional)',
                  prefixIcon: Icon(Icons.notes_outlined),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: (_selectedBloodGroup != null && !_isLoading)
                      ? _submitRequest
                      : null,
                  icon: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.send),
                  label: Text(_isLoading ? 'Submitting...' : 'Submit Request'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUrgencySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Urgency Level',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Row(
          children: UrgencyLevel.values.map((level) {
            final isSelected = _urgency == level;
            final color = switch (level) {
              UrgencyLevel.critical => Colors.red,
              UrgencyLevel.urgent => Colors.orange,
              UrgencyLevel.scheduled => Colors.blue,
            };
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GestureDetector(
                  onTap: () => setState(() => _urgency = level),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? color.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? color : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          level == UrgencyLevel.critical
                              ? Icons.emergency
                              : level == UrgencyLevel.urgent
                                  ? Icons.warning_amber
                                  : Icons.schedule,
                          color: isSelected ? color : Colors.grey,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          level.name.capitalize,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: isSelected ? color : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
