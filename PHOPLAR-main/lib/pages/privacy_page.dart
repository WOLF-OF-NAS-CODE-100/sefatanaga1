import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'CarEx complies with POPIA set out by the South African government for the protection of privacy of users and service providers. This privacy information refers to the users of our platforms such as Website and software applications used to purchase all our services. Therefore, this makes CarEx committed to taking the privacy of all our users seriously and treated with utmost respect for our users and the law.',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            const Text(
              'Information we use on our platforms (Client):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
                '1. Personal information such as your name, surname, date of birth, gender, phone number, email address, and location. This information can be changed or amended at any moment in your account.'),
            const Text(
                '2. Your order related information: We collect order information you choose under categories (services), information you provide regarding your order query.'),
            const Text(
                '3. Payment information: We gather your payment information normally found on your card that you inserted in our platforms.'),
            const Text(
                '4. GPS tracking: We collect your precise geographic location to allow service providers to arrive at your location on time.'),
            const Text(
                '5. Platform interaction: We collect information on how you interact with our platform in order to understand our customers and ultimately improve our services.'),
            const Text(
                '6. Cookies: Our platforms can ask you to either accept or reject cookies in order to enhance user-optimisation through emailing, sms or in-app advertisements. This helps us to tailor our marketing and advertising tools relevant to you. You can opt out from our direct marketing anytime you want.'),
            const Text(
                '7. User messaging: We collect messages from our clients and service providers in order to protect our stakeholders, provide feedback and recommendations. Such information may be available to our third parties.'),
            const SizedBox(height: 16),
            const Text(
              'Information we use on our platforms (Service Provider):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
                '8. Personal information such as your name, surname, date of birth, gender, phone number, email address, and location. This information can be changed or amended at any moment in your account.'),
            const Text(
                '9. Required documentation: We collect your identity documents and driver’s license issued by your country of residence, 3 months bank statement (bank account information), proof of residence, and wholesale license. Your order related information in order to make the platform safe for you and our clients.'),
            const Text(
                '10. Platform interaction: We collect order information you choose under categories (services), information you provide regarding your order query.'),
            const Text(
                '11. Payment information: We gather your payment information normally found on your card that you inserted in our platforms.'),
            const Text(
                '12. GPS tracking: We collect your precise geographic location to allow service providers to arrive at your location on time.'),
            const Text(
                '13. Platform interaction: We collect information on how you interact with our platform in order to understand our customers and ultimately improve our services.'),
            const Text(
                '14. Cookies: Our platforms can ask you to either accept or reject cookies in order to enhance user-optimisation through emailing, sms or in-app advertisements. This helps us to tailor our marketing and advertising tools relevant to you. You can opt out anytime you want.'),
            const Text(
                '15. User messaging: We collect messages from our clients and service providers in order to protect our stakeholders, provide feedback and recommendations. Such information may be available to our third parties.'),
            const SizedBox(height: 16),
            const Text(
              'Who gets access to your information:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
                '1. Our employees: We work with a team of superstars who may use your data on the capacity of CarEx to understand and tailor offers for you.'),
            const Text(
                '2. Service provider: Other service providers such as mechanics and marketing team will use your information to cater to your request while using our mobile app and website.'),
            const Text(
                '3. Law enforcements and law agencies: We may be required by law to support or disclose your personal details for their perusal.'),
            const Text(
                '4. Third parties: in any event of the sale, merger or acquisition of CarEx.'),
            const SizedBox(height: 16),
            const Text(
              'Conditions:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
                '1. Should you disclose any personal information to other third parties other than CarEx, the company shall not be held liable for any breach of protection of personal information.'),
            const Text(
                '2. Age restriction: You should be 18 years and above to use our platforms. Since the platform focuses on service providers (mechanics), it inevitably focuses on vehicles and drivers (and the legal driving age in South Africa is 18). Should you be found to have disclosed inaccurate information especially regarding age, you will be banned from the platform.'),
            const Text(
                '3. You can request your data anytime by sending any email to our company or choose to delete your personal information by deleting our mobile application at any time.'),
          ],
        ),
      ),
    );
  }
}
