import 'package:flutter/material.dart';

void main() {
  runApp(const LawOfficeApp());
}

class LawOfficeApp extends StatelessWidget {
  const LawOfficeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مكتب المحاماة والاستشارات القانونية',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const CasesPage(),
    const ConsultationsPage(),
    const ServicesPage(),
    const MoreMenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_outlined),
            selectedIcon: Icon(Icons.folder),
            label: 'القضايا',
          ),
          NavigationDestination(
            icon: Icon(Icons.forum_outlined),
            selectedIcon: Icon(Icons.forum),
            label: 'الاستشارات',
          ),
          NavigationDestination(
            icon: Icon(Icons.gavel_outlined),
            selectedIcon: Icon(Icons.gavel),
            label: 'الخدمات',
          ),
          NavigationDestination(
            icon: Icon(Icons.more_horiz),
            selectedIcon: Icon(Icons.more_horiz),
            label: 'المزيد',
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------
// 1. الشاشة الرئيسية (Dashboard)
// --------------------------------------------------
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('نظام إدارة المكتب القانوني'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مرحباً بك أستاذ أسامة 👋',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'متابعة الجلسات والقضايا اليومية بضغطة زر.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('إضافة قضية جديدة'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'ملخص العمل',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                  child: StatCard(
                    title: 'قضايا متداولة',
                    value: '24',
                    icon: Icons.gavel,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'جلسات هذا الأسبوع',
                    value: '7',
                    icon: Icons.event,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                  child: StatCard(
                    title: 'استشارات معلقة',
                    value: '5',
                    icon: Icons.mark_chat_unread,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'مستندات جاهزة',
                    value: '12',
                    icon: Icons.verified_user,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'الأقسام التخصصية',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: const [
                CategoryCard(title: 'القضايا المدنية', icon: Icons.balance),
                CategoryCard(title: 'القضايا الجنائية', icon: Icons.security),
                CategoryCard(title: 'الأحوال الشخصية', icon: Icons.family_restroom),
                CategoryCard(title: 'الشركات والتجارية', icon: Icons.business),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------
// 2. شاشة القضايا (CasesPage)
// --------------------------------------------------
class CasesPage extends StatelessWidget {
  const CasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سجل القضايا والجلسات'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final caseNumbers = ['1024 / 2026', '542 / 2026', '891 / 2025', '302 / 2026'];
          final caseTitles = [
            'دعوى صحة ونفاذ عقد بيع',
            'قضية شيك بدون رصيد',
            'دعوى أحوال شخصية - نفقة',
            'نزاع تجاري وتصفية شركة'
          ];
          final courts = ['محكمة شبين الكوم', 'محكمة طنطا', 'محكمة منوف', 'محكمة السادات'];

          return Card.outlined(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.folder_open),
              ),
              title: Text(caseTitles[index]),
              subtitle: Text('رقم القضية: ${caseNumbers[index]}\nالمحكمة: ${courts[index]}'),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

// --------------------------------------------------
// 3. شاشة الاستشارات (ConsultationsPage)
// --------------------------------------------------
class ConsultationsPage extends StatelessWidget {
  const ConsultationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاستشارات القانونية'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Card.outlined(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.chat_bubble_outline),
              ),
              title: Text('طلب استشارة #${101 + index}'),
              subtitle: const Text('التخصص: عقود وعقارات\nالحالة: بانتظار الرد'),
              isThreeLine: true,
              trailing: FilledButton.tonal(
                onPressed: () {},
                child: const Text('رد'),
              ),
            ),
          );
        },
      ),
    );
  }
}

// --------------------------------------------------
// 4. شاشة الخدمات (ServicesPage)
// --------------------------------------------------
class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الخدمات والتوثيق'),
      ),
      body: ListView(
        
