import 'package:flutter/material.dart';
import 'package:user/user.dart';

class HomeSideMenu extends StatelessWidget {
  const HomeSideMenu({
    required this.profile,
    required this.onLogOut,
    super.key,
  });

  final Profile profile;
  final VoidCallback onLogOut;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF23232B),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 48,
              left: 20,
              right: 20,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Olá!',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/32.jpg'),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.fullName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Text(
                          'Minha conta',
                          style: TextStyle(
                            color: Color(0xFF4FC3A1),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _DrawerItem(
                  icon: Icons.home,
                  label: 'Home / Seguro',
                ),
                const _DrawerItem(
                  icon: Icons.assignment,
                  label: 'Minhas Contratações',
                ),
                const _DrawerItem(
                  icon: Icons.warning_amber,
                  label: 'Meus Sinistros',
                ),
                const _DrawerItem(
                  icon: Icons.family_restroom,
                  label: 'Minha Família',
                ),
                const _DrawerItem(
                  icon: Icons.domain,
                  label: 'Meus Bens',
                ),
                const _DrawerItem(
                  icon: Icons.payments,
                  label: 'Pagamentos',
                ),
                const _DrawerItem(
                  icon: Icons.compare_arrows,
                  label: 'Coberturas',
                ),
                const _DrawerItem(
                  icon: Icons.receipt_long,
                  label: 'Validar Boleto',
                ),
                const _DrawerItem(
                  icon: Icons.phone,
                  label: 'Telefones Importantes',
                ),
                const _DrawerItem(
                  icon: Icons.settings,
                  label: 'Configurações',
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextButton(
                    onPressed: onLogOut,
                    child: const Text(
                      'Sair',
                      style: TextStyle(
                        color: Color(0xFF4FC3A1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4FC3A1), Color(0xFFF6E27A)],
              ),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF4FC3A1),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dúvidas?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Converse agora mesmo e tire suas dúvidas com '
                        'nosso atendimento.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF4FC3A1),
      ),
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      onTap: () {},
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}
