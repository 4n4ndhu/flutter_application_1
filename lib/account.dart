import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 16),
          children: [
            _buildHeaderContainer(context),
            const SizedBox(height: 10),
            _buildAccountTile(
              title: 'ANZ Access Advantage',
              amount: '-\$4.20',
              image: 'assets/images/anzcard.png',
            ),
            _buildAccountTile(
              title: 'Personal Loan',
              amount: '-\$4.20',
              image:
                  'assets\/images/sean-oulashin-KMn4VEeEPR8-unsplash 1@2x.png',
            ),
            _buildAccountTile(
              title: 'Open a New Account',
              amount: '-\$4.20',
              image: null,
              isNew: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: 0,
      selectedItemColor: Colors.blue[800],
      unselectedItemColor: Colors.grey[600],
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/accounts.png',
            width: 30,
            height: 30,
          ),
          label: 'Accounts',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/foryou.png', width: 30, height: 30),
          label: 'For You',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/anzplus.png', width: 30, height: 30),
          label: 'ANZ Plus',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/support.png', width: 30, height: 30),
          label: 'Support',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/profile.png', width: 30, height: 30),
          label: 'Profile',
        ),
      ],
    );
  }

  Widget _buildHeaderContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 70, // Increased top padding
        20,
        24,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/anzbg.png'),

          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Accounts',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,

              color: Colors.white,
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 10), // Increased space below 'Accounts'
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/anzcard.png', width: 60),
                  const SizedBox(width: 12),
                  const Text(
                    'ANZ Online Saver',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/arrow.png', width: 24, height: 24),
            ],
          ),
          const SizedBox(height: 15.74),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBalanceColumn('Funds', '\$41.28'),
              _buildBalanceColumn('Balance', '\$41.28'),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFixedActionButton('Transfer', 'assets/images/transfer.png'),
              SizedBox(width: 9),
              _buildFixedActionButton('Pay', 'assets/images/dollar.png'),
              SizedBox(width: 9),

              _buildFixedActionButton('More', 'assets/images/more.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(color: Color(0xffCCFFFFFF), fontSize: 11),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.info_outline, color: Colors.blueAccent, size: 12),
          ],
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }

  Widget _buildFixedActionButton(String label, String imageAsset) {
    return SizedBox(
      width: 106,
      height: 48,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x4D000000),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageAsset, width: 16, height: 16),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                height: 1.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTile({
    required String title,
    required String amount,
    String? image,
    bool isNew = false,
  }) {
    return Column(
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Container(
                        height: 37,
                        width: 52,
                        child: Image.asset(image, height: 27, width: 45),
                      ),
                    )
                  : Container(
                      width: 52,
                      height: 37,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: Color(0xFF0265AB)),
                      ),
                    ),
              const SizedBox(width: 12),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isNew
                          ? const Color(0xFF0265AB)
                          : Color(0xCC000000), // Black with 80% opacity
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                      color: Color(0xCC000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          indent: 20,
          endIndent: 20,
          color: Color(0xFFE4E4E4),
        ),
      ],
    );
  }
}
