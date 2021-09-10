
import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page)
{
  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context)
      {
        return page;
      }));
}

Future pushReplace(BuildContext context, Widget page)
{
  return Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context)
      {
        return page;
      }));
}

pop(BuildContext context, String text)
{
  return Navigator.pop(context, text );
}