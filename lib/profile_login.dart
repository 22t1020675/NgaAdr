import 'package:flutter/material.dart';

class ProfileLogin extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ProfileLogin({super.key, required this.userData});

  Map<String, dynamic> get fullUser => {
    "firstName": userData["firstName"] ?? "Emily",
    "lastName": userData["lastName"] ?? "Johnson",
    "email": userData["email"] ?? "emily.johnson@x.dummyjson.com",
    "image": userData["image"] ?? "https://dummyjson.com/icon/emilys/128",
    "age": 21,
    "gender": userData["gender"] ?? "female",
    "phone": "+81 965-431-3024",
    "bloodGroup": "O-",
    "height": 193.24,
    "weight": 63.16,
    "eyeColor": "Green",
    "hair": {"color": "Brown", "type": "Curly"},
    "address": {
      "address": "77 Nguyen Hue",
      "city": "Hue",
      "country": "Viet Nam",
    },
    "university": "Science University",
    "company": {"name": "Tech Solutions", "title": "Marketing Manager"},
  };

  @override
  Widget build(BuildContext context) {
    final user = fullUser;
    final fullName = "${user['firstName']} ${user['lastName']}";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Hồ sơ cá nhân"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double width = constraints.maxWidth;
          final bool isWide = width >= 800;

          Widget header = Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user['image']),
                backgroundColor: Colors.grey.shade200,
              ),
              const SizedBox(height: 15),
              Text(
                fullName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user['company']['title'],
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
            ],
          );

          Widget contact = Column(
            children: [
              const Divider(thickness: 1, height: 1),
              _buildSectionTitle("Thông tin liên hệ"),
              ListTile(
                leading: const Icon(Icons.email, color: Colors.blue),
                title: const Text("Email"),
                subtitle: Text(user['email']),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.blue),
                title: const Text("Điện thoại"),
                subtitle: Text(user['phone']),
              ),
              ListTile(
                leading: const Icon(Icons.location_on, color: Colors.blue),
                title: const Text("Địa chỉ"),
                subtitle: Text(
                  "${user['address']['address']}, ${user['address']['city']}",
                ),
              ),
            ],
          );

          Widget personalDetails = Column(
            children: [
              const Divider(),
              _buildSectionTitle("Chi tiết cá nhân"),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: LayoutBuilder(
                    builder: (context, box) {
                      // Use Wrap so stats flow to multiple lines on narrow screens
                      return Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          _buildSimpleStat("Tuổi", "${user['age']}"),
                          _buildSimpleStat("Giới tính", "${user['gender']}"),
                          _buildSimpleStat("Nhóm máu", "${user['bloodGroup']}"),
                          _buildSimpleStat("Chiều cao", "${user['height']}"),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          );

          Widget experience = Column(
            children: [
              const Divider(),
              _buildSectionTitle("Kinh nghiệm làm việc"),
              _buildExperienceItem(
                company: user['company']['name'],
                role: user['company']['title'],
                time: "2018 - Nay",
              ),
              _buildExperienceItem(
                company: "Previous Company",
                role: "Account Executive",
                time: "2015 - 2018",
              ),
              _buildSectionTitle("Học vấn"),
              _buildExperienceItem(
                company: user['university'],
                role: "BBA, Marketing",
                time: "2010 - 2014",
                icon: Icons.school,
              ),
              const SizedBox(height: 30),
            ],
          );

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: isWide
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Column(children: [header, contact]),
                            ),
                            const SizedBox(width: 20),
                            Flexible(
                              flex: 2,
                              child: Column(
                                children: [personalDetails, experience],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            header,
                            contact,
                            personalDetails,
                            experience,
                          ],
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 5),
      color: Colors.grey.shade50,
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildSimpleStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(height: 30, width: 1, color: Colors.grey.shade300);
  }

  Widget _buildExperienceItem({
    required String company,
    required String role,
    required String time,
    IconData icon = Icons.work,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.shade50,
        child: Icon(icon, color: Colors.blue, size: 20),
      ),
      title: Text(company, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(role),
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
