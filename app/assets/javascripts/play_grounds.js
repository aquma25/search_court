// 初期のMap表示の設定
function initMap(){
  var rails_path = document.getElementById("rails_path").value;
  var play_grounds_json = document.getElementById("play_grounds_json").value;
  var grounds_array = JSON.parse(play_grounds_json);

  // 初期のプレイグラウンド名を複数表示
  var courtName = document.getElementById("court_name")
  courtName.innerHTML = grounds_array[0].court_name;

  // 初期の緯度、軽度の設定
  init_latlng = {
    lat: grounds_array[0].latitude,
    lng: grounds_array[0].longitude
  }

  var mapLatLng = new google.maps.LatLng(init_latlng);
  map = new google.maps.Map(document.getElementById('map'), {
    center: mapLatLng, // 地図の中心を指定
    zoom: 12 // 地図のズームを指定
  });

  // コート情報を取得していく
  for (const ground of grounds_array) {
    latlng = {
      lat: ground.latitude,
      lng: ground.longitude
    }

    markerLatLng = new google.maps.LatLng(latlng);
    myMarker = new google.maps.Marker({ // マーカーの追加
      position: markerLatLng, // マーカーを立てる位置を指定
      map: map // マーカーを立てる地図を指定
    });

    var showUrl = "</br><a href=" + "http://" + rails_path + "/play_grounds/" + ground.id + ">" + "詳細を表示する" + "</a>"
    commentInMarker(ground.court_name + showUrl, myMarker)
  }
}

// マーカーに吹き出しを表示出来るようにする
function commentInMarker(comment, myMarker) {
  var myInfoWindow = new google.maps.InfoWindow({
    content: comment // 吹き出しに出す文
  });
  myInfoWindow.open(map, myMarker);
  // 吹き出しが閉じられたら、マーカークリックで再び開くようにしておく
  google.maps.event.addListener(myInfoWindow, "closeclick", function() {
    google.maps.event.addListenerOnce(myMarker, "click", function(event) {
      myInfoWindow.open(map, myMarker);
    });
  });
}

// ShowMapボタン押下でMap上に該当プレイグラウンドのマーカーを追加していく
function dispMarker(lat, lng, id, indx_num, inout, path) {
  var courtPlace = document.getElementById(inout + "court_" + indx_num).value;
  var showUrl = "</br><a href=" + "http://" + path + "/play_grounds/" + id + ">" + "詳細を表示する" + "</a>"
  court_name.innerHTML = courtPlace;

  latlng = {
    lat: lat,
    lng: lng
  }

  map = new google.maps.Map(document.getElementById('map'), {
    center: latlng,
    zoom: 15
  });
  myMarker = new google.maps.Marker({
    position: latlng,
    map: map
  });
  map.setCenter(new google.maps.LatLng(latlng));

  commentInMarker(court_name.innerHTML + showUrl, myMarker)
}