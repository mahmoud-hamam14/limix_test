import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/core/cubit/water_quality_desplay_cubit/water_quality_desplay_cubit.dart';
import 'package:limix_test/core/cubit/water_quality_desplay_cubit/water_quality_desplay_state.dart';
import 'package:limix_test/features/categoris/view/dissolved_oxygen.dart';
import 'package:limix_test/features/categoris/view/ec.dart';
import 'package:limix_test/features/categoris/view/ph_level.dart';
import 'package:limix_test/features/categoris/view/salinity.dart';
import 'package:limix_test/features/categoris/view/temperature.dart';
import 'package:limix_test/features/categoris/view/turbidity.dart';
import 'package:limix_test/features/home/models/container_model.dart';
import 'package:limix_test/features/home/widget/custom_container.dart';

class SensorDisplaySection extends StatelessWidget {
  const SensorDisplaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterQualityDesplayCubit, WaterQualityDesplayState>(
      builder: (context, state) {
        // 🔹 Loading
        if (state is WaterQualityDesplayLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // 🔹 Error
        if (state is WaterQualityDesplayError) {
          return Center(child: Text(state.message));
        }

        // 🔹 Success
        if (state is WaterQualityDesplaySuccess) {
          final data = state.data;

          return Column(
            children: [
              /// =========================
              /// First Row
              /// =========================
              Row(
                children: [
                  /// Temperature
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.thermostat,
                        title: "Avg Temp",
                        value: data.temperature.toString(),
                        unit: "°C",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffFEF3C7),
                        iconColor: Colors.orange,
                        iconBgColor: const Color(0xffFEF3C7),
                        valueColor: Colors.orange,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TemperatureView(),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width * 0.035),

                  /// DO
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.water_drop,
                        title: "Oxygen",
                        value: data.dissolvedOxygen.toString(),
                        unit: "mg/L",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffDBEAFE),
                        iconColor: Colors.blue,
                        iconBgColor: const Color(0xffDBEAFE),
                        valueColor: Colors.blue,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DissolvedOxygen(),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width * 0.035),

                  /// pH
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.show_chart_outlined,
                        title: "pH Level",
                        value: data.ph.toString(),
                        unit: "pH",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffE9D5FF),
                        iconColor: Colors.purple,
                        iconBgColor: const Color(0xffE9D5FF),
                        valueColor: Colors.purple,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PhLevel()),
                        );
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              /// =========================
              /// Second Row
              /// =========================
              Row(
                children: [
                  /// Ammonia
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.waves,
                        title: "Ammonia",
                        value: data.ammonia.toString(),
                        unit: "mg/L",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffD1FAE5),
                        iconBgColor: const Color(0xffD1FAE5),
                        iconColor: Colors.green,
                        valueColor: Colors.green,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Salinity()),
                        );
                      },
                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width * 0.035),

                  /// Turbidity
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.speed_outlined,
                        title: "Turbidity",
                        value: data.turbidity.toString(),
                        unit: "NTU",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffFEAAAB),
                        iconBgColor: const Color(0xffFED7AA),
                        iconColor: Color(0xffF67216),
                        valueColor: Color(0xffF67216),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Turbidity()),
                        );
                      },
                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width * 0.035),

                  /// EC
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.bolt_outlined,
                        title: "EC",
                        value: data.ec.toString(),
                        unit: "μS/cm",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffFCE7F3),
                        iconColor: Colors.pinkAccent,
                        iconBgColor: const Color(0xffFCE7F3),
                        valueColor: Colors.pinkAccent,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Ec()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
