import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Form Example')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: FormWidget(),
        ),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _email;
  String? _password;
  String? _phone;
  String? _address;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Name Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) =>
                value == null || value.isEmpty ? 'Please enter your name' : null,
            onSaved: (value) => _name = value,
          ),
          SizedBox(height: 16),

          // Email Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
            onSaved: (value) => _email = value,
          ),
          SizedBox(height: 16),

          // Password Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) =>
                value == null || value.isEmpty ? 'Please enter a password' : null,
            onSaved: (value) => _password = value,
          ),
          SizedBox(height: 16),

          // Phone Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.phone,
            validator: (value) =>
                value == null || value.isEmpty ? 'Please enter your phone number' : null,
            onSaved: (value) => _phone = value,
          ),
          SizedBox(height: 16),

          // Address Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Address'),
            maxLines: 3,
            validator: (value) =>
                value == null || value.isEmpty ? 'Please enter your address' : null,
            onSaved: (value) => _address = value,
          ),
          SizedBox(height: 24),

          // Submit Button
          Center(
            child: ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Print form details (you can replace this with your backend logic)
      print('Form submitted:');
      print('Name: $_name');
      print('Email: $_email');
      print('Password: $_password');
      print('Phone: $_phone');
      print('Address: $_address');

      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }
}
