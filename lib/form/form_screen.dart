import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_zaenal/helpers/size_helper.dart';
import 'package:flutter_zaenal/form/form_output_screen.dart';

class BelajarForm extends StatefulWidget {
  const BelajarForm({super.key});

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController jkController = TextEditingController();
  final TextEditingController tglLahirController = TextEditingController();
  String _pilihAgama = "";

  final List<String> agama = [
    "Islam",
    "Protestan",
    "Katolik",
    "Budha",
    "Atheis",
  ];

  final List<String> jenisKelaminList = [
    "Laki-laki",
    "Perempuan",
  ];

  @override
  void initState() {
    tglLahirController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white, // Google Classroom-inspired white background
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: displayHeight(context) * 0.05),
                  // Title with Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_add_alt_1,
                        color: Color(0xFF1A73E8), // Google Classroom blue
                        size: 32,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Biodata Registration",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Colors.black87,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Card(
                    elevation: 4,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Name Text Field
                            _buildTextFormField(
                              controller: namaController,
                              hintText: "Nama Lengkap",
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Input Nama'
                                      : null,
                            ),
                            SizedBox(height: 16),
                            // Gender Dropdown
                            _buildDropdownFormField(
                              value: jkController.text.isNotEmpty
                                  ? jkController.text
                                  : null,
                              hintText: "Jenis Kelamin",
                              labelText: "Pilih Jenis Kelamin",
                              items: jenisKelaminList,
                              onChanged: (String? newValue) {
                                setState(() {
                                  jkController.text = newValue!;
                                });
                              },
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Pilih Jenis Kelamin'
                                      : null,
                            ),
                            SizedBox(height: 16),
                            // Date of Birth Picker
                            _buildTextFormField(
                              controller: tglLahirController,
                              hintText: "Tanggal Lahir",
                              readOnly: true,
                              suffixIcon: Icons.calendar_today,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Input Tanggal Lahir'
                                      : null,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: Color(0xFF1A73E8), // Google blue
                                          onPrimary: Colors.white,
                                          surface: Colors.white,
                                          onSurface: Colors.black87,
                                        ),
                                        dialogBackgroundColor: Colors.white,
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Color(0xFF1A73E8),
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (pickedDate != null) {
                                  String tgl =
                                      DateFormat('yyyy-MM-dd').format(pickedDate);
                                  setState(() {
                                    tglLahirController.text = tgl;
                                  });
                                }
                              },
                            ),
                            SizedBox(height: 16),
                            // Religion Dropdown
                            _buildDropdownFormField(
                              value: _pilihAgama.isNotEmpty ? _pilihAgama : null,
                              hintText: "Agama",
                              labelText: "Pilih Agama",
                              items: agama,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _pilihAgama = newValue!;
                                });
                              },
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Pilih Agama'
                                      : null,
                            ),
                            SizedBox(height: 24),
                            // Submit Button
                            SizedBox(
                              width: displayWidth(context) * 0.8,
                              height: displayHeight(context) * 0.07,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Color(0xFF1A73E8)),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  elevation: MaterialStateProperty.all(2),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.white.withOpacity(0.2)),
                                ),
                                onPressed: _submit,
                                child: Text(
                                  "Simpan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: displayHeight(context) * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    bool readOnly = false,
    IconData? suffixIcon,
    String? Function(String?)? validator,
    VoidCallback? onTap,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        style: TextStyle(color: Colors.black87, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.grey.shade500, size: 20)
              : null,
        ),
        validator: validator,
        onTap: onTap,
      ),
    );
  }

  Widget _buildDropdownFormField({
    String? value,
    required String hintText,
    required String labelText,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String? Function(String?)? validator,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        style: TextStyle(color: Colors.black87, fontSize: 16),
        dropdownColor: Colors.white,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: TextStyle(color: Colors.black87)),
          );
        }).toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    final nama = namaController.text;
    final jk = jkController.text;
    final agama = _pilihAgama;
    final tglLahir = tglLahirController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputFormScreen(
          nama: nama,
          jk: jk,
          tglLahir: tglLahir,
          agama: agama,
        ),
      ),
    );
  }
}