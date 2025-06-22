import 'package:flutter/material.dart';
import 'package:grovia/featuers/auth/domain/entities/user.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'G',
                style: theme.textTheme.displayLarge?.copyWith(
                  fontSize: 100,
                  fontFamily: 'RobotoMono',
                  color: theme.primaryColor,
                ),
              ),
              Text(
                'rovia',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontSize: 50,
                  fontFamily: 'RobotoMono',
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),

          Text(
            'Smart , Easy to Growth your Startup',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 30,
              color: theme.colorScheme.outline,
            ),
          ),
          SizedBox(height: 30),

          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Choose your role',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/register',
                          arguments: UserRole.merchant,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: theme.colorScheme.secondary,
                              width: 2,
                            ),
                          ),

                          surfaceTintColor: theme.cardTheme.surfaceTintColor,
                          color: theme.cardColor,
                          child: SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2 - 24,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.store,
                                  size: 80,
                                  color: theme.primaryColor,
                                ),
                                Text(
                                  'Store Owner',
                                  style: theme.textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //---------------------------\\
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/register',
                          arguments: UserRole.customer,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: theme.colorScheme.secondary,
                              width: 2,
                            ),
                          ),
                          surfaceTintColor: theme.cardTheme.surfaceTintColor,
                          color: theme.cardColor,
                          child: SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2 - 24,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.supervised_user_circle_sharp,
                                  size: 80,
                                  color: theme.primaryColor,
                                ),
                                Text(
                                  'Customer',
                                  style: theme.textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(200, 50),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
