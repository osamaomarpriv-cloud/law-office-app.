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

  // تمت إزالة const من هنا لحل مشكلة تهيئة الشاشات
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

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الخدمات والتوثيق'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('صياغة وتدقيق العقود والاتفاقيات'),
            subtitle: Text('عقود البيع، الإيجار، الشراكة والشركات'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.verified),
            title: Text('التوثيق والاعتماد المستندي'),
            subtitle: Text('إنهاء إجراءات الشهر العقاري والسجل التجاري'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.policy),
            title: Text('التمثيل والنيابة القانونية'),
            subtitle: Text('الحضور والترافع أمام كافة المحاكم والجهات'),
          ),
        ],
      ),
    );
  }
}

class MoreMenuPage extends StatelessWidget {
  const MoreMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إعدادات النظام والحساب'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('المحامي / أسامة عمر'),
            accountEmail: Text('مكتب الاستشارات القانونية - شبين الكوم'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person, size: 40),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('قفل التطبيق بالشفرة والرمز'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.sync),
            title: const Text('المزامنة والنسخ الاحتياطي'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('عن التطبيق والإصدار'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
