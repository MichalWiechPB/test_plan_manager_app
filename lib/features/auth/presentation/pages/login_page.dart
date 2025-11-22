import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../bloc/auth_bloc.dart';
import 'microsoft_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> _startLogin(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const MicrosoftLoginPage(),
      ),
    );

    if (result is Map) {
      final code = result["code"] as String?;

      if (code != null) {
        context.read<AuthBloc>().add(
          LoginWithMicrosoftEvent(code),
        );
      }
    }
  }

  Future<void> _fetchMe(BuildContext context) async {
    final bloc = context.read<AuthBloc>();

    final token = await bloc.secureStorage.read(key: "access_token");

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Brak tokenu! Zaloguj się ponownie.")),
      );
      return;
    }

    final url = Uri.parse("https://graph.microsoft.com/v1.0/me");
    final res = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Dane użytkownika"),
        content: Text(res.body),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final isLoggedIn = state is AuthLoggedIn;

        return Scaffold(
          appBar: AppBar(title: const Text("Logowanie")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isLoggedIn) ...[
                  ElevatedButton(
                    onPressed: () => _startLogin(context),
                    child: const Text("Zaloguj się z Microsoft"),
                  ),
                ],

                if (isLoggedIn) ...[
                  const Text(
                    "Jesteś zalogowany!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () => _fetchMe(context),
                    child: const Text("Pobierz dane z Microsoft (GET /me)"),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () => context.go('/projects'),
                    child: const Text("Przejdź do /projects"),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LogoutEvent());
                    },
                    child: const Text("Wyloguj"),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
