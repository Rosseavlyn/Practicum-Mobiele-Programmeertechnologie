//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../controller/controller.dart';
import '../models/meals.dart';
import '../screens/detail_page.dart';

class MealsView extends StatefulWidget {
  final String text;

  const MealsView({Key? key, required this.text}) : super(key: key);

  @override
  _MealsViewState createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {
  // late String strMealThumb;
  // late String strMeal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals"),
      ),
      body: Container(
        // FutureBuilder() membentuk hasil Future dari request API
        child: FutureBuilder(
          future: MealSource.instance.loadMeal(widget.text),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError || widget.text.isEmpty) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              Makanan lauk = Makanan.fromJson(snapshot.data);
              return _buildSuccessSection(lauk);
            }
            return _buildLoadingSection();
          },
        ),
      ),
    );
  }

  // Call API
  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorSection() {
    if (widget.text.isEmpty) {
      return const Text("");
    } else {
      return const Text("Error");
    }
  }

  // Data =! null
  Widget _buildSuccessSection(Makanan data) {
    return ListView.builder(
      itemCount: data.meals?.length,
      itemBuilder: (BuildContext context, int index) {
        final lauk = data.meals![index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailPage(foodId: lauk.idMeal!),
                ),
              );
            },
            leading: Image.network(lauk.strMealThumb as String),
            title: Text(lauk.strMeal as String),
            //subtitle: Text(lauk.ingredMeal as String),
          ),
          
        );
      },
      
    );
    
  }
}
