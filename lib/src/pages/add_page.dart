import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> with TickerProviderStateMixin {
  TabController _tabController;
  final ImagePicker _picker = ImagePicker();
  String filePath = '';

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  takePhoto(ImageSource source) async {
    final appDir = await getApplicationDocumentsDirectory();
    final appPath = appDir.path;
    final pickedFile = await _picker.getImage(
      source: source,
    );
    if (pickedFile == null) return;

    File tmpFile = File(pickedFile.path);
    String fileName = path.basename(pickedFile.path);
    tmpFile = await tmpFile.copy('$appPath/$fileName');
    setState(() {
      filePath = tmpFile.path;
    });
  }

  photoOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton.icon(
          icon: Icon(Icons.camera, color: Colors.black),
          onPressed: () {
            takePhoto(ImageSource.camera).then((value) => Navigator.pop(context));
          },
          label: Text('Cámara', style: TextStyle(color: Colors.black)),
        ),
        TextButton.icon(
          icon: Icon(Icons.image, color: Colors.black),
          onPressed: () {
            takePhoto(ImageSource.gallery).then((value) => Navigator.pop(context));
          },
          label: Text('Galería', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  bottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Elegir foto',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            photoOptions(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(child: Text('Productos')),
          Tab(child: Text('Lugares')),
        ],
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                addNewProduct(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                addNewPlace(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  addNewProduct() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'ej: Acondicionador',
                      labelText: 'Nombre del producto',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'ej: Natura',
                      labelText: 'Marca',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Ingredientes',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Comentarios',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'example@mail.com',
                      labelText: 'Email',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                    );
                  },
                  icon: Icon(Icons.add_a_photo),
                  label: Text('Agregar una foto'),
                ),
                TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                    );
                  },
                  icon: Icon(Icons.done),
                  label: Text('Listo!'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  addNewPlace() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'ej: Acondicionador',
                      labelText: 'Nombre del producto',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'ej: Natura',
                      labelText: 'Marca',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Ingredientes',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Comentarios',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'example@mail.com',
                      labelText: 'Email',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                    );
                  },
                  icon: Icon(Icons.add_a_photo),
                  label: Text('Agregar una foto'),
                ),
                TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                    );
                  },
                  icon: Icon(Icons.done),
                  label: Text('Listo!'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
