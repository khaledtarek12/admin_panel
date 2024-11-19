import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/header/templates/site_layout.dart';
import 'package:t_store_web_adimn/common/widgets/responsive/responsive_desgin.dart';
import 'package:t_store_web_adimn/routes/app_routes.dart';
import 'package:t_store_web_adimn/routes/routes.dart';
import 'package:t_store_web_adimn/utils/constants/text_strings.dart';
import 'package:t_store_web_adimn/utils/theme/theme.dart';

class WebAdminPanel extends StatelessWidget {
  const WebAdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: TAppRoutes.pages,
      initialRoute: TRoutes.resposiveDesignScreen,
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => Scaffold(
          body: Center(
            child: Text('Page Not Found',
                style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
      ),
    );
  }
}

class ResposiveDesignScreen extends StatelessWidget {
  const ResposiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: DeskTop(),
      tablet: Tablet(),
      mobile: Mobile(),
    );
  }
}

class DeskTop extends StatelessWidget {
  const DeskTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  -- Frist Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  TRoundedContainer(
                    height: 450,
                    backgroundCoIor: Colors.blue.withOpacity(0.2),
                    child: const Center(child: Text('Box1')),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TRoundedContainer(
                    height: 215,
                    backgroundCoIor: Colors.yellow.withOpacity(0.2),
                    child: const Center(child: Text('Box1')),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TRoundedContainer(
                          height: 215,
                          backgroundCoIor: Colors.pink.withOpacity(0.2),
                          child: const Center(child: Text('Box1')),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TRoundedContainer(
                          height: 215,
                          backgroundCoIor: Colors.lightGreen.withOpacity(0.2),
                          child: const Center(child: Text('Box1')),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),

        // -- Second Row
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TRoundedContainer(
                height: 220,
                backgroundCoIor: Colors.red.withOpacity(0.2),
                child: const Center(child: Text('Box1')),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TRoundedContainer(
                height: 220,
                backgroundCoIor: Colors.red.withOpacity(0.2),
                child: const Center(child: Text('Box1')),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  -- Frist Row
        TRoundedContainer(
          height: 450,
          width: double.infinity,
          backgroundCoIor: Colors.blue.withOpacity(0.2),
          child: const Center(child: Text('Box1')),
        ),
        const SizedBox(height: 20),
        TRoundedContainer(
          height: 215,
          width: double.infinity,
          backgroundCoIor: Colors.yellow.withOpacity(0.2),
          child: const Center(child: Text('Box1')),
        ),
        const SizedBox(height: 20),
        TRoundedContainer(
          height: 215,
          width: double.infinity,
          backgroundCoIor: Colors.pink.withOpacity(0.2),
          child: const Center(child: Text('Box1')),
        ),
        const SizedBox(height: 20),
        TRoundedContainer(
          height: 215,
          width: double.infinity,
          backgroundCoIor: Colors.lightGreen.withOpacity(0.2),
          child: const Center(child: Text('Box1')),
        ),
        const SizedBox(height: 20),

        // -- Second Row
        TRoundedContainer(
          height: 220,
          width: double.infinity,
          backgroundCoIor: Colors.red.withOpacity(0.2),
          child: const Center(child: Text('Box1')),
        ),
        const SizedBox(height: 20),
        TRoundedContainer(
          height: 220,
          width: double.infinity,
          backgroundCoIor: Colors.red.withOpacity(0.2),
          child: const Center(child: Text('Box1')),
        )
      ],
    );
  }
}

class Tablet extends StatelessWidget {
  const Tablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  -- Frist Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  TRoundedContainer(
                    height: 450,
                    backgroundCoIor: Colors.blue.withOpacity(0.2),
                    child: const Center(child: Text('Box1')),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TRoundedContainer(
                    height: 215,
                    backgroundCoIor: Colors.yellow.withOpacity(0.2),
                    child: const Center(child: Text('Box1')),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TRoundedContainer(
                          height: 215,
                          backgroundCoIor: Colors.pink.withOpacity(0.2),
                          child: const Center(child: Text('Box1')),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TRoundedContainer(
                          height: 215,
                          backgroundCoIor: Colors.lightGreen.withOpacity(0.2),
                          child: const Center(child: Text('Box1')),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 20),

        // -- Second Row
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TRoundedContainer(
              height: 220,
              width: double.infinity,
              backgroundCoIor: Colors.red.withOpacity(0.2),
              child: const Center(child: Text('Box1')),
            ),
            const SizedBox(height: 20),
            TRoundedContainer(
              height: 220,
              width: double.infinity,
              backgroundCoIor: Colors.red.withOpacity(0.2),
              child: const Center(child: Text('Box1')),
            ),
          ],
        )
      ],
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('First Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          child: ElevatedButton(
              onPressed: () => Get.toNamed(TRoutes.secondScreen),
              child: const Text('Second Screen')),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Second Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          child: ElevatedButton(
              onPressed: () => Get.back(), child: const Text('First Screen')),
        ),
      ),
    );
  }
}
