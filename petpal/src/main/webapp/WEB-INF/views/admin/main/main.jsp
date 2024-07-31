<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.5.0/echarts.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
  // 페이지가 로드되면 실행되는 스크립트
  window.onload = function() {
    // 첫 번째 차트를 렌더링할 DOM 요소를 찾습니다.
    var chartDom1 = document.getElementById('chart1');
    var myChart1 = echarts.init(chartDom1);

    // 첫 번째 및 두 번째 차트를 위한 ECharts 옵션 설정
    var option1 = {
      title: {
        text: '강아지 카테고리 판매율',
        left: 'center'
      },
      tooltip: {
        trigger: 'item'
      },
      legend: {
        top: '5%',
        left: 'center'
      },
      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          label: {
            show: false,
            position: 'center'
          },
          emphasis: {
            label: {
              show: true,
              fontSize: 40,
              fontWeight: 'bold'
            }
          },
          labelLine: {
            show: false
          },
          data: [
            { value: 36, name: '사료' },
            { value: 28, name: '간식' },
            { value: 17, name: '목욕용품' },
            { value: 13, name: '케어용품' },
            { value: 10, name: '건강관리' },
            { value: 10, name: '위생/배변' },
            { value: 7, name: '장난감' },
            { value: 6, name: '산책/이동장' },
            { value: 5, name: '하우스/스탭' },
            { value: 2, name: '급식기/급수기' }
          ]
        }
      ]
    };

    // 설정'된 옵션을 사용하여 첫 번째 차트를 표시합니다.
    myChart1.setOption(option1);

    // 두 번째 차트를 렌더링할 DOM 요소를 찾습니다.
    var chartDom2 = document.getElementById('chart2');
    var myChart2 = echarts.init(chartDom2);

    // 두 번째 차트를 위한 ECharts 옵션 설정
    var option2 = {
      title: {
        text: '고양이 카테고리 판매율',
        left: 'center'
      },
      tooltip: {
        trigger: 'item'
      },
      legend: {
        top: '5%',
        left: 'center'
      },
      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          label: {
            show: false,
            position: 'center'
          },
          emphasis: {
            label: {
              show: true,
              fontSize: 40,
              fontWeight: 'bold'
            }
          },
          labelLine: {
            show: false
          },
          data: [
            { value: 121, name: '사료' },
            { value: 76, name: '간식' },
            { value: 50, name: '건강관리' },
            { value: 43, name: '모래' },
            { value: 41, name: '화장실/위생' },
            { value: 77, name: '목욕/케어' },
            { value: 54, name: '급식기/급수기' },
            { value: 12, name: '스크래처/캣타워' },
            { value: 15, name: '하우스/리빙' },
            { value: 17, name: '이동장/유모차' },
            { value: 33, name: '장난감' }
          ]
        }
      ]
    };

    // 설정된 옵션을 사용하여 두 번째 차트를 표시합니다.
    myChart2.setOption(option2);

    // 세 번째 차트를 렌더링할 DOM 요소를 찾습니다.
    var chartDom3 = document.getElementById('chart3');
    var myChart3 = echarts.init(chartDom3);

    // 세 번째 ECharts 옵션 설정
    var colors = ['#5470C6', '#EE6666'];
    var option3 = {
      title: {
        text: '월간 판매율',
        left: 'center',
        top: 30 // 제목의 위치를 30px 위로 조정
      },
      color: colors,
      tooltip: {
        trigger: 'none',
        axisPointer: {
          type: 'cross'
        }
      },
      legend: {},
      grid: {
        top: 100, // 그리드의 상단 위치를 아래로 조정
        bottom: 50
      },
      xAxis: [
        {
          type: 'category',
          axisTick: {
            alignWithLabel: true
          },
          axisLine: {
            onZero: false,
            lineStyle: {
              color: colors[1]
            }
          },
          axisPointer: {
            label: {
              formatter: function (params) {
                return (
                  'Precipitation  ' +
                  params.value +
                  (params.seriesData.length ? '：' + params.seriesData[0].data : '')
                );
              }
            }
          },
          data: ['2024-1', '2024-2', '2024-3', '2024-4', '2024-5', '2024-6', '2024-7', '2024-8', '2024-9', '2024-10', '2024-11', '2024-12']
        },
        {
          type: 'category',
          axisTick: {
            alignWithLabel: true
          },
          axisLine: {
            onZero: false,
            lineStyle: {
              color: colors[0]
            }
          },
          axisPointer: {
            label: {
              formatter: function (params) {
                return (
                  'Precipitation  ' +
                  params.value +
                  (params.seriesData.length ? '：' + params.seriesData[0].data : '')
                );
              }
            }
          },
          data: ['2024-1', '2024-2', '2024-3', '2024-4', '2024-5', '2024-6', '2024-7', '2024-8', '2024-9', '2024-10', '2024-11', '2024-12']
        }
      ],
      yAxis: [
        {
          type: 'value'
        }
      ],
      series: [
        {
          name: '강아지',
          type: 'line',
          xAxisIndex: 1,
          smooth: true,
          emphasis: {
            focus: 'series'
          },
          data: [
            52.6, 57.9, 61.0, 126.4, 98.7, 50.7, 123.6, 13.2, 0, 0, 0, 0
          ]
        },
        {
          name: '고양이',
          type: 'line',
          smooth: true,
          emphasis: {
            focus: 'series'
          },
          data: [
            53.9, 23.9, 111.1, 182.7, 68.3, 88.2, 170.6, 13.6, 0, 0, 0, 0
          ]
        }
      ]
    };

    // 설정된 옵션을 사용하여 세 번째 차트를 표시합니다.
    myChart3.setOption(option3);
  };
</script>
<div class="body-title">
			<h3><i class="fa-solid fa-money-bill-1-wave"></i> PETPAL 매출 현황 </h3>
		</div>
<div class="body-container">
		
  <div class="body-main">
    <!-- 첫 번째 ECharts 차트를 렌더링할 div 요소 -->
    <div id="chart1" style="width: 45%; height: 500px; display: inline-block;"></div>
    <!-- 두 번째 ECharts 차트를 렌더링할 div 요소 -->
    <div id="chart2" style="width: 45%; height: 500px; display: inline-block; margin-left: 5%;"></div>
    <hr>
    <!-- 세 번째 ECharts 차트를 렌더링할 div 요소 -->
    <div id="chart3" style="width: 90%; height: 500px; margin-top: 20px;"></div>
  </div>
</div>
