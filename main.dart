import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const AarchtechApp());

const Color brandRed = Color(0xFFD71920);
const Color brandBlack = Color(0xFF151515);
const String phone1 = '7978125505';
const String phone2 = '9583253725';

class AarchtechApp extends StatelessWidget {
  const AarchtechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AARCHTECH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: brandRed),
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: brandBlack,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class ServiceItem {
  final String title;
  final String subtitle;
  final IconData icon;
  const ServiceItem(this.title, this.subtitle, this.icon);
}

const services = <ServiceItem>[
  ServiceItem('CCTV Cameras', 'Supply, installation and maintenance', Icons.videocam_outlined),
  ServiceItem('Video Doorbells', 'Smart door entry and visitor monitoring', Icons.doorbell_outlined),
  ServiceItem('Solar Solutions', 'Solar equipment and installation support', Icons.solar_power),
  ServiceItem('Inverters & Power Backup', 'Backup power solutions and servicing', Icons.battery_charging_full),
  ServiceItem('Networking', 'Network setup, connectivity and support', Icons.wifi),
  ServiceItem('Security Systems', 'Practical security solutions for homes and businesses', Icons.shield_outlined),
  ServiceItem('IT Solutions', 'IT products, setup and technical support', Icons.computer_outlined),
];

Future<void> openPhone(String number) async {
  final uri = Uri(scheme: 'tel', path: number);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

Future<void> openWhatsApp(String message) async {
  final encoded = Uri.encodeComponent(message);
  final uri = Uri.parse('https://wa.me/91$phone1?text=$encoded');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AARCHTECH', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.2)),
        actions: [
          IconButton(
            tooltip: 'Call AARCHTECH',
            onPressed: () => openPhone(phone1),
            icon: const Icon(Icons.call),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                Image.asset('assets/aarchtech_logo.jpg', fit: BoxFit.contain, height: 125),
                const SizedBox(height: 8),
                const Text('SMART SOLUTIONS, SECURE TOMORROW',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.0, color: brandBlack)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: brandBlack,
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [brandBlack, Color(0xFF353535)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Technology. Safety. Reliability.',
                  style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Explore our services for homes and businesses.',
                  style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const SectionHeading('Our Services'),
          const SizedBox(height: 10),
          ...services.map((service) => Card(
            elevation: 0,
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 9),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: brandRed.withValues(alpha: 0.10),
                child: Icon(service.icon, color: brandRed),
              ),
              title: Text(service.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(service.subtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => openWhatsApp('Hello AARCHTECH, I am interested in ${service.title}. Please share details.'),
            ),
          )),
          const SizedBox(height: 14),
          const SectionHeading('Request a Service'),
          const SizedBox(height: 8),
          const Text('Tell us what you need. We will help you with the next steps.',
            style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 12),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: brandRed,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EnquiryPage())),
            icon: const Icon(Icons.request_quote_outlined),
            label: const Text('Send an Enquiry'),
          ),
          const SizedBox(height: 22),
          const SectionHeading('Contact AARCHTECH'),
          const SizedBox(height: 8),
          ContactRow(number: phone1),
          ContactRow(number: phone2),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () => openWhatsApp('Hello AARCHTECH, I would like to know more about your services.'),
            icon: const Icon(Icons.chat, color: brandRed),
            label: const Text('Chat on WhatsApp'),
          ),
          const SizedBox(height: 18),
          const Center(
            child: Text('AARCHTECH®  •  Smart Solutions, Secure Tomorrow',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  const SectionHeading(this.title, {super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(width: 4, height: 22, decoration: BoxDecoration(color: brandRed, borderRadius: BorderRadius.circular(4))),
      const SizedBox(width: 9),
      Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: brandBlack)),
    ],
  );
}

class ContactRow extends StatelessWidget {
  final String number;
  const ContactRow({required this.number, super.key});

  @override
  Widget build(BuildContext context) => Card(
    elevation: 0,
    color: Colors.white,
    child: ListTile(
      leading: const Icon(Icons.phone, color: brandRed),
      title: Text(number, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.call, color: brandRed),
      onTap: () => openPhone(number),
    ),
  );
}

class EnquiryPage extends StatefulWidget {
  const EnquiryPage({super.key});

  @override
  State<EnquiryPage> createState() => _EnquiryPageState();
}

class _EnquiryPageState extends State<EnquiryPage> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final detailsController = TextEditingController();
  String selectedService = services.first.title;

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  void submit() {
    final name = nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter your name.')));
      return;
    }
    final message = 'AARCHTECH Service Enquiry\n'
        'Name: $name\n'
        'Service: $selectedService\n'
        'Location: ${locationController.text.trim()}\n'
        'Requirement: ${detailsController.text.trim()}';
    openWhatsApp(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Request a Service')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Share a few details and continue to WhatsApp to send your enquiry.',
            style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 18),
          TextField(controller: nameController, textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(labelText: 'Your name', border: OutlineInputBorder())),
          const SizedBox(height: 14),
          DropdownButtonFormField<String>(
            value: selectedService,
            decoration: const InputDecoration(labelText: 'Service required', border: OutlineInputBorder()),
            items: services.map((s) => DropdownMenuItem(value: s.title, child: Text(s.title))).toList(),
            onChanged: (value) => setState(() => selectedService = value ?? services.first.title),
          ),
          const SizedBox(height: 14),
          TextField(controller: locationController,
            decoration: const InputDecoration(labelText: 'Your city / area', border: OutlineInputBorder())),
          const SizedBox(height: 14),
          TextField(controller: detailsController, minLines: 3, maxLines: 5,
            decoration: const InputDecoration(labelText: 'Describe what you need', border: OutlineInputBorder())),
          const SizedBox(height: 20),
          FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor: brandRed, foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15)),
            onPressed: submit,
            icon: const Icon(Icons.chat),
            label: const Text('Continue to WhatsApp'),
          ),
        ],
      ),
    );
  }
}
