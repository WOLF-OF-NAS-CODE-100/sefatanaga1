import 'package:flutter/material.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Use'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Terms of Use',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'PLEASE FAMILIARISE YOURSELF WITH OUR TERMS OF USE BEFORE USING OUR SERVICES. BY USING OUR SERVICE, YOU AUTOMATICALLY AGREE WITH OUR TERMS OF USE.',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Who are we and what do we do?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
                'CarEx is an online platform that connects users with available mechanics or service providers to deliver products and services at a reasonable price within a prescribed geographic area. We do not own and have not hired the service providers for any service rendered, therefore, these services are only rendered by a verified third party at a request of the user or “client”. Therefore, we cannot guarantee the quality of the service rendered.'),
            const SizedBox(height: 16),
            const Text(
              '2. How CarEx platform works',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
                'You can only order the services or products specified on the App. When you order, you specify the product or service you need. Thereafter, you indicate the time and your location. From there, the App will show available mechanics or service providers available to take the call. After this process, you will proceed to the payments page where you will be required to make a payment for the service or product you have chosen.'),
            const SizedBox(height: 8),
            const Text(
                'PLEASE NOTE THE PAYMENT WILL BE HELD BY THE COMPANY UNTIL THE PRODUCT IS DELIVERED OR THE SERVICE IS RENDERED. SHOULD THERE BE ANY DISPUTES, YOU ARE REQUIRED TO NOTIFY THE COMPANY WITHIN 24 HOURS'),
            const SizedBox(height: 16),
            const Text(
              '3. Working hours',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
                'It is important to note that service providers on the mobile application specify their own working hours. As such, CarEx cannot determine that.'),
            const SizedBox(height: 16),
            const Text(
              '4. The sale of the service or product',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
                'The sale of the service or product provided to you can only be determined by the service provider or the mechanic and is subject to change due to operation costs or the economic factors.'),
            const SizedBox(height: 16),
            const Text(
              '5. Point of contact',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
                'Should you have any complaints regarding the services rendered or products provided, CarEx will take the necessary course of action. However, it is the duty of our users to inspect the vehicle before and after being fixed to ensure its safety and the safety of the contents of the vehicle.'),
            const SizedBox(height: 16),
            const Text(
              'Using the app',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
                '1. In the registration phase, you need to provide a username and unique password. Thereafter, proceed to provide accurate personal information. This information should be protected at all costs and not shared with any third party, failure to do so will not fall under the responsibility of CarEx, therefore, CarEx will not be liable for any damages resulting from that.'),
            const Text(
                '2. A service provider may accept or reject orders at their own discretion.'),
            const Text(
                '3. The price of a service rendered or product is at the discretion of the service provider and CarEx takes commission.'),
            const Text(
                '4. Should you cancel or retract your order, please use the App on time.'),
            const Text(
                '5. Should you need to reschedule a service or product, please use the App at an earlier convenience so that the service provider can accept or cancel on time.'),
            const SizedBox(height: 16),
            const Text(
              'Conditions:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
                '1. Should you suspect any breach of personal information, notify the company immediately.'),
            const Text(
                '2. Should you notice fraudulent activities (ie someone using your personal information or someone using your account details and such) or unauthorized access, please notify the company immediately.'),
            const Text(
                '3. Should you login from any other devices, use your original login details.'),
            const Text(
                '4. In addition, for your own safety, please remove any important valuables in your vehicle. CarEx cannot be liable for any damages, theft allegations or any other complaints regarding personal valuables.'),
            const SizedBox(height: 16),
            const Text(
              'Payments:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('1. The User:'),
            const Text(
                '1.1 You will be charged the amount of the distance traveled (travel Fee) to deliver your product or render a service.'),
            const Text(
                '1.2 You will be charged the price of the product or service rendered stipulated by the service provider.'),
            const Text(
                '1.3 You are responsible for the total amount due for (1.1) and (1.2), which your account will be charged.'),
            const Text(
                '1.4 You are allowed to pay using a credit card, debit card or cash on delivery. However, using cash on delivery is at the discretion of the user and the service provider.'),
            const SizedBox(height: 8),
            const Text(
                '2. CarEx offers BUYERS PROTECTION in order to resolve disputes. Should any issue arise, the user shall attempt to resolve any dispute with the service provider and should it fail, the user has a right to issue the dispute with our company before or after the release of any funds to the service provider.'),
            const Text('2.1 BUYERS PROTECTION:'),
            const SizedBox(height: 8),
            const Text('3. The Service Provider:'),
            const Text('3.1 You will be paid: The travel fee.'),
            const Text(
                '3.2 You will be paid the amount stipulated by you for the product or service rendered.'),
            const Text(
                '3.3 CarEx will take commission from the total amount of (3.1) and (3.2).'),
            const Text(
                '3.4 You are allowed to receive payments using a credit card, debit card or cash after delivery. However, using cash after delivery is at the discretion of the user and the service provider.'),
          ],
        ),
      ),
    );
  }
}
