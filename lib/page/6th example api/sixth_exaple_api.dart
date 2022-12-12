import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_riverpod/page/6th%20example%20api/api_service.dart';
import 'package:state_riverpod/page/6th%20example%20api/user_model.dart';

final apiProvider = Provider(
  (ref) => ApiService(),
);

final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUser();
});

class SixthExampleApi extends ConsumerWidget {
  static const String routeName = '/sixth_example';
  const SixthExampleApi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sixth Example FutureProvider'),
        ),
        body: userData.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text('${data[index].firstName} ${data[index].lastName}'),
                  subtitle: Text('${data[index].email}'),
                  leading: CircleAvatar(
                    child: Image.network(data[index].avatar.toString()),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
