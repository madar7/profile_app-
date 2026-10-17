// Import Material Design widgets
import 'package:flutter/material.dart';

// App entry point
void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false, // Hide debug banner
  home: ProfilePage(), // First screen
));

// Main Profile screen (stateless = no changing data)
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light grey background so white cards stand out
      backgroundColor: const Color(0xFFF5F7FB),

      // Top blue bar with icons
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        leading: const Icon(Icons.arrow_back, color: Colors.white), // Back
        actions: const [
          Icon(Icons.share_outlined, color: Colors.white), // Share
          SizedBox(width: 12),
          Icon(Icons.edit_outlined, color: Colors.white), // Edit
          SizedBox(width: 12),
          Icon(Icons.more_vert, color: Colors.white), // More menu
          SizedBox(width: 12),
        ],
      ),

      // Scrollable body
      body: ListView(
        padding: const EdgeInsets.all(16), // Space around edges
        children: [
          // Profile picture from assets folder
          const Center(
            child: CircleAvatar(
              radius: 90, // Size of circle
              backgroundImage: AssetImage('assets/my_photo.jpg'),
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 16), // Space below image

          // Name
          const Text(
            'ibroz Hassan',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B3B7A), // Brand blue
            ),
          ),

          // Job title
          const Text(
            'Mobile Developer',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 24),

          // Info cards — email, phone, location
          _card(Icons.email, Colors.blue, 'Email', 'ibraposs@email.com'),
          _card(Icons.phone, Colors.green, 'Phone', '+252 907 730868'),
          _card(Icons.location_on, Colors.redAccent, 'Location',
              'Galdogob, Somalia'),
          const SizedBox(height: 28),

          // Contact Me button (with send icon)
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: () {}, // Nothing happens when clicked yet
            icon: const Icon(Icons.send_rounded),
            label: const Text(
              'Contact Me',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable card for Email / Phone / Location rows
  Widget _card(IconData icon, Color color, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12), // Space between cards
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // Coloured icon square
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12), // Soft tint
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),

          // Label + value
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style:
                  TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF0B3B7A),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // Chevron on the right
          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}