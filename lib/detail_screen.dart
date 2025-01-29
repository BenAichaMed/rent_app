import 'package:flutter/material.dart';
import 'car_model.dart';
import 'colors.dart';

class DetailScreen extends StatelessWidget {
  final Car car;
  const DetailScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                backgroundColor: AppColors.primary,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Positioned.fill(
                        child: Hero(
                          tag: car.name,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.primary.withOpacity(0.8),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Image.asset(car.image, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColors.primary.withOpacity(0.8),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Icon(Icons.arrow_back, color: AppColors.primary, size: 20),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Icon(Icons.favorite, color: AppColors.secondary, size: 25),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: Offset(0, -30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.cardBg,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(car.brand, style: TextStyle(fontSize: 16, color: AppColors.textLight)),
                                        Text(car.name, style: TextStyle(fontSize: 24, color: AppColors.textDark)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("\$${car.price}", style: TextStyle(fontSize: 24, color: AppColors.secondary, fontWeight: FontWeight.bold)),
                                        Text("per day", style: TextStyle(fontSize: 14, color: AppColors.textLight)),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    _buildInfoChip(Icons.speed, '300 km/h'),
                                    _buildInfoChip(Icons.account_tree_outlined, 'Automatic'),
                                    _buildInfoChip(Icons.local_gas_station, '50L'),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildAvailabilityChip(car.isAvailable),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Specifications", style: TextStyle(fontSize: 18, color: AppColors.textDark, fontWeight: FontWeight.bold)),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(child: _buildSpecItem("Power", "350 HP", Icons.bolt)),
                                  Expanded(child: _buildSpecItem("0-60 mph", "4.5", Icons.timer)),
                                  Expanded(child: _buildSpecItem("Top Speed", "500 km/h", Icons.speed)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Features", style: TextStyle(fontSize: 18, color: AppColors.textDark, fontWeight: FontWeight.bold)),
                              SizedBox(height: 15),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: [
                                  _buildFeatureChip("ABS"),
                                  _buildFeatureChip("GPS"),
                                  _buildFeatureChip("Bluetooth"),
                                  _buildFeatureChip("USB"),
                                  _buildFeatureChip("Audio Jack"),
                                  _buildFeatureChip("Sunroof"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.cardBg,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Description", style: TextStyle(fontSize: 18, color: AppColors.textDark, fontWeight: FontWeight.bold)),
                                SizedBox(height: 10),
                                Text(car.description, style: TextStyle(fontSize: 14, color: AppColors.textLight)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.secondary),
          SizedBox(width: 8),
          Text(label, style: TextStyle(color: AppColors.textDark, fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildSpecItem(String label, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.secondary, size: 24),
          SizedBox(height: 10),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textDark)),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 12, color: AppColors.textLight)),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.secondary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(color: AppColors.secondary, fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildAvailabilityChip(bool isAvailable) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isAvailable ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isAvailable ? "Available" : "Not Available",
        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}