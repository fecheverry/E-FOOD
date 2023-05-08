import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  // Declaración de variables
  final _formKey = GlobalKey<FormState>();  // Llave para manejar el estado del formulario
  final _scaffoldKey = GlobalKey<ScaffoldState>();  // Llave para manejar el estado del Snackbar
  List<Map<String, dynamic>> _productos = [];  // Lista de productos
  Map<String, dynamic> _selectedProduct;  // Producto seleccionado
  TextEditingController _nombreController = TextEditingController();  // Controlador del campo nombre
  TextEditingController _precioController = TextEditingController();  // Controlador del campo precio
  TextEditingController _descripcionController = TextEditingController();  // Controlador del campo descripción
  TextEditingController _imagenController = TextEditingController();  // Controlador del campo imagen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Mis listas',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Formulario para ingreso y edición de productos
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nombreController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese el nombre del producto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _precioController,
                    decoration: InputDecoration(
                      labelText: 'Precio',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese el precio del producto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descripcionController,
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese la descripción del producto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _imagenController,
                    decoration: InputDecoration(
                      labelText: 'Imagen',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese la imagen del producto';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        child: Text('Guardar'),
                        onPressed: () {
                          _submitForm();  // Función para guardar el producto
                        },
                      ),
                      ElevatedButton(
                        child: Text('Limpiar'),
                        onPressed: () {
                          _clearForm();  // Función para limpiar el formulario
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Lista de productos
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemCount: _productos.length,
                itemBuilder: (context, index) {
                  final producto = _productos[index];
                  return ListTile(
                    title: Text(producto['nombre']),
                    subtitle: