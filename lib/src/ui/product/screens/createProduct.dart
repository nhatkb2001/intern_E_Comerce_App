import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../../constants/colors.dart';

class atCreateProduct extends StatefulWidget {
  atCreateProduct({Key? key}) : super(key: key);
  @override
  _atCreateProduct createState() => _atCreateProduct();
}

class _atCreateProduct extends State<atCreateProduct>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  late DateTime selectDate = DateTime.now();

  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();

  TextEditingController priceImportController = TextEditingController();
  final GlobalKey<FormState> priceImportFormKey = GlobalKey<FormState>();

  TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> codeFormKey = GlobalKey<FormState>();

  TextEditingController priceController = TextEditingController();
  final GlobalKey<FormState> priceFormKey = GlobalKey<FormState>();

  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> descriptionFormKey = GlobalKey<FormState>();

  TextEditingController quantityController = TextEditingController();
  final GlobalKey<FormState> quantityFormKey = GlobalKey<FormState>();

  late String urlImage = '';
  late String link = '';
  File? imageFile;
  late String fileName = '';

  // Future handleTakeGallery() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.image,
  //     allowCompression: false,
  //   );
  //   print('result');
  //   print(result);
  //   if (result != null) {
  //     setState(() {
  //       fileName = result.files.first.name;
  //     });
  //     if (result.files.first.path != null) {
  //       setState(() {
  //         imageFile = File(result.files.first.path.toString());
  //       });
  //       FirebaseStorage storage = FirebaseStorage.instance;
  //       Reference ref = storage.ref('uploads/$fileName');
  //       UploadTask uploadTask =
  //           ref.putFile(File(result.files.first.path.toString()));
  //     }
  //   }
  // }

  // Future createProduct() async {
  //   Reference ref_2 =
  //       await FirebaseStorage.instance.ref().child('uploads/$fileName');

  //   link = (await ref_2.getDownloadURL()).toString();
  //   FirebaseFirestore.instance.collection('products').add({
  //     'name': nameController.text,
  //     'code': codeController.text,
  //     'description': descriptionController.text,
  //     'importPrice': priceImportController.text,
  //     'price': priceController.text,
  //     'quantity': quantityController.text,
  //     'type': type,
  //     'link': '',
  //     'id': '',
  //     'images': FieldValue.arrayUnion([link])
  //   }).then((value) {
  //     FirebaseFirestore.instance
  //         .collection('products')
  //         .doc(value.id)
  //         .update({'id': value.id});
  //   }).then((value) => Navigator.pop(context));
  // }

  String type = 'Sticker';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        color: Colors.white,
      ),
      SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              margin: const EdgeInsets.only(left: 28, right: 28, top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Iconsax.back_square,
                            size: 28,
                            color: violet,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Create Product',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Recoleta',
                              fontWeight: FontWeight.w500,
                              color: violet),
                        ),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    (imageFile == null)
                        ? Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                // handleTakeGallery();
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: violet),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: const Icon(
                                  Icons.camera,
                                  color: violet,
                                  size: 24,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                // handleTakeGallery();
                              },
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    border: Border.all(color: gray),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 1,
                                        offset: const Offset(3,
                                            -1), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  child: Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Name of Product',
                      style: TextStyle(
                        fontFamily: "Recoleta",
                        fontSize: 20.0,
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Form(
                      key: nameFormKey,
                      child: Container(
                        width: 327 + 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.topCenter,
                        child: TextFormField(
                            style: const TextStyle(
                                fontFamily: 'BeVietnamPro',
                                fontSize: 14,
                                color: black,
                                fontWeight: FontWeight.w400),
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              hintStyle: TextStyle(
                                  fontFamily: 'BeVietnamPro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: black.withOpacity(0.5)),
                              hintText: "Write the name of product",
                              filled: true,
                              fillColor: blueLight,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorStyle: const TextStyle(
                                color: Colors.transparent,
                                fontSize: 0,
                                height: 0,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Import Price',
                      style: TextStyle(
                        fontFamily: "Recoleta",
                        fontSize: 20.0,
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Form(
                        key: priceImportFormKey,
                        child: Container(
                          width: 319,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: blueLight),
                          alignment: Alignment.topCenter,
                          child: TextFormField(
                              style: const TextStyle(
                                  fontFamily: 'BeVietnamPro',
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                              controller: priceImportController,
                              keyboardType: TextInputType.text,
                              //validator
                              validator: (note) {},
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 20, right: 12),
                                hintStyle: const TextStyle(
                                    fontFamily: 'BeVietnamPro',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: gray),
                                hintText: "How much's the import price?",
                                filled: true,
                                fillColor: blueLight,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 0,
                                  height: 0,
                                ),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Price',
                      style: TextStyle(
                        fontFamily: "Recoleta",
                        fontSize: 20.0,
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Form(
                        key: priceFormKey,
                        child: Container(
                          width: 319,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: blueLight),
                          alignment: Alignment.topCenter,
                          child: TextFormField(
                              style: const TextStyle(
                                  fontFamily: 'BeVietnamPro',
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                              controller: priceController,
                              keyboardType: TextInputType.text,
                              //validator
                              validator: (note) {},
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 20, right: 12),
                                hintStyle: const TextStyle(
                                    fontFamily: 'BeVietnamPro',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: gray),
                                hintText: "How much's the market price?",
                                filled: true,
                                fillColor: blueLight,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 0,
                                  height: 0,
                                ),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Quantity',
                      style: TextStyle(
                        fontFamily: "Recoleta",
                        fontSize: 20.0,
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Form(
                        key: quantityFormKey,
                        child: Container(
                          width: 319,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: blueLight),
                          alignment: Alignment.topCenter,
                          child: TextFormField(
                              style: const TextStyle(
                                  fontFamily: 'BeVietnamPro',
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                              controller: quantityController,
                              keyboardType: TextInputType.text,
                              //validator
                              validator: (note) {},
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 20, right: 12),
                                hintStyle: const TextStyle(
                                    fontFamily: 'BeVietnamPro',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: gray),
                                hintText: "How many products do you import",
                                filled: true,
                                fillColor: blueLight,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 0,
                                  height: 0,
                                ),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Product code',
                      style: TextStyle(
                        fontFamily: "Recoleta",
                        fontSize: 20.0,
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Form(
                        key: codeFormKey,
                        child: Container(
                          width: 319,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: blueLight),
                          alignment: Alignment.topCenter,
                          child: TextFormField(
                              style: const TextStyle(
                                  fontFamily: 'BeVietnamPro',
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                              controller: codeController,
                              keyboardType: TextInputType.text,
                              //validator
                              validator: (note) {},
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 20, right: 12),
                                hintStyle: const TextStyle(
                                    fontFamily: 'BeVietnamPro',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: gray),
                                hintText: "What is your product number?",
                                filled: true,
                                fillColor: blueLight,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 0,
                                  height: 0,
                                ),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontFamily: "Recoleta",
                        fontSize: 20.0,
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Form(
                        key: descriptionFormKey,
                        child: Container(
                          width: 319,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: blueLight),
                          alignment: Alignment.topCenter,
                          child: TextFormField(
                              style: const TextStyle(
                                  fontFamily: 'BeVietnamPro',
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                              controller: descriptionController,
                              keyboardType: TextInputType.text,
                              //validator
                              validator: (note) {},
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 20, right: 12),
                                hintStyle: const TextStyle(
                                    fontFamily: 'BeVietnamPro',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: gray),
                                hintText: "What's the description?",
                                filled: true,
                                fillColor: blueLight,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 0,
                                  height: 0,
                                ),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Type',
                      style: TextStyle(
                        fontFamily: "Recoleta",
                        fontSize: 20.0,
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      child: Stack(children: [
                        Container(
                          width: 319,
                          height: 58,
                          decoration: const BoxDecoration(
                            color: violet,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          padding: const EdgeInsets.only(top: 16, left: 24),
                          child: Text(
                            "$type",
                            style: const TextStyle(
                                fontFamily: "BeVietnamPro",
                                fontSize: 16.0,
                                color: white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 28),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                                iconColor: black,
                                collapsedIconColor: white,
                                title: Text(''),
                                children: [
                                  Container(
                                      width: 348,
                                      height: 70,
                                      padding: EdgeInsets.only(top: 12),
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            type = "Sticker";
                                          });
                                        },
                                        child: AnimatedContainer(
                                            padding: EdgeInsets.only(left: 24),
                                            alignment: Alignment.centerLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                            decoration: BoxDecoration(
                                              color: (type == "Sticker")
                                                  ? violet
                                                  : blueLight,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              "Sticker",
                                              style: TextStyle(
                                                  fontFamily: "BeVietnamPro",
                                                  fontSize: 16.0,
                                                  color: (type == "Sticker")
                                                      ? white
                                                      : gray,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                      )),
                                  Container(
                                      width: 348,
                                      height: 70,
                                      padding: EdgeInsets.only(top: 12),
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            type = "Washi Tape";
                                          });
                                        },
                                        child: AnimatedContainer(
                                            padding: EdgeInsets.only(left: 24),
                                            alignment: Alignment.centerLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                            decoration: BoxDecoration(
                                              color: (type == "Washi Tape")
                                                  ? violet
                                                  : blueLight,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              "Washi Tape",
                                              style: TextStyle(
                                                  fontFamily: "BeVietnamPro",
                                                  fontSize: 16.0,
                                                  color: (type == "Washi Tape")
                                                      ? white
                                                      : gray,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                      )),
                                  Container(
                                      width: 348,
                                      height: 70,
                                      padding: EdgeInsets.only(top: 12),
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            type = "Notebook";
                                          });
                                        },
                                        child: AnimatedContainer(
                                            padding: EdgeInsets.only(left: 24),
                                            alignment: Alignment.centerLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                            decoration: BoxDecoration(
                                              color: (type == "Notebook")
                                                  ? violet
                                                  : blueLight,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              "Notebook",
                                              style: TextStyle(
                                                  fontFamily: "BeVietnamPro",
                                                  fontSize: 16.0,
                                                  color: (type == "Notebook")
                                                      ? white
                                                      : gray,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                      )),
                                  Container(
                                      width: 348,
                                      height: 70,
                                      padding: EdgeInsets.only(top: 12),
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            type = "Pen";
                                          });
                                        },
                                        child: AnimatedContainer(
                                            padding: EdgeInsets.only(left: 24),
                                            alignment: Alignment.centerLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                            decoration: BoxDecoration(
                                              color: (type == "Pen")
                                                  ? violet
                                                  : blueLight,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              "Pen",
                                              style: TextStyle(
                                                  fontFamily: "BeVietnamPro",
                                                  fontSize: 16.0,
                                                  color: (type == "Pen")
                                                      ? white
                                                      : gray,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                      )),
                                ]),
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          // createProduct();
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 200,
                            height: 48,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFF5FAAEF),
                                    Color(0xFF979DFA),
                                  ],
                                  stops: [
                                    0.0,
                                    1.0,
                                  ]),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "Create",
                                style: TextStyle(
                                  color: white,
                                  fontFamily: 'BeVietnamPro',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ])))
    ])));
  }
}
