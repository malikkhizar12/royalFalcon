import 'package:flutter/material.dart';
import 'package:royal_falcon_limousine/widgets/appbar.dart';
import 'package:royal_falcon_limousine/functions/booking_form_fields.dart';

import '../colors.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({Key? key}) : super(key: key);

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController paxController = TextEditingController();
  final TextEditingController pickUpTimeController = TextEditingController();
  final TextEditingController flightNumberController = TextEditingController();
  final TextEditingController specialRequestController = TextEditingController();
  final TextEditingController bookingDateController = TextEditingController();
  final TextEditingController bagsController = TextEditingController();
  final TextEditingController pickUpLocationController = TextEditingController();
  final TextEditingController dropOffLocationController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    paxController.dispose();
    pickUpTimeController.dispose();
    flightNumberController.dispose();
    specialRequestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Instantiate objects of CustomFormField
    CustomFormField nameFormField = CustomFormField(
        label: 'Name', controller: nameController);
    CustomFormField paxFormField = CustomFormField(
        label: 'No. of Pax', controller: paxController);
    CustomFormField pickUpTimeFormField = CustomFormField(
        label: 'Pick Up Time', controller: pickUpTimeController);
    CustomFormField flightNumberFormField = CustomFormField(
        label: 'Flight Number', controller: flightNumberController);
    CustomFormField specialRequestFormField = CustomFormField(
        label: 'Special Request', controller: specialRequestController);
    CustomFormField bookingDateFormField = CustomFormField(
        label: 'Booking Date', controller: bookingDateController);
    CustomFormField bagsFormField = CustomFormField(
        label: 'No. of bags', controller: bagsController);
    CustomFormField pickUpLocationFormField = CustomFormField(
        label: 'Pick up location', controller: pickUpLocationController);
    CustomFormField dropOffLocationFormField = CustomFormField(
        label: 'Drop off location', controller: dropOffLocationController);

    return Scaffold(
      backgroundColor: backgroundColor
      ,
      // appBar: const CustomAppBar(title: 'Booking'),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: CustomAppBar(title: 'Booking'),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30.0), bottom: Radius.circular(30.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0x8B353F54),
                      const Color(0x8B222834),
                    ],
                  ),
                ),
                margin: const EdgeInsets.only(top: 30, ),
                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              nameFormField,
                              paxFormField,
                              pickUpTimeFormField,
                              flightNumberFormField,
                              specialRequestFormField,
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              bookingDateFormField,
                              bagsFormField,
                              pickUpLocationFormField,
                              dropOffLocationFormField,
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                      width: 175,
                      child: ElevatedButton(
                        onPressed: () {
                          // Get data from controllers and do whatever you want
                          // String name = nameController.text;
                          // String pax = paxController.text;
                          // String pickUpTime = pickUpTimeController.text;
                          // String flightNumber = flightNumberController.text;
                          // String specialRequest = specialRequestController.text;
                          // Now you can send this data to another page or process it as needed
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFCF9D2C)),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.zero),
                          // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          // minimumSize: MaterialStateProperty.all<Size>(
                          //     const Size(double.infinity, 48)),
                        ),
                        child: Container(

                          height: 48,
                          alignment: Alignment.center,
                          child: const Text(
                            'Book Now',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
