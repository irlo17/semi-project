type = "text/javascript";
src =
  "//dapi.kakao.com/v2/maps/sdk.js?appkey=ef81fd1e646b0a15481c65c77c4029e6&libraries=services";

var mapContainer = document.getElementById("map");
mapOption = {
  center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
  level: 5, // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption);

var geocoder = new daum.maps.services.Geocoder();

//여기엔 주소가
var listData = [
  "서울특별시 강남구 일원동 광평로 10길 15",
  "경기도 성남시 중원구 금광동 ",
];

//여기엔 가게명이 들어가야함
var listShop = ["집", "오벤또"];

listData.forEach(function (addr, index) {
  geocoder.addressSearch(addr, function (result, status) {
    if (status === daum.maps.services.Status.OK) {
      var coords = new daum.maps.LatLng(result[0].y, result[0].x);

      var marker = new daum.maps.Marker({
        map: map,
        position: coords,
      });
      var infowindow = new daum.maps.InfoWindow({
        content:
          '<div style="width:150px;text-align:center;padding:6px 0;">' +
          listShop[index] +
          "</div>",
        disableAutoPan: true,
      });
      infowindow.open(map, marker);

      map.setCenter(coords);
    }
  });
});
