// ex) http://localhost:3000
const url = location.protocol + '//' +  location.hostname + ':' +  location.port

// 初期のMap表示の設定
function initMap(){
  $.ajax({
    type: 'POST',
    url: url + '/play_grounds/init_map',
    data: {
      authenticity_token: $("head meta[name=csrf-token]").attr("content")
    },
    success: function(data) {
      init_latlng = {
        lat: data.play_grounds[0].latitude,
        lng: data.play_grounds[0].longitude
      }
      map = new google.maps.Map(document.getElementById('map'), {
        center: init_latlng,
        zoom: 10
      });

      // 複数のコート情報を取得していく
      for (const ground of data.play_grounds) {
        latlng = {
          lat: ground.latitude,
          lng: ground.longitude
        }

        markerLatLng = new google.maps.LatLng(latlng);
        myMarker = new google.maps.Marker({
          position: markerLatLng,
          map: map
        });

        var showUrl = "</br><a href=" + url + "/play_grounds/" + ground.id + ">" + "詳細を表示" + "</a>"
        dispCommentInMarker(ground.court_name + showUrl, myMarker)
      }
    },
    error: function() {
      //取得失敗時に実行する処理
      console.log("何らかの理由で失敗しました");
    }
  });
}

// マーカーをクリックして吹き出しを表示出来るようにする
function dispCommentInMarker(comment, myMarker) {
  var myInfoWindow = new google.maps.InfoWindow({
    content: comment
  });
  google.maps.event.addListener(myMarker, "click", function() {
    myInfoWindow.open(map, myMarker);
    google.maps.event.addListenerOnce(myInfoWindow, "closeclick", function(event) {
      myInfoWindow.close(map, myMarker);
    });
  });
}

// ShowMapボタン押下でMap上に該当プレイグラウンドのマーカーを追加していく
function dispMarker(lat, lng, id, indx_num, inout) {
  var courtPlace = document.getElementById(inout + "court_" + indx_num).value;
  var showUrl = "</br><a href=" + url + "/play_grounds/" + id + ">" + "詳細を表示" + "</a>"
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

  openCommentInMarker(court_name.innerHTML + showUrl, myMarker)
  scrollTo(0, 0);
}

// マーカーに吹き出しを表示出来るようにする
function openCommentInMarker(comment, myMarker) {
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