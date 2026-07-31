import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends ConsumerStatefulWidget {
  const MapsScreen({super.key});

  @override
  ConsumerState<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends ConsumerState<MapsScreen> {
  double _radius = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Donors & Blood Banks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterSheet();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // GoogleMap(
          //   initialCameraPosition: const CameraPosition(
          //     target: LatLng(28.6139, 77.2090),
          //     zoom: 12,
          //   ),
          //   myLocationEnabled: true,
          //   myLocationButtonEnabled: false,
          //   markers: _markers,
          // ),
          Positioned(
            bottom: 100,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton.small(
                  heroTag: 'zoomIn',
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 8),
                FloatingActionButton.small(
                  heroTag: 'zoomOut',
                  onPressed: () {},
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(height: 8),
                FloatingActionButton.small(
                  heroTag: 'myLocation',
                  onPressed: () {},
                  child: const Icon(Icons.my_location),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomSheet(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildQuickFilter(
            Icons.bloodtype,
            'Blood Banks',
            Colors.red,
            () {},
          ),
          const SizedBox(width: 12),
          _buildQuickFilter(
            Icons.person,
            'Donors',
            Colors.blue,
            () {},
          ),
          const SizedBox(width: 12),
          _buildQuickFilter(
            Icons.local_hospital,
            'Hospitals',
            Colors.green,
            () {},
          ),
        ],
      ),
    );
  }

  Widget _buildQuickFilter(
    IconData icon,
    String label,
    Color color,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Filter',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text('Blood Group'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ['All', 'O-', 'O+', 'A-', 'A+', 'B-', 'B+', 'AB-', 'AB+']
                        .map((g) => Chip(label: Text(g)))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text('Radius'),
                  const SizedBox(height: 8),
                  Slider(
                    value: _radius,
                    min: 1,
                    max: 50,
                    divisions: 49,
                    onChanged: (v) => setState(() => _radius = v),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Apply Filters'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
