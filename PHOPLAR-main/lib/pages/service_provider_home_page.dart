import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class ServiceProviderHomePage extends StatefulWidget {
  @override
  _ServiceProviderHomePageState createState() =>
      _ServiceProviderHomePageState();
}

class _ServiceProviderHomePageState extends State<ServiceProviderHomePage> {
  int _selectedIndex = 0;
  bool _isUploading = false;
  File? _profilePicture; // Variable to hold the selected profile picture

  String name = '';
  String surname = '';
  String gender = ''; // Default to Male
  String dateOfBirth = ''; // Default format YYYY-MM-DD
  List<String> selectedCategories = [];

  static const List<Widget> _widgetOptions = <Widget>[
    Placeholder(),
    Placeholder(),
    Text('Services Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Messaging Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Settings Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _signOut() {
    Navigator.of(context)
        .pushReplacementNamed('/'); // Redirect to login page after sign out
  }

  Future<void> _pickAndUploadFile(BuildContext context, String docType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      _uploadFile(file, docType);
    }
  }

  Future<void> _uploadFile(File file, String docType) async {
    setState(() {
      _isUploading = true;
    });

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('YOUR_SERVER_UPLOAD_URL'), // Replace with your server URL
    );
    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        file.path,
      ),
    );
    request.fields['docType'] = docType; // Add document type

    var response = await request.send();

    if (response.statusCode == 200) {
      print('File uploaded successfully');
      // You can show a success message or handle success logic here
    } else {
      print('File upload failed');
      // You can show an error message or handle failure logic here
    }

    setState(() {
      _isUploading = false;
    });
  }

  void _updateProfile(
      String newName,
      String newSurname,
      String newGender,
      String newDateOfBirth,
      String? email,
      String? contactNumber,
      String? whatsappNumber,
      List<String>? categories) {
    setState(() {
      name = newName;
      surname = newSurname;
      gender = ['Male', 'Female'].contains(newGender)
          ? newGender
          : 'Male'; // Ensure gender is either Male or Female
      dateOfBirth =
          newDateOfBirth; // Ensure date format validation on your server side or client side
      selectedCategories = categories ?? []; // Update the selected categories
      _selectedIndex = 0; // Switch to home page to reflect the changes
    });

    // Here you can also handle email, contactNumber, whatsappNumber, and categories as needed
  }

  void _pickProfilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Limit picker to image files
    );

    if (result != null) {
      setState(() {
        _profilePicture = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Provider Home Page'),
      ),
      body: BackgroundContainer(
        backgroundImage:
            'lib/images/background.jpg', // Replace with your image path
        child: Center(
          child: _isUploading
              ? const CircularProgressIndicator()
              : _selectedIndex == 0
                  ? HomeContent(
                      profileName: '$name $surname',
                      selectedCategories: selectedCategories)
                  : _selectedIndex == 1
                      ? ProfilePage(onUpdateProfile: _updateProfile)
                      : _selectedIndex == 4
                          ? SettingsPage(
                              onUpdateProfile: _updateProfile,
                              profilePicture: _profilePicture,
                              pickProfilePicture: _pickProfilePicture,
                              pickAndUploadFile: _pickAndUploadFile,
                            )
                          : _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 22, 0, 119),
        onTap: _onItemTapped,
      ),
    );
  }
}

class BackgroundContainer extends StatelessWidget {
  final String backgroundImage;
  final Widget child;

  const BackgroundContainer({
    required this.backgroundImage,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class HomeContent extends StatelessWidget {
  final String profileName;
  final List<String> selectedCategories;

  const HomeContent({
    Key? key,
    required this.profileName,
    required this.selectedCategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'lib/images/photo.jpg'), // Replace with your profile picture path
          ),
          const SizedBox(height: 10),
          Text(
            ' $profileName',
            style: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 22, 0, 119),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 22, 0, 119),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: selectedCategories.map((category) {
              return ElevatedButton(
                onPressed: () {
                  // Handle category button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 22, 0, 119),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(category),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  final void Function(String, String, String, String, String?, String?, String?,
      List<String>?) onUpdateProfile;

  const ProfilePage({required this.onUpdateProfile});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _genderController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _whatsappNumberController = TextEditingController();
  List<String> _selectedCategories = [];

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _genderController.dispose();
    _dateOfBirthController.dispose();
    _emailController.dispose();
    _contactNumberController.dispose();
    _whatsappNumberController.dispose();
    super.dispose();
  }

  void _showCategoryDialog() async {
    final categories = [
      'Move my load',
      'Tow Assist',
      'Jump Start',
      'Wash my car',
      'Fuel Purchase',
      'Perfect my driving',
      'Diagnostic Testing',
      'Bodywork',
    ];

    final selectedCategories = await showDialog<List<String>>(
      context: context,
      builder: (context) {
        final tempSelectedCategories = List<String>.from(_selectedCategories);

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select Categories'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: categories.map((category) {
                    return CheckboxListTile(
                      value: tempSelectedCategories.contains(category),
                      title: Text(category),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            tempSelectedCategories.add(category);
                          } else {
                            tempSelectedCategories.remove(category);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, tempSelectedCategories);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );

    if (selectedCategories != null) {
      setState(() {
        _selectedCategories = selectedCategories;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _surnameController,
                decoration: const InputDecoration(labelText: 'Surname'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genderController,
                decoration: const InputDecoration(labelText: 'Gender'),
                validator: (value) {
                  if (value == null || !['Male', 'Female'].contains(value)) {
                    return 'Please enter Male or Female';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateOfBirthController,
                decoration: const InputDecoration(
                    labelText: 'Date of Birth (YYYY-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  _showCategoryDialog();
                },
                child: const Text('Select Categories'),
              ),
              TextFormField(
                controller: _emailController,
                decoration:
                    const InputDecoration(labelText: 'Email (Optional)'),
              ),
              TextFormField(
                controller: _contactNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Contact Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _whatsappNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: 'WhatsApp Number (Optional)'),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onUpdateProfile(
                        _nameController.text,
                        _surnameController.text,
                        _genderController.text,
                        _dateOfBirthController.text,
                        _emailController.text.isNotEmpty
                            ? _emailController.text
                            : null,
                        _contactNumberController.text.isNotEmpty
                            ? _contactNumberController.text
                            : null,
                        _whatsappNumberController.text.isNotEmpty
                            ? _whatsappNumberController.text
                            : null,
                        _selectedCategories.isNotEmpty
                            ? List<String>.from(_selectedCategories)
                            : null,
                      );
                    }
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final void Function(String, String, String, String, String?, String?, String?,
      List<String>?) onUpdateProfile;
  final File? profilePicture;
  final VoidCallback pickProfilePicture;
  final void Function(BuildContext, String) pickAndUploadFile;

  const SettingsPage({
    required this.onUpdateProfile,
    required this.profilePicture,
    required this.pickProfilePicture,
    required this.pickAndUploadFile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: pickProfilePicture,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: profilePicture != null
                      ? FileImage(profilePicture!)
                      : null,
                  child: profilePicture == null
                      ? const Icon(Icons.person, size: 50)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                pickAndUploadFile(context, 'ID Copy');
              },
              child: const Text('Upload ID Copy'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                pickAndUploadFile(context, 'Passport Copy');
              },
              child: const Text('Upload Passport Copy'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                pickAndUploadFile(context, '3 Months Bank Statement');
              },
              child: const Text('Upload 3 Months Bank Statement'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                pickAndUploadFile(context, 'Proof of Residence');
              },
              child: const Text('Upload Proof of Residence'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                pickAndUploadFile(context, 'Car Registration');
              },
              child: const Text('Upload Car Registration'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                pickAndUploadFile(context,
                    'Department of Mineral Resources and Energy\'s Wholesale Licence Certificate');
              },
              child: const Text('Upload Wholesale Licence Certificate'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfileEditPage(onUpdateProfile: onUpdateProfile),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              onTap: () {
                // Navigate to change password page
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileEditPage extends StatefulWidget {
  final void Function(String, String, String, String, String?, String?, String?,
      List<String>?) onUpdateProfile;

  const ProfileEditPage({required this.onUpdateProfile});

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _genderController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _whatsappNumberController = TextEditingController();
  List<String> _selectedCategories = [];

  @override
  void initState() {
    super.initState();
    // Initialize form fields with existing profile data
    _nameController.text = ''; // Replace with actual name
    _surnameController.text = ''; // Replace with actual surname
    _genderController.text = ''; // Replace with actual gender
    _dateOfBirthController.text = ''; // Replace with actual date of birth
    _emailController.text = ''; // Replace with actual email
    _contactNumberController.text = ''; // Replace with actual contact number
    _whatsappNumberController.text = ''; // Replace with actual WhatsApp number
    _selectedCategories = []; // Replace with actual selected categories
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _genderController.dispose();
    _dateOfBirthController.dispose();
    _emailController.dispose();
    _contactNumberController.dispose();
    _whatsappNumberController.dispose();
    super.dispose();
  }

  void _showCategoryDialog() async {
    final categories = [
      'Move my load',
      'Tow Assist',
      'Jump Start',
      'Wash my car',
      'Fuel Purchase',
      'Perfect my driving',
      'Diagnostic Testing',
      'Bodywork',
    ];

    final selectedCategories = await showDialog<List<String>>(
      context: context,
      builder: (context) {
        final tempSelectedCategories = List<String>.from(_selectedCategories);

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select Categories'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: categories.map((category) {
                    return CheckboxListTile(
                      value: tempSelectedCategories.contains(category),
                      title: Text(category),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            tempSelectedCategories.add(category);
                          } else {
                            tempSelectedCategories.remove(category);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, tempSelectedCategories);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );

    if (selectedCategories != null) {
      setState(() {
        _selectedCategories = selectedCategories;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _surnameController,
                decoration: const InputDecoration(labelText: 'Surname'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genderController,
                decoration: const InputDecoration(labelText: 'Gender'),
                validator: (value) {
                  if (value == null || !['Male', 'Female'].contains(value)) {
                    return 'Please enter Male or Female';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateOfBirthController,
                decoration: const InputDecoration(
                    labelText: 'Date of Birth (YYYY-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  _showCategoryDialog();
                },
                child: const Text('Select Categories'),
              ),
              TextFormField(
                controller: _emailController,
                decoration:
                    const InputDecoration(labelText: 'Email (Optional)'),
              ),
              TextFormField(
                controller: _contactNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Contact Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _whatsappNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: 'WhatsApp Number (Optional)'),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onUpdateProfile(
                        _nameController.text,
                        _surnameController.text,
                        _genderController.text,
                        _dateOfBirthController.text,
                        _emailController.text.isNotEmpty
                            ? _emailController.text
                            : null,
                        _contactNumberController.text.isNotEmpty
                            ? _contactNumberController.text
                            : null,
                        _whatsappNumberController.text.isNotEmpty
                            ? _whatsappNumberController.text
                            : null,
                        _selectedCategories.isNotEmpty
                            ? List<String>.from(_selectedCategories)
                            : null,
                      );
                      Navigator.pop(
                          context); // Close the profile edit page after saving
                    }
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
