import 'package:flutter/material.dart';
import 'membership_screen.dart';
import 'cart_screen.dart';
import 'services_screen.dart';
import 'store_screen.dart';
import 'quote_form_screen.dart';
import 'account_screen.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cartItemCount = 3; // Simular algunos productos en el carrito
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF1565C0),
        unselectedItemColor: Color(0xFF666666),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'Servicios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mi Cuenta',
          ),
        ],
      ),
    );
  }

  Widget _getCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return ServicesScreen();
      case 2:
        return ChatScreen();
      case 3:
        return AccountScreen();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return CustomScrollView(
        slivers: [
          // Modern App Bar with Hero Section
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: Color(0xFF0D47A1),
            flexibleSpace: FlexibleSpaceBar(
              title: Container(),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1565C0), Color(0xFF0D47A1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    // Decorative pattern
                    Positioned(
                      right: -50,
                      top: -50,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                  // Logo and main content
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo_tairon_new.png',
                          height: 100,
                          width: 100,
                          filterQuality: FilterQuality.high,
                          isAntiAlias: true,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Contratista General',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Stack(
                          children: [
                            Center(
                              child: Text(
                                'Hidallgo\'S',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Shopping Cart Icon - Pegado a la derecha
                            Positioned(
                              right: 0,
                              top: -5,
                              child: Container(
                                width: 50,
                                height: 50,
                                child: Stack(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.shopping_cart, color: Colors.white, size: 28),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => CartScreen()),
                                        );
                                      },
                                    ),
                                    if (_cartItemCount > 0)
                                      Positioned(
                                        right: 5,
                                        top: 5,
                                        child: Container(
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF5722),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          constraints: BoxConstraints(
                                            minWidth: 16,
                                            minHeight: 16,
                                          ),
                                          child: Text(
                                            '$_cartItemCount',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ],
                ),
              ),
            ),
            actions: [],
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20),

                // Quick Stats
                _buildQuickStats(),

                SizedBox(height: 30),

                // Services Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        'Servicios Profesionales',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C2C2C),
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildModernServices(),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Membership Section
                _buildMembershipSection(),

                SizedBox(height: 30),

                // Main CTAs
                _buildMainCTAs(),

                SizedBox(height: 30),

                // Testimonials Section
                _buildTestimonialsSection(),

                SizedBox(height: 30),

                // Footer
                _buildFooter(),
              ],
            ),
          ),
        ],
      );
  }

  Widget _buildQuickStats() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              '15+',
              'Años de Experiencia',
              Icons.work_history,
              Color(0xFF1565C0),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              '500+',
              'Proyectos Completados',
              Icons.home_work,
              Color(0xFF2196F3),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              '100%',
              'Satisfacción Garantizada',
              Icons.verified,
              Color(0xFF4CAF50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String number, String label, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 8),
          Text(
            number,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildModernServices() {
    final services = [
      {
        'title': 'Remodelación',
        'description': 'Transformamos tu hogar',
        'icon': Icons.home_repair_service,
        'color': Color(0xFF1565C0),
      },
      {
        'title': 'Electricidad',
        'description': 'Instalaciones seguras',
        'icon': Icons.bolt,
        'color': Color(0xFF1565C0),
      },
      {
        'title': 'Plomería',
        'description': 'Soluciones completas',
        'icon': Icons.plumbing,
        'color': Color(0xFF1565C0),
      },
      {
        'title': 'A/C',
        'description': 'Clima perfecto',
        'icon': Icons.ac_unit,
        'color': Color(0xFF1565C0),
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServicesScreen()),
              );
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: (service['color'] as Color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      service['icon'] as IconData,
                      color: service['color'] as Color,
                      size: 32,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    service['title'] as String,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    service['description'] as String,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF666666),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMembershipSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF0D47A1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF1565C0).withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.verified_user,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(height: 16),
          Text(
            'Membresías de Mantenimiento',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Mantenimiento programado cada 6 meses\nA/C, plomería, electricidad y más',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MembershipScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF1565C0),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'Ver Planes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCTAs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoreScreen()),
                );
              },
              icon: Icon(Icons.store),
              label: Text('Tienda'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1565C0),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuoteFormScreen()),
                );
              },
              icon: Icon(Icons.request_quote),
              label: Text('Cotizar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1565C0),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialsSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lo Que Dicen Nuestros Clientes',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C2C2C),
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildTestimonialCard(
                  'Jose Adura',
                  'Sin dudas los mejores de West Palm Beach, me remodelaron toda la casa y desde un principio pensé que se demorarían ya que sé que estoy en Fort Lauderdale pero cumplieron en tiempo.',
                  '⭐⭐⭐⭐⭐',
                ),
                _buildTestimonialCard(
                  'Arturo SG',
                  'Felicitaciones a Hidallgo\'S por embellecer mi baño de esa forma, si pudiera subir fotos aquí lo haría para que vean como me dejó mi baño, felicidades y claro que los recomiendo.',
                  '⭐⭐⭐⭐⭐',
                ),
                _buildTestimonialCard(
                  'Juan Lopez',
                  'Los mejores, me remodelaron mi baño en West Palm Beach y quedó super, en tiempo y no me quejo del precio en comparación con otras compañías.',
                  '⭐⭐⭐⭐⭐',
                ),
                _buildTestimonialCard(
                  'Michael Johnson',
                  'Outstanding work! They remodeled my kitchen in Boca Raton and the results exceeded my expectations. Professional, punctual, and reasonably priced.',
                  '⭐⭐⭐⭐⭐',
                ),
                _buildTestimonialCard(
                  'Sarah Martinez',
                  'Best contractors in South Florida! They handled my entire home renovation with care and precision. The team was respectful, clean, and delivered on time.',
                  '⭐⭐⭐⭐⭐',
                ),
                _buildTestimonialCard(
                  'Ernesto Treto',
                  'Super, los muchachos honestos sobre todo, a pesar de algunos inconvenientes quedaron bien y el trabajo ni se diga, todo bien, los super recomiendo.',
                  '⭐⭐⭐⭐⭐',
                ),
                _buildTestimonialCard(
                  'Robert Williams',
                  'Excellent service from start to finish! Hidallgo\'S LLC transformed my outdated bathroom into a modern masterpiece. Great communication and fair pricing.',
                  '⭐⭐⭐⭐⭐',
                ),
                _buildTestimonialCard(
                  'Lisa Thompson',
                  'I am so impressed with the quality of work! They remodeled my living room and the attention to detail was incredible. Very professional team, I highly recommend them.',
                  '⭐⭐⭐⭐⭐',
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () => _showReviewDialog(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1565C0),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text('Deja tu Reseña'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String name, String review, String stars) {
    return Container(
      width: 280,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF1565C0),
                child: Text(
                  name.substring(0, 1),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                    Text(
                      stars,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            review,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF2C2C2C),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Color(0xFF2C2C2C),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hidallgo\'S LLC - Todos los derechos reservados',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.phone, color: Colors.white, size: 14),
                SizedBox(width: 6),
                Text(
                  '561-480-9355',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.email, color: Colors.white, size: 14),
                SizedBox(width: 6),
                Flexible(
                  child: Text(
                    'info@hidallgos.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  void _showReviewDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Deja tu Reseña',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Tu nombre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Tu reseña',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancelar'),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('¡Gracias por tu reseña!'),
                                backgroundColor: Color(0xFF4CAF50),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1565C0),
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Enviar'),
                        ),
                      ),
                    ],
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
