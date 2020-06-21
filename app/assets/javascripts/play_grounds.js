let map
let geocoder

function initMap(){
  // geocoderを初期化
  geocoder = new google.maps.Geocoder()

  // 初期のプレイグラウンド名を表示
  var court_name = document.getElementById("court_name")
  court_name.innerHTML = "代々木公園バスケットコート";

  init_latlng = {
    lat: 35.6673, lng: 139.695
  }

  show_the_marker(court_name, init_latlng)
}

function show_the_marker(court_name, init_latlng) {
  // 地図を表示する際のオプションを設定
  var mapOptions = {
    center: new google.maps.LatLng(init_latlng.lat, init_latlng.lng),
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  // Mapオブジェクトに地図表示要素情報とオプション情報を渡し、Mapとマーカーを表示
  map = new google.maps.Map(document.getElementById("map"), mapOptions);
  myMarker = new google.maps.Marker({ position: init_latlng, map: map });
  comment_in_marker(court_name.innerHTML, myMarker)
}

// マーカーに吹き出しを表示出来るようにする
function comment_in_marker(comment, myMarker) {
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
function disp_marker(lat, lng, id, indx_num, inout, env) {
  var court_place = document.getElementById(inout + "court_" + indx_num).value;

  if (env == "development"){
    var path = "localhost:3000"
  } else if (env == "production"){
    var path = "18.177.66.221"
  }
  var show_url = "</br><a href=" + "http://" + path + "/play_grounds/" + id + ">" + "詳細を表示する" + "</a>"

  court_name.innerHTML = court_place;
  myMarker = new google.maps.Marker({
    position: { lat: lat, lng: lng }, // マーカーを立てる位置を指定
    map: map // マーカーを立てる地図を指定
  });
  map.setCenter(new google.maps.LatLng(lat, lng));

  comment_in_marker(court_name.innerHTML + show_url, myMarker)
}