import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/widgets/custom_icon_buttom.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  List<Widget> imageList = [];
  int currentPage = 0;
  int? lastpage;


  handleScrollEvent(ScrollNotification scroll) {
    if(scroll.metrics.pixels / scroll.metrics.maxScrollExtent <= .33) return;
    if(currentPage == lastpage) return;
    fetchAllImage();
  }

  @override
  void initState() {
    fetchAllImage();
    super.initState();
  }

  fetchAllImage() async {
    lastpage = currentPage;
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      return PhotoManager.openSetting();
    }
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );
    List<AssetEntity> photos = await albums[0].getAssetListPaged(
      page: currentPage,
      size: 10,
    );
    List<Widget> temp = [];

    for (var asset in photos) {
      temp.add(FutureBuilder(
        future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
        builder: (contex, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                onTap: () => Navigator.pop(context, snapshot.data),
                borderRadius: BorderRadius.circular(5),
                splashFactory: NoSplash.splashFactory,
                child: Container(
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.theme.greyColor!.withOpacity(0.6),
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: MemoryImage(snapshot.data as Uint8List),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ));
    }

    setState(() {
      imageList.addAll(temp);
      ++currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 2,
        leading: CustomIconButton(
          onTap: () => Navigator.of(context).pop(),
          icon: Icons.keyboard_return_rounded,
        ),
        title: Text(
          'Whatsapp Lerob',
          style: TextStyle(
            color: context.theme.authAppbarTextColor,
          ),
        ),
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert_outlined,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scroll) {
            handleScrollEvent(scroll);
            return true;
          },
          child: GridView.builder(
            itemCount: imageList.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (_, index) {
              return imageList[index];
            },
          ),
        ),
      ),
    );
  }
}
