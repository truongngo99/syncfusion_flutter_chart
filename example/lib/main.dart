// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// void main() {
//   return runApp(_ChartApp());
// }

// class _ChartApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: _MyHomePage(),
//     );
//   }
// }

// class _MyHomePage extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   _MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<_MyHomePage> {
//   ChartSeriesController? seriesController;
//   late bool isLoadMoreView, isNeedToUpdateView, isDataUpdated;

//   double? oldAxisVisibleMin, oldAxisVisibleMax;
//   // late GlobalKey<State> globalKey;

//   void _initializeVariables() {
//     isLoadMoreView = false;
//     isNeedToUpdateView = false;
//     isDataUpdated = true;
//     // globalKey = GlobalKey<State>();
//   }

//   @override
//   initState() {
//     super.initState();
//     _initializeVariables();
//   }

//   var alert_threshold = 0;
//   List<ChartModel> listChart = [
//     ChartModel(0, 1647405020),
//     ChartModel(1, 1647405080),
//     ChartModel(1, 1647405150),
//     ChartModel(0, 1647405220),
//     ChartModel(0, 1647405220),
//     ChartModel(0, 1647405220),
//     ChartModel(1, 1647405220),
//     ChartModel(0, 1647405620),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Syncfusion Flutter chart'),
//         ),
//         body: Column(children: [
//           //Initialize the chart widget
//           SfCartesianChart(
//             // key: GlobalKey<State>(),
//             onActualRangeChanged: (args) async {
//               if (args.orientation == AxisOrientation.horizontal) {
//                 if (isLoadMoreView) {
//                   args.visibleMin = oldAxisVisibleMin;
//                   args.visibleMax = oldAxisVisibleMax;
//                 }
//                 oldAxisVisibleMin = args.visibleMin as double;
//                 oldAxisVisibleMax = args.visibleMax as double;
//               }
//               print(oldAxisVisibleMax);
//               print('object: ${listChart[listChart.length - 1].timestamp}');
//               // if (oldAxisVisibleMax ==
//               //     listChart[listChart.length - 1].timestamp) {
//               //   print('bang nhau');
//               //   // await ref
//               //   //     .read(shipDetailQuerryProvider.notifier)
//               //   //     .checkScrollChart(true);
//               // } else {
//               //   // await ref
//               //   //     .read(shipDetailQuerryProvider.notifier)
//               //   //     .checkScrollChart(false);
//               //   print('khong bang');
//               // }

//               isLoadMoreView = false;
//             },
//             zoomPanBehavior: ZoomPanBehavior(
//               enablePanning: true,
//             ),
//             loadMoreIndicatorBuilder:
//                 (BuildContext context, ChartSwipeDirection direction) =>
//                     getloadMoreIndicatorBuilder(context, direction, listChart,
//                         state.seriesDto, oldAxisVisibleMin!),
//             plotAreaBorderWidth: 0,
//             borderWidth: 0,
//             plotAreaBorderColor: Colors.transparent,
//             primaryXAxis: NumericAxis(
//                 name: 'XAxis',
//                 interval: 2,
//                 isVisible: false,
//                 enableAutoIntervalOnZooming: false,
//                 edgeLabelPlacement: EdgeLabelPlacement.shift,
//                 majorGridLines: const MajorGridLines(width: 0),
//                 axisLabelFormatter: (AxisLabelRenderDetails details) {
//                   return ChartAxisLabel(details.text.split('.')[0], null);
//                 }),
//             primaryYAxis: NumericAxis(
//                 // interval: interval == 0 ? 1 : interval,
//                 // labelFormat: '{value}${state.unit}',
//                 axisLine: AxisLine(width: 0),
//                 majorTickLines: MajorTickLines(size: 0),
//                 // visibleMinimum: 0,
//                 // minimum: interval == 0
//                 //     ? minimum - 2
//                 //     : minimum - interval,
//                 // maximum: interval == 0
//                 //     ? maximum + 2
//                 //     : maximum + interval,
//                 labelPosition: ChartDataLabelPosition.inside,
//                 labelAlignment: LabelAlignment.end,
//                 // labelStyle: textTheme.subtitle1!
//                 //     .copyWith(fontWeight: FontWeight.bold),
//                 axisLabelFormatter: (AxisLabelRenderDetails details) {
//                   return ChartAxisLabel(details.text, null);
//                 }),
//             trackballBehavior: TrackballBehavior(
//               activationMode: ActivationMode.singleTap,
//               enable: true,
//               tooltipSettings: InteractiveTooltip(
//                 enable: false,
//               ),
//               lineType: TrackballLineType.none,
//               lineColor: Colors.white,
//               markerSettings: TrackballMarkerSettings(
//                 markerVisibility: TrackballVisibilityMode.visible,
//                 width: 15,
//                 height: 15,
//                 shape: DataMarkerType.circle,
//                 borderWidth: 0,
//                 color: Colors.red,
//               ),
//             ),
//             tooltipBehavior: TooltipBehavior(
//                 tooltipPosition: TooltipPosition.pointer,
//                 canShowMarker: false,
//                 shadowColor: Colors.black,
//                 opacity: 0,
//                 elevation: 0.3,
//                 enable: true,
//                 builder: (dynamic data, dynamic point, dynamic series,
//                     int pointIndex, int seriesIndex) {
//                   DateTime timeChart;

//                   timeChart = DateTime.fromMillisecondsSinceEpoch(
//                       ((data as ChartModel).timestamp * 1000).toInt());

//                   return SizedBox(
//                     height: 90,
//                     width: 155,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(
//                               color: Colors.white,
//                               width: 1,
//                             ),
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(16)),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 2,
//                                 offset: const Offset(0, 1),
//                               ),
//                             ],
//                           ),
//                           padding: const EdgeInsets.fromLTRB(8, 12, 12, 12),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'afsadfad',
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black.withOpacity(0.84)),
//                                   ),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   Text(
//                                     'aas',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black.withOpacity(0.4),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 4,
//                               ),
//                               Text(
//                                 'fasdas',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }),
//             onTooltipRender: (TooltipArgs args) => {},
//             series: <ChartSeries>[
//               SplineAreaSeries<ChartModel, num>(
//                   splineType: SplineType.natural,
//                   enableTooltip: true,
//                   dataSource: listChart,
//                   animationDuration: 0,
//                   xValueMapper: (ChartModel data, _) => data.timestamp,
//                   yValueMapper: (ChartModel data, _) => data.value,
//                   borderColor: Colors.red,
//                   borderWidth: 3,
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.red.withOpacity(0.2),
//                       Colors.red.withOpacity(0.04)
//                     ],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                   onRendererCreated: (controller) {
//                     seriesController = controller;
//                   }
//                   //splineType:
//                   ),
//             ],
//           )
//         ]));
//   }

//   List<int> getIndexes(int length, List<ChartModel> listChart) {
//     final List<int> indexes = <int>[];
//     for (int i = length - 1; i >= 0; i--) {
//       indexes.add(listChart.length - 1 - i);
//     }
//     return indexes;
//   }

//   void _updateData(
//     List<ChartModel> list,
//     SeriesDto seriesDto,
//     double indexOld,
//   ) {
//     double checkIndex = 0;

//     var lengthCurrent = seriesDto.timestamps.indexOf(indexOld);

//     if (lengthCurrent == -1) {
//       for (var item in seriesDto.timestamps.reversed) {
//         if (item.toInt() == indexOld.toInt()) {
//           checkIndex = item;
//         }
//       }

//       lengthCurrent = seriesDto.timestamps.indexOf(checkIndex);
//     }

//     if (lengthCurrent <= 50) {
//       for (int i = lengthCurrent - 1; i >= 0; i--) {
//         list.add(ChartModel(seriesDto.values[i], seriesDto.timestamps[i]));
//         isLoadMoreView = true;
//         seriesController?.updateDataSource(
//             addedDataIndexes: getIndexes((lengthCurrent - 1), list));
//       }
//     } else {
//       for (int i = lengthCurrent - 1; i > (lengthCurrent - 60); i--) {
//         list.add(ChartModel(seriesDto.values[i], seriesDto.timestamps[i]));
//       }

//       isLoadMoreView = true;
//       seriesController?.updateDataSource(
//           addedDataIndexes: getIndexes((59), list));
//     }
//   }

//   Future<void> _updateView(
//     List<ChartModel> listChart,
//     SeriesDto seriesDto,
//     double indexOld,
//   ) async {
//     await Future<void>.delayed(const Duration(seconds: 1), () {
//       isNeedToUpdateView = false;
//       if (isDataUpdated) {
//         _updateData(
//           listChart,
//           seriesDto,
//           indexOld,
//         );
//         isDataUpdated = false;
//       }
//       // if (globalKey.currentState != null) {
//       //   (globalKey.currentState as dynamic).setState(() {});
//       // }
//     });
//   }

//   Widget getloadMoreIndicatorBuilder(
//       BuildContext context,
//       ChartSwipeDirection direction,
//       List<ChartModel> listChart,
//       SeriesDto seriesDto,
//       double indexOld) {
//     if (direction == ChartSwipeDirection.start) {
//       isNeedToUpdateView = true;
//       // globalKey = GlobalKey<State>();
//       // if (isNeedToUpdateView) {
//       //   // ref.read(shipDetailQuerryProvider.notifier).checkScrollChart(true);
//       //   scrollChart = false;
//       // }
//       // double indexLastest = seriesDto.timestamps.last;
//       // print('INDEXOF: $indexOld');
//       // print('INDEXLATEST: $indexLastest');
//       // if (indexLastest == indexOld) {
//       //   scrollChart = true;
//       // }

//       return FutureBuilder(
//           // key: globalKey,
//           builder: (BuildContext context, snap) {
//         Widget widget;
//         if (isNeedToUpdateView) {
//           widget = const SizedBox();
//           _updateView(listChart, seriesDto, indexOld);
//           isDataUpdated = true;
//         } else {
//           widget = const SizedBox();
//         }
//         return widget;
//       });
//     } else {
//       return SizedBox.fromSize(size: Size.zero);
//     }
//   }
// }

// class ChartModel {
//   final num value;
//   final double timestamp;
//   ChartModel(
//     this.value,
//     this.timestamp,
//   );
// }
