import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../constant.dart';

class DocPatientMsg extends StatefulWidget {
  const DocPatientMsg({Key? key}) : super(key: key);

  @override
  State<DocPatientMsg> createState() => _DocPatientMsgState();
}

class _DocPatientMsgState extends State<DocPatientMsg> {
  bool _isTyping = false;
  final List<String> messages = []; // List to store chat messages
  final TextEditingController _textController = TextEditingController();
  late FlutterSoundRecorder _recorder;
  AudioPlayer? _audioPlayer; // Nullable AudioPlayer field
  late String _recordPath;
  bool _isRecording = false;


  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _initRecorder();
  }

  void _initRecorder() async {
    _recorder = FlutterSoundRecorder();
    await _recorder.openAudioSession();
    _audioPlayer = AudioPlayer(); // Initialize AudioPlayer
  }

  void _startRecording() async {
    final appDir = await getApplicationDocumentsDirectory();
    _recordPath = '${appDir.path}/recording.aac';

    try {
      await _recorder.startRecorder(toFile: _recordPath, codec: Codec.aacADTS);
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      print('Failed to start recording: $e');
    }
  }


  void _stopRecording() async {
    try {
      String? result = await _recorder.stopRecorder();
      setState(() {
        _isRecording = false;
      });
      if (result != null) {
        _addVoiceNoteMessage(result);
      }
    } catch (e) {
      print('Failed to stop recording: $e');
    }
  }


  void _addVoiceNoteMessage(String path) {
    setState(() {
      messages.add(path);
    });
  }

  void _playVoiceNote(String filePath) async {
    try {
      await _audioPlayer?.stop(); // Stop any currently playing audio
      await _audioPlayer?.play(filePath, isLocal: true);
    } catch (e) {
      print('Failed to play voice note: $e');
    }
  }

  void _stopPlaying() async {
    try {
      await _audioPlayer?.stop();
    } catch (e) {
      print('Failed to stop playing: $e');
    }
  }


  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      messages.add(text);
      _isTyping = false;
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          if (_isTyping) ...[
            SizedBox(width: 8.0),
            GestureDetector(
              onTap: () {
                _handleSubmitted(_textController.text);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  size: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: TextField(
                  onTap: (){
                    setState(() {
                      _isTyping = true;
                    });
                  },
                  controller: _textController,
                  onChanged: (text) {
                    setState(() {
                      _isTyping = text.isNotEmpty;
                    });
                  },
                  onSubmitted: _handleSubmitted,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration.collapsed(
                    hintText: 'أرسل رسالة',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    hintTextDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),
          if (!_isTyping) ...[
            GestureDetector(
              onTapDown: (_) => _startRecording(),
              onTapUp: (_) => _stopRecording(),
              onTapCancel: () => _stopRecording(),
              child: Container(
                decoration: BoxDecoration(
                  color: _isRecording ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  _isRecording ? Icons.stop : Icons.mic,
                  size: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 8.0),
          ],
        ],
      ),
    );
  }

  Widget _buildMessageWidget(String message) {
    final DateTime messageTime = DateTime.now(); // Replace this with the actual message time

    final String formattedTime =
        '${messageTime.hour}:${messageTime.minute} ${messageTime.hour >= 12 ? 'PM' : 'AM'}';

    if (message.endsWith('.aac')) {
      return GestureDetector(
        onTap: () => _playVoiceNote(message),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_arrow, color: white),
                      SizedBox(width: 4.0),
                      Text("رسالة صوتية", style: TextStyle(color: white),),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    formattedTime,
                    style: TextStyle(fontSize: 12.0),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 4.0),
                Text(
                  formattedTime,
                  style: TextStyle(fontSize: 12.0),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _recorder.closeAudioSession();
    _audioPlayer?.dispose(); // Dispose AudioPlayer if not null
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false,
              padding: EdgeInsets.all(8.0),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildMessageWidget(messages[index]);
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}