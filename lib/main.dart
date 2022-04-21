import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view_gallery.dart';


void main() => runApp(MyApp());

int Index;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '瀏覽影像',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: Text('瀏覽影像'),
    );

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body:GridView.count(primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          FlatButton(
            child: Image.asset('assets/image_1.jpg'),
            onPressed: () {
              Index = 0;
              Navigator.push(context, MaterialPageRoute(builder: (context) => photoview()));
            },
          ),
          FlatButton(
            child: Image.asset('assets/image_2.jpg'),
            onPressed: () {
              Index = 1;
              Navigator.push(context, MaterialPageRoute(builder: (context) => photoview()));
            },
          ),
          FlatButton(
            child: Image.asset('assets/image_3.jpg'),
            onPressed: () {
              Index = 2;
              Navigator.push(context, MaterialPageRoute(builder: (context) => photoview()));
            },
          ),
          FlatButton(
            child: Image.asset('assets/image_4.jpg'),
            onPressed: () {
              Index = 3;
              Navigator.push(context, MaterialPageRoute(builder: (context) => photoview()));
            },
          ),
          FlatButton(
            child: Image.asset('assets/image_5.jpg'),
            onPressed: () {
              Index = 4;
              Navigator.push(context, MaterialPageRoute(builder: (context) => photoview()));
            },
          ),
          FlatButton(
            child: Image.asset('assets/image_6.jpg'),
            onPressed: () {
              Index = 5;
              Navigator.push(context, MaterialPageRoute(builder: (context) => photoview()));
            },
          ),
          FlatButton(
            child: Image.asset('assets/image_7.jpg'),
            onPressed: () {
              Index = 6;
              Navigator.push(context, MaterialPageRoute(builder: (context) => photoview()));
            },
          ),
          FlatButton(
            child: Image.asset('assets/image_8.jpg'),
            onPressed: () {
              Index = 7;
              Navigator.push(context, MaterialPageRoute(builder: (context) => photoview()));
            },
          ),
        ],
      )
    );

    return appHomePage;
  }
}

class photoview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    const images = <String>[
      'assets/image_1.jpg',
      'assets/image_2.jpg',
      'assets/image_3.jpg',
      'assets/image_4.jpg',
      'assets/image_5.jpg',
      'assets/image_6.jpg',
      'assets/image_7.jpg',
      'assets/image_8.jpg'
    ];

    var imgBrowser = _ImageBrowser(GlobalKey<_ImageBrowserState>(), images);

  // 建立App的操作畫面
    //final previousBtn = FlatButton(
      //child: Image.asset('assets/previous.png'),
      //onPressed: () {
        //imgBrowser.previousImage();
      //},
    //);

    //final nextBtn = FlatButton(
      //child: Image.asset('assets/next.png'),
      //onPressed: () {
        //imgBrowser.nextImage();
      //},
    //);

    final widget = Center(
      child: Stack(
        children: <Widget>[
          Container(
            child: imgBrowser,
          ),
          //Container(
            //child: Row(
              //children: <Widget>[previousBtn, nextBtn],
              //mainAxisAlignment: MainAxisAlignment.center,
            //),
            //margin: EdgeInsets.symmetric(vertical: 10),
          //),
        ],
        //alignment: Alignment.topCenter
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('瀏覽影像'),
      ),
      body: widget,
    );
  }
}
  // 結合AppBar和App操作畫面

class _ImageBrowser extends StatefulWidget {
  final GlobalKey<_ImageBrowserState> _key;
  List<String> _images;
  int _imageIndex;

  _ImageBrowser(this._key, this._images) : super(key: _key) {
    _imageIndex = Index;
  }

  @override
  State<StatefulWidget> createState() => _ImageBrowserState();

  //previousImage() => _key.currentState.previousImage();
  //nextImage() => _key.currentState.nextImage();
}

class _ImageBrowserState extends State<_ImageBrowser> {
  @override
  Widget build(BuildContext context) {
    var img =
      PhotoViewGallery.builder(
        scrollPhysics: BouncingScrollPhysics(), // 滑动到边界的交互 默认Android效果
        scrollDirection: Axis.horizontal,// 滑动方向 默认水平
        reverse: false,//是否逆转滑动的阅读顺序方向 默认false,true水平的话，图片从右向左滑动
        builder: _buildItem,// 图片构造器
        itemCount: widget._images.length,  // 图片数量

        enableRotation:false,//是否支持手势旋转图片

        onPageChanged: (index) {
        // 图片切换回调
          setState(() {
            widget._imageIndex = index;
          });
        },
      );
    //PhotoView(
        //imageProvider: AssetImage(widget._images[widget._imageIndex]),
        //minScale: PhotoViewComputedScale.contained * 0.6,
        //maxScale: PhotoViewComputedScale.covered,
        //enableRotation: false,
        //backgroundDecoration: BoxDecoration(
          //color: Colors.white,
        //));
    return img;
  }
  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions(
      // 图片加载器 支持本地、网络
      imageProvider: AssetImage(widget._images[widget._imageIndex]),
      // 最小展示 缩放最小值
      minScale: PhotoViewComputedScale.contained * 0.6,
      // 最大展示 缩放最大值
      maxScale: PhotoViewComputedScale.covered,

    );
  }
  //previousImage() {
    //widget._imageIndex = widget._imageIndex == 0
        //? widget._images.length - 1
        //: widget._imageIndex - 1;
    //setState(() {});
  //}

  //nextImage() {
    //widget._imageIndex = ++widget._imageIndex % widget._images.length;
    //setState(() {});
  //}
}
