

import 'package:ecommerce_api/data/response/response.dart';
import 'package:ecommerce_api/view_model/user/specific_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/component/exception_widget/custom_exception.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: ChangeNotifierProvider<SpecificUserViewModel>(
        create: (context) => SpecificUserViewModel()..fetchSpecificUser(),
        child: Consumer<SpecificUserViewModel>(
          builder: (context,value,child){
            switch(value.specificUser.status){
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.error:
                return CustomException(
                  icon: Icons.error,
                  message: value.specificUser.message.toString(),
                  onPressed: ()async{
                    await Provider.of<SpecificUserViewModel>(context, listen: false).fetchSpecificUser();
                  },
                );
              case Status.complete:
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Name"),
                          subtitle: Text(value.specificUser.data!.name!.firstname.toString() + value.specificUser.data!.name!.lastname.toString()),
                        ),
                        ListTile(
                          title: Text("userName"),
                          subtitle: Text(value.specificUser.data!.username.toString()),
                        ),
                        ListTile(
                          title: Text("Email"),
                          subtitle: Text(value.specificUser.data!.email.toString()),
                        ),
                        ListTile(
                          title: Text("Password"),
                          subtitle: Text(value.specificUser.data!.password.toString()),
                        ),
                        ListTile(
                          title: Text("Phone No"),
                          subtitle: Text(value.specificUser.data!.phone.toString()),
                        ),
                        ExpansionTile(
                          title: Text("Address"),
                          children: [
                            ListTile(
                              title: Text("city"),
                              subtitle: Text(value.specificUser.data!.address!.city.toString()),
                            ),
                            ListTile(
                              title: Text("Street"),
                              subtitle: Text(value.specificUser.data!.address!.street.toString()),
                            ),
                            ListTile(
                              title: Text("Number"),
                              subtitle: Text(value.specificUser.data!.address!.number.toString()),
                            ),
                            ListTile(
                              title: Text("Zipcode"),
                              subtitle: Text(value.specificUser.data!.address!.zipcode.toString()),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
