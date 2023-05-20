import 'package:ai_writing/utils/config_packages.dart';

class HomeCardWidget extends StatelessWidget {
  HomeCardWidget({Key? key, required this.dataList, required this.index}) : super(key: key);
  final ListElement dataList;
  int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(AppDimen.dimen10),
          padding: EdgeInsets.all(AppDimen.dimen10),
          decoration: AppDecoration.cardDecoration(),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(dataList.images!),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${AppString.id}: ${index + 1}', style: Theme.of(context).textTheme.bodyText2),
                        // Text(AppFunctions.timestampToDateTime(dataList.time.toString()), style: commonText10600),
                      ],
                    ),
                    SizedBox(height: AppDimen.dimen4),
                    Text('${AppString.name}: ${dataList.name}', style: Theme.of(context).textTheme.bodyText2),
                    SizedBox(height: AppDimen.dimen4),
                    Text('${AppString.desc}: ${dataList.lastmsg}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyText2),
                  ],
                ),
              ),
            ],
          ),
        ),
        Visibility(
            visible: dataList.status == 1,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: AppDimen.dimen30,
                width: AppDimen.dimen30,
                decoration: AppDecoration.notiCountDecoration(),
                child: Center(child: Text(dataList.noticount.toString(), style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: AppDimen.dimen12))),
              ),
            ))
      ],
    );
  }
}
