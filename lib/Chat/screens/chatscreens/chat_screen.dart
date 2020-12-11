import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttextile/Chat/provider/document_upload_provider.dart';
import 'package:smarttextile/Chat/screens/pageviews/widgets/size_config.dart';
import 'package:smarttextile/Chat/screens/pageviews/widgets/user_circle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Chat/constants/strings.dart';
import 'package:smarttextile/Chat/enum/view_state.dart';
import 'package:smarttextile/Chat/models/message.dart';
import 'package:smarttextile/Chat/provider/image_upload_provider.dart';
import 'package:smarttextile/Chat/resources/auth_methods.dart';
import 'package:smarttextile/Chat/resources/chat_methods.dart';
import 'package:smarttextile/Chat/resources/storage_methods.dart';
import 'package:smarttextile/Chat/screens/chatscreens/widgets/cached_image.dart';
import 'package:smarttextile/Chat/utils/universal_variables.dart';
import 'package:smarttextile/Chat/utils/utilities.dart';
import 'package:smarttextile/Chat/widgets/custom_tile.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main_content/screens/shared/transporters_list.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/shared/push_notification.dart';
import 'widgets/cached_document.dart';

import 'package:path/path.dart' as p;

class ChatScreen extends StatefulWidget {
  final User receiver;
  final String senderProfilePhoto;
  ChatScreen({this.receiver, this.senderProfilePhoto});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textFieldController = TextEditingController();
  FocusNode textFieldFocus = FocusNode();

  ImageUploadProvider _imageUploadProvider;
  DocumentUploadProvider _documentUploadProvider;
  ProviderUser sender;

  final StorageMethods _storageMethods = StorageMethods();
  final ChatMethods _chatMethods = ChatMethods();
  final AuthMethods _authMethods = AuthMethods();

  ScrollController _listScrollController = ScrollController();

  //User sender;

  bool isWriting = false;

  bool showEmojiPicker = false;

  @override
  void initState() {
    super.initState();
  }

  showKeyboard() => textFieldFocus.requestFocus();

  hideKeyboard() => textFieldFocus.unfocus();

  hideEmojiContainer() {
    setState(() {
      showEmojiPicker = false;
    });
  }

  showEmojiContainer() {
    setState(() {
      showEmojiPicker = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    sender = Provider.of<ProviderUser>(context);
    _imageUploadProvider = Provider.of<ImageUploadProvider>(context);
    _documentUploadProvider = Provider.of<DocumentUploadProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          customappbar(),
          Flexible(
            child: messageList(),
          ),
          _imageUploadProvider.getViewState == ViewState.LOADING
              ? Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(
                      right: SizeConfig.safeBlockHorizontal * 15),
                  child: CircularProgressIndicator(),
                )
              : Container(),
          _documentUploadProvider.getViewState == ViewState.LOADING
              ? Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(
                      right: SizeConfig.safeBlockHorizontal * 15),
                  child: CircularProgressIndicator(),
                )
              : Container(),
          chatControls(),
          showEmojiPicker ? Container(child: emojiContainer()) : Container(),
        ],
      ),
    );
  }

  Widget customappbar() {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.circular(SizeConfig.safeBlockVertical * 70),
                  ),
                  boxShadow: [
                    new BoxShadow(
                        color: Color(0xff00747A).withOpacity(0.3),
                        blurRadius: 10.0,
                        spreadRadius: 2),
                  ]),
              padding: const EdgeInsets.only(
                left: 10,
                top: 5.0,
                bottom: 20,
                right: 10,
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  color: Colors.black,
                                  onPressed: () => Navigator.pop(context))),
                        ]),
                    UserCircle(
                      name: widget.receiver.name,
                      profile: widget.receiver.logo,
                      companyname: widget.receiver.companyName,
                      email: widget.receiver.email,
                      ph: widget.receiver.phoneNo,
                    ),
                    Text(
                      widget.receiver.companyName,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }

  emojiContainer() {
    return EmojiPicker(
      bgColor: UniversalVariables.separatorColor,
      indicatorColor: UniversalVariables.blueColor,
      rows: 3,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        setState(() {
          isWriting = true;
        });

        textFieldController.text = textFieldController.text + emoji.emoji;
      },
      recommendKeywords: ["face", "happy", "party", "sad"],
      numRecommended: 50,
    );
  }

  Widget messageList() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection(MESSAGES_COLLECTION)
          .document(sender.uid)
          .collection(widget.receiver.uid)
          .orderBy(TIMESTAMP_FIELD, descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }

        SchedulerBinding.instance.addPostFrameCallback((_) {
          _listScrollController.animateTo(
            _listScrollController.position.minScrollExtent,
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          );
        });

        return ListView.builder(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
          controller: _listScrollController,
          reverse: true,
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            // mention the arrow syntax if you get the time
            return chatMessageItem(snapshot.data.documents[index]);
          },
        );
      },
    );
  }

  Widget chatMessageItem(DocumentSnapshot snapshot) {
    Message _message = Message.fromMap(snapshot.data);
    var _messageId = snapshot.documentID;

    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 12),
      child: Container(
        alignment: _message.senderId == sender.uid
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: _message.senderId == sender.uid
            ? focusedMenuHolder(_message, _messageId)
            : receiverLayout(_message,_messageId),
      ),
    );
  }

  FocusedMenuHolder focusedMenuHolder(Message _message, String _messageId) {
    return FocusedMenuHolder(
        blurSize: 4,
        blurBackgroundColor: Color(0xffE0E0E0),
        animateMenuItems: false,
        menuWidth: SizeConfig.safeBlockVertical * 185,
        menuItemExtent: 45,
        menuBoxDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockVertical * 50),
        ),
        onPressed: () {},
        menuItems: <FocusedMenuItem>[
          FocusedMenuItem(
              title: Text(
                "Copy",
                style: GoogleFonts.lato(
                    fontSize: SizeConfig.safeBlockHorizontal * 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: _message.message));
              },
              trailingIcon: Icon(
                Icons.content_copy,
                color: Colors.black,
              )),
          FocusedMenuItem(
              title: Text(
                "Share",
                style: GoogleFonts.lato(
                    fontSize: SizeConfig.safeBlockHorizontal * 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                //WcFlutterShare.share(text: );
                _message.type != MESSAGE_TYPE_IMAGE
                    ? _message.type != MESSAGE_TYPE_DOCUMENT
                        ? Share.text('Message', _message.message, 'text/plain')
                        : _message.documentUrl != null
                            ? await _shareDocumentFromUrl(_message.documentUrl)
                            : Text("No Document")
                    : _message.type != MESSAGE_TYPE_DOCUMENT
                        ? _message.photoUrl != null
                            ? await _shareImageFromUrl(_message.photoUrl)
                            : Text("No Image")
                        : Text("No Message");
              },
              trailingIcon: Icon(
                Icons.share,
                color: Colors.black,
              )),
          FocusedMenuItem(
              title: Text(
                "Delete",
                style: GoogleFonts.lato(
                    fontSize: SizeConfig.safeBlockVertical * 12,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                _chatMethods.deleteMessageDb(
                    _message, sender.user, widget.receiver, _messageId);
              },
              trailingIcon: Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ],
        child: senderLayout(_message,_messageId));
  }

  Future<void> _shareImageFromUrl(String url) async {
    try {
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      await Share.file('Cerebro', 'Photo.jpg', bytes, 'image/jpg');
    } catch (e) {
      print('error: $e');
    }
  }

  Future<void> _shareDocumentFromUrl(String url) async {
    try {
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      await Share.file('Cerebro', 'Pdf.pdf', bytes, 'document/pdf');
    } catch (e) {
      print('error: $e');
    }
  }

  Widget senderLayout(Message message,String messageid) {
    Radius messageRadius = Radius.circular(SizeConfig.safeBlockHorizontal * 10);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "You",
                  style: GoogleFonts.montserrat(
                    color: Color(0xff008A91),
                    fontSize: SizeConfig.safeBlockHorizontal * 10,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(width: SizeConfig.safeBlockVertical*5),
                widget.senderProfilePhoto != null
                    ? CircleAvatar(
                        backgroundImage:
                            NetworkImage(widget.senderProfilePhoto),
                        radius: SizeConfig.safeBlockHorizontal * 12,
                      )
                    : CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.png'),
                      ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.safeBlockHorizontal * 12),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.65),
              decoration: BoxDecoration(
                color: Color(0xffE0E0E0),
                borderRadius: BorderRadius.only(
                  topLeft: messageRadius,
                  bottomRight: messageRadius,
                  bottomLeft: messageRadius,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
                child: getMessage(message,messageid),
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockHorizontal*5,),
            Text(
              _ago(message.timestamp.millisecondsSinceEpoch),
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 10,
                fontWeight: FontWeight.w500,
                color: Color(0xff828282),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _ago(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var format = DateFormat.yMMMd().format(date);
    
    return format;
  }

  _ago1(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var format = DateFormat.m().format(date);
    
    return format;
  }

  

  Widget getMessage(Message message,String messageid) {
    return message.type != MESSAGE_TYPE_DOCUMENT
        ? message.type != MESSAGE_TYPE_IMAGE
            ? Text(message.message,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    fontWeight: FontWeight.w500,
                  ),
                ))
            : message.photoUrl != null
                ? CachedImage(
                    message.photoUrl,
                    height: SizeConfig.safeBlockHorizontal * 300,
                    width: SizeConfig.safeBlockVertical * 300,
                    radius: 10,
                  )
                : Text("No Image",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ))
        : message.documentUrl != null
            ? RaisedButton(
                child: Text("pdf"),
                onPressed: () {
                  int x =  int.parse(_ago1(Timestamp.now().millisecondsSinceEpoch));
                  print(x);
                  int z = int.parse(_ago1(message.timestamp.millisecondsSinceEpoch));
                  print(z);
                  int y = x-z; 
                  print(y);
                  if(y >= 2){
                    _chatMethods.deleteMessageDb(message, sender.user, widget.receiver, messageid);
                  }
                  else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CachedDocument(
                                urlpath: message.documentUrl,
                                filename: message.filename,
                              )));
                  }
                  
                },
              )
            : Text("No Document",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    fontWeight: FontWeight.w500,
                  ),
                ));
  }

  Widget receiverLayout(Message message,String messageid) {
    Radius messageRadius = Radius.circular(10);
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                widget.receiver.logo != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(widget.receiver.logo),
                        radius: SizeConfig.safeBlockHorizontal * 12,
                      )
                    : CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.png'),
                      ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.receiver.name,
                  style: GoogleFonts.montserrat(
                    color: Color(0xff008A91),
                    fontSize: SizeConfig.safeBlockHorizontal * 10,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.safeBlockHorizontal * 12),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.65),
              decoration: BoxDecoration(
                color: Color(0xffA0DDE0),
                borderRadius: BorderRadius.only(
                  bottomLeft: messageRadius,
                  topRight: messageRadius,
                  bottomRight: messageRadius,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
                child: getMessage(message,messageid),
              ),
            ),
            Text(
              _ago(message.timestamp.millisecondsSinceEpoch),
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 10,
                fontWeight: FontWeight.w500,
                color: Color(0xff828282),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget chatControls() {
    setWritingTo(bool val) {
      setState(() {
        isWriting = val;
      });
    }

    addMediaModal(context) {
      showModalBottomSheet(
          context: context,
          elevation: 0,
          backgroundColor: Colors.white,
          builder: (context) {
            return Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * 15),
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        onPressed: () => Navigator.maybePop(context),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Content and tools",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.safeBlockHorizontal * 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      ModalTile(
                        title: "Media",
                        subtitle: "Share Photos and Video",
                        icon: Icons.image,
                        onTap: () {
                          pickImage(source: ImageSource.gallery);
                        },
                      ),
                      ModalTile(
                        title: "File",
                        subtitle: "Share files",
                        icon: (Icons.tab),
                        
                        onTap: () {
                          documentImage(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
    }

    sendMessage() {
      var text = textFieldController.text;

      Message _message = Message(
        receiverId: widget.receiver.uid,
        senderId: sender.uid,
        message: text,
        timestamp: Timestamp.now(),
        type: 'text',
      );
      List deviceToken = List();
      deviceToken.add(widget.receiver.deviceToken);
      print(sender.uid);
      PushNotification().postNotification(
          title: "New Chat",
          uid: sender.uid,
          token: deviceToken,
          notification_body: "${sender.companyName}- $text",
          screen: "chat");

      setState(() {
        isWriting = false;
      });

      textFieldController.text = "";

      _chatMethods.addMessageToDb(_message, sender.user, widget.receiver);
    }

    return Container(
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
              decoration: BoxDecoration(
                color: Color(0xffE0E0E0),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.camera_alt),
                color: Color(0xff828282),
                iconSize: SizeConfig.safeBlockHorizontal * 34,
                onPressed: () => pickImage(source: ImageSource.camera),
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockVertical * 5,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  controller: textFieldController,
                  focusNode: textFieldFocus,
                  onTap: () {},
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                  onChanged: (val) {
                    (val.length > 0 && val.trim() != "")
                        ? setWritingTo(true)
                        : setWritingTo(false);
                  },
                  decoration: InputDecoration(
                    hintText: "Chat",
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color(0xff545454),
                        fontSize: SizeConfig.safeBlockHorizontal * 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(17.0),
                        ),
                        borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 20,
                        vertical: SizeConfig.safeBlockVertical * 5),
                    filled: true,
                    fillColor: Color(0xffE0E0E0),
                  ),
                ),
              ],
            ),
          ),
          
          isWriting
              ? Container()
              : GestureDetector(
                  child: Icon(
                    Icons.add,
                    color: Color(0xff828282),
                  ),
                  onTap: () => addMediaModal(context),
                ),
          isWriting
              ? Container(
                  margin:
                      EdgeInsets.only(left: SizeConfig.safeBlockVertical * 10),
                  decoration: BoxDecoration(
                      color: Color(0xff1990A8), shape: BoxShape.circle),
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: SizeConfig.safeBlockHorizontal * 25,
                    ),
                    onPressed: () => sendMessage(),
                  ))
              : Container()
        ],
      ),
    );
  }

  void pickImage({@required ImageSource source}) async {
    File selectedImage = await Utils.pickImage(source: source);
    _storageMethods.uploadImage(
        image: selectedImage,
        receiverId: widget.receiver.uid,
        senderId: sender.uid,
        imageUploadProvider: _imageUploadProvider);
  }

  void documentImage(BuildContext context) async {
    File selectedFile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    String fileName = p.basename(selectedFile.path);
    setState(() {
      fileName = p.basename(selectedFile.path);
    });
    _storageMethods.uploadDocument(
        document: selectedFile,
        filename: fileName,
        receiverId: widget.receiver.uid,
        senderId: sender.uid,
        documentUploadProvider: _documentUploadProvider);
  }
}

class ModalTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function onTap;

  const ModalTile({
    @required this.title,
    @required this.subtitle,
    @required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 15),
      child: CustomTile(
        mini: false,
        onTap: onTap,
        leading: Container(
          margin: EdgeInsets.only(right: SizeConfig.safeBlockVertical * 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:Colors.blueGrey[200],
          ),
          padding: EdgeInsets.all(10),
          child: Icon(
            icon,
            color: Colors.blue[300],
            size: SizeConfig.safeBlockHorizontal * 38,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.safeBlockHorizontal * 14,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: SizeConfig.safeBlockHorizontal * 18,
          ),
        ),
      ),
    );
  }
}
