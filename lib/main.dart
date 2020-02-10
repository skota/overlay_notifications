import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Notifications Demo"),
          ),
          body: Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("overlay notification"),
                    onPressed: () {
                      showSimpleNotification(
                          Text("this is a message from simple notification"),
                          background: Colors.green);
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RaisedButton(
                    child: Text("toast"),
                    onPressed: () {
                      toast('this is a message from toast');
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RaisedButton(
                    child: Text("Notification with dismiss "),
                    onPressed: () {
                      showSimpleNotification(
                        Text("Notification that can be dimissed"),
                        autoDismiss: false,
                        background: Colors.green,
                        trailing: Builder(builder: (context) {
                          return FlatButton(
                            onPressed: () {
                              OverlaySupportEntry.of(context).dismiss();
                            },
                            child: Text("dismiss"),
                          );
                        }),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
