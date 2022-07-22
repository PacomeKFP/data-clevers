part of ui.widgets;

Map<String, dynamic> props = {};

void configureToast(String type) {
  switch (type) {
    case 'info':
      props['color'] = Colors.lightBlueAccent;
      props['icon'] = const Icon(Icons.check_rounded);
      break;

    case 'alert':
      props['color'] = Colors.redAccent;
      props['icon'] = const Icon(Icons.error_outline_outlined);
      break;

    case 'debug':
      props['color'] = const Color.fromARGB(178, 178, 255, 89);
      props['icon'] = const SpinKitCircle(
        color: Colors.white,
      );
      break;

    default:
  }
}

void makeToast({
  required String msg,
  int duration = 5,
  ToastGravity position = ToastGravity.TOP,
  double fSize = 24,
  String type = "info",
  required BuildContext context,
}) {
  configureToast(type);
  FToast fToast = FToast().init(context);

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: props['color'],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        props['icon'],
        const SizedBox(
          width: 5.0,
        ),
        Column(
          children: [
            Text(msg, overflow: TextOverflow.clip),
          ],
        ),
      ],
    ),
  );
  fToast.removeCustomToast();
  fToast.showToast(
    child: toast,
    toastDuration: Duration(seconds: duration),
  );
}
