import 'package:flutter/material.dart';

void main() {
  runApp(ContactApp());
}

class Contact {
  final String name;
  final String email;
  final String phone;

  Contact({required this.name, required this.email, required this.phone});
}

class ContactApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'John Doe', email: 'john.doe@example.com', phone: '+1234567890'),
    Contact(name: 'Jane Smith', email: 'jane.smith@example.com', phone: '+9876543210'),
    Contact(name: 'David Johnson', email: 'david.johnson@example.com', phone: '+4567890123'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ContactListScreen(contacts: contacts),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts;

  ContactListScreen({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.email),
            onTap: () => _openContactDetailsBottomSheet(context, contact),
          );
        },
      ),
    );
  }

  void _openContactDetailsBottomSheet(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Contact Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              Text('Name: ${contact.name}'),
              Text('Email: ${contact.email}'),
              Text('Phone: ${contact.phone}'),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Dismiss'),
              ),
            ],
          ),
        );
      },
    );
  }
}
