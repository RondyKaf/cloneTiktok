import 'package:clonetiktok/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddVideoScreen extends StatefulWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  pickVideo(ImageSource src,BuildContext context) async{
    final video = await ImagePicker().pickVideo(source: src);
    if(video!=null){

    }
  }
  //simpleDialog
  showOptionDialog(BuildContext context){
    return showDialog(context: context, builder: (context)=> SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: (){},
          child: Row(
            children:const [Icon(Icons.image),SizedBox(width: 10,),Text("Gallery",style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: (){},
          child: Row(
            children:const [Icon(Icons.camera_alt),SizedBox(width: 10,),Text("camera",style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: (){},
          child: Row(
            children:const [Icon(Icons.cancel),SizedBox(width: 10,),Text("cancel",style: TextStyle(fontSize: 20),)
            ],
          ),
        )
      ],
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: ()=> showOptionDialog(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: const Center(
              child: Text(
                "Add  Video",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold
              ),
              ),
            ),
          ),

        ),
      ),
    );
  }
}
