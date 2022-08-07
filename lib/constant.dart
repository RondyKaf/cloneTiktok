import 'package:clonetiktok/controllers/auth_controller.dart';
import 'package:clonetiktok/views/screens/auth/audio_video_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


//
const pages = [
  Text("Home_screen"),
  Text("Search_screen"),
  AddVideoScreen(),
  Text("Message_scree"),
  Text("Profile")
];


//colors app
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

//FireBase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firebaseFirestore = FirebaseFirestore.instance;

//Controller
var authController = AuthController.instance;
