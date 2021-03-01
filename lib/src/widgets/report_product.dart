import 'package:flutter/material.dart';

class ReportProduct extends StatefulWidget {
  @override
  _ReportProductState createState() => _ReportProductState();
}

class _ReportProductState extends State<ReportProduct> {
  int _option = 0;
  bool _showOtherOptions = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options(),
          ),
        ),
      ],
    );
  }

  options() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          Text('Reportar Producto'),
        ],
      ),
      if (!_showOtherOptions) normalOptions(),
      if (_showOtherOptions) otherOptions(),
      actions(),
    ];
  }

  Widget normalOptions() {
    return Column(
      children: [
        RadioListTile(
          value: 0,
          groupValue: _option,
          title: Text('Este producto no es AptoVegan'),
          onChanged: (v) {
            setState(() {
              _option = v;
            });
          },
        ),
        RadioListTile(
          value: 1,
          groupValue: _option,
          title: Text('Este producto está duplicado'),
          onChanged: (v) {
            setState(() {
              _option = v;
            });
          },
        ),
        RadioListTile(
          value: 2,
          groupValue: _option,
          title: Text('La imagen no corresponde al producto'),
          onChanged: (v) {
            setState(() {
              _option = v;
            });
          },
        ),
        RadioListTile(
          value: 3,
          groupValue: _option,
          title: Text('Los ingredientes son de origen dudoso'),
          onChanged: (v) {
            setState(() {
              _option = v;
            });
          },
        ),
        RadioListTile(
          value: 4,
          groupValue: _option,
          title: Text('El producto contiene aceite de palma'),
          onChanged: (v) {
            setState(() {
              _option = v;
            });
          },
        ),
        RadioListTile(
          value: 5,
          groupValue: _option,
          title: Text('El producto contiene trazas o vestigios de huevo o leche'),
          onChanged: (v) {
            setState(() {
              _option = v;
            });
          },
        ),
        RadioListTile(
          value: 6,
          groupValue: _option,
          title: Text('El producto no está certificado como \'no testeado en animales\''),
          onChanged: (v) {
            setState(() {
              _option = v;
            });
          },
        ),
      ],
    );
  }

  Widget otherOptions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Aclaraciones',
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              labelText: 'example@mail.com',
            ),
          ),
        ],
      ),
    );
  }

  Widget actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('CANCELAR'),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () {},
            child: Text('ENVIAR'),
          ),
        ),
      ],
    );
  }
}
