import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_chart/charts.dart';
import 'package:syncfusion_flutter_chart/sparkcharts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<ChartModel> listChart = [
    ChartModel(0, 1647405020),
    ChartModel(1, 1647405080),
    ChartModel(1, 1647405150),
    ChartModel(0, 1647405220),
    ChartModel(0, 1647405220),
    ChartModel(0, 1647405220),
    ChartModel(1, 1647405220),
    ChartModel(0, 1647405620),
  ];
  @override
  Widget build(BuildContext context) {
    var alert_threshold = 0;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
            key: GlobalKey<State>(),
            // onActualRangeChanged: (args) {
            //   if (args.orientation ==
            //       AxisOrientation.horizontal) {
            //     if (isLoadMoreView) {
            //       args.visibleMin = oldAxisVisibleMin;
            //       args.visibleMax = oldAxisVisibleMax;
            //     }
            //     oldAxisVisibleMin = args.visibleMin as double;
            //     oldAxisVisibleMax = args.visibleMax as double;
            //   }

            //   isLoadMoreView = false;
            // },
            // zoomPanBehavior: ZoomPanBehavior(
            //   enablePanning: true,
            // ),
            // loadMoreIndicatorBuilder: (BuildContext context,
            //         ChartSwipeDirection direction) =>
            //     getloadMoreIndicatorBuilder(
            //         context,
            //         direction,
            //         listChart,
            //         state.seriesDto,
            //         oldAxisVisibleMin!),
            plotAreaBorderWidth: 0,
            borderWidth: 0,
            plotAreaBorderColor: Colors.transparent,
            primaryXAxis: CategoryAxis(
              isVisible: false,
            ),
            primaryYAxis: NumericAxis(
              interval: 1,
              axisLine: AxisLine(width: 0),
              majorTickLines: MajorTickLines(size: 0),
              visibleMinimum: -1,
              maximum: 5,
              labelPosition: ChartDataLabelPosition.inside,
              labelAlignment: LabelAlignment.end,
              // labelStyle: textTheme.subtitle1!
              //     .copyWith(fontWeight: FontWeight.bold),
              labelBool0: alert_threshold == '0' ? 'danger' : 'normal',
              labelBool1: alert_threshold == '0' ? 'normal' : 'danger',
              isBoolChart: true,
            ),
            trackballBehavior: TrackballBehavior(
              activationMode: ActivationMode.singleTap,
              enable: true,
              tooltipSettings: InteractiveTooltip(
                enable: false,
              ),
              lineType: TrackballLineType.none,
              lineColor: Colors.white,
              markerSettings: TrackballMarkerSettings(
                markerVisibility: TrackballVisibilityMode.visible,
                width: 15,
                height: 15,
                shape: DataMarkerType.circle,
                borderWidth: 0,
              ),
            ),
            tooltipBehavior: TooltipBehavior(
                enable: true,
                tooltipPosition: TooltipPosition.pointer,
                canShowMarker: false,
                shadowColor: Colors.black,
                opacity: 0,
                elevation: 0.3,
                builder: (dynamic data, dynamic point, dynamic series,
                    int pointIndex, int seriesIndex) {
                  DateTime timeChart;

                  timeChart = DateTime.fromMillisecondsSinceEpoch(
                      ((data as ChartModel).timestamp * 1000).toInt());

                  return SizedBox(
                    height: 90,
                    width: 155,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(8, 12, 12, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'wwww',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.84)),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '123123',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                data.value == 0 ? 'normal' : 'danger',
                                // style: textTheme.headline4!
                                //     .copyWith(color: color),x
                              ),
                            ],
                          ),
                        ),
                        // ClipPath(
                        //   clipBehavior: Clip.hardEdge,
                        //   clipper: const TriangleClipper(),
                        //   child: Container(
                        //     height: 8,
                        //     width: 14,
                        //     color: colorWhite,
                        //   ),
                        // ),
                      ],
                    ),
                  );
                }),
            onTooltipRender: (TooltipArgs args) => {},
            series: <ChartSeries>[
              SplineAreaSeries<ChartModel, DateTime>(
                splineType: SplineType.natural,
                enableTooltip: true,
                dataSource: listChart,
                animationDuration: 0,
                xValueMapper: (ChartModel data, _) =>
                    DateTime.fromMillisecondsSinceEpoch(
                        (data.timestamp).toInt()),
                yValueMapper: (ChartModel data, _) => data.value,
                borderColor: Colors.red,
                borderWidth: 3,
                gradient: LinearGradient(colors: [
                  Colors.red.withOpacity(0.2),
                  Colors.red.withOpacity(0.04)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),

                //splineType:
              )
            ],
          )
        ]));
  }
}

class ChartModel {
  final num value;
  final double timestamp;
  ChartModel(
    this.value,
    this.timestamp,
  );
}
