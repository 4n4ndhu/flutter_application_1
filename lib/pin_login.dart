import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/account.dart';

class PinLoginScreen extends StatefulWidget {
  const PinLoginScreen({super.key});

  @override
  State<PinLoginScreen> createState() => _PinLoginScreenState();
}

class _PinLoginScreenState extends State<PinLoginScreen> {
  String pin = '';

  void handleKeyPress(String num) {
    if (pin.length < 4 && num != '') {
      final newPin = pin + num;
      setState(() => pin = newPin);

      if (newPin.length == 4) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (newPin == '1234') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const AccountScreen()),
            );
          } else {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Incorrect PIN'),
                content: const Text('Please try again.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      setState(() => pin = '');
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        });
      }
    }
  }

  void handleBackspace() {
    if (pin.isNotEmpty) {
      setState(() => pin = pin.substring(0, pin.length - 1));
    }
  }

  final List<Map<String, String>> keys = [
    {'num': '1', 'letters': ''},
    {'num': '2', 'letters': 'ABC'},
    {'num': '3', 'letters': 'DEF'},
    {'num': '4', 'letters': 'GHI'},
    {'num': '5', 'letters': 'JKL'},
    {'num': '6', 'letters': 'MNO'},
    {'num': '7', 'letters': 'PQRS'},
    {'num': '8', 'letters': 'TUV'},
    {'num': '9', 'letters': 'WXYZ'},
    {'num': '0', 'letters': ''},
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF033A71), Color(0xFF0066B3), Color(0xFF0593D1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 40),
              Column(
                children: [
                  Image.asset(
                    'assets/images/anzlogo.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Enter Your PIN',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (i) {
                      final filled = i < pin.length;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                          color: filled ? Colors.white : Colors.transparent,
                        ),
                      );
                    }),
                  ),
                ],
              ),
              buildKeypad(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot PIN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Deregister',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildKeypad() {
    final List<Widget> buttons = [];

    for (int i = 0; i < 9; i++) {
      final key = keys[i];
      buttons.add(buildKey(key['num']!, key['letters']!));
    }

    // Row with 0 and backspace
    buttons.add(const SizedBox(width: 80)); // Empty placeholder
    buttons.add(buildKey('0', ''));
    buttons.add(
      GestureDetector(
        onTap: handleBackspace,
        child: Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.2),
          ),
          child: const Center(
            child: Icon(Icons.backspace, color: Colors.white, size: 28),
          ),
        ),
      ),
    );

    return Wrap(alignment: WrapAlignment.center, children: buttons);
  }

  Widget buildKey(String number, String letters) {
    return GestureDetector(
      onTap: () => handleKeyPress(number),
      child: Container(
        width: 90,
        height: 90,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (letters.isNotEmpty)
              Text(
                letters,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}
