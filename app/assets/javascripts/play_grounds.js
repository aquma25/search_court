// ex) http://localhost:3000
const url = location.protocol + '//' +  location.hostname + ':' +  location.port

// ShowMapボタン押下でMap上に該当プレイグラウンドのマーカーを追加していく
function dispMarker(lat, lng, id, indx_num, inout) {
  var courtPlace = document.getElementById(inout + "court_" + indx_num).value;
  var showUrl = "</br><a href=" + url + "/play_grounds/" + id + ">" + "詳細を表示" + "</a>"
  court_name.innerHTML = courtPlace;
  latlng = { lat: lat, lng: lng }

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

// 現在いるプレイヤー欄に
function AddPlayingMember(court_id){
  if(!confirm("今いるプレイヤーとしてニックネームを登録しますか？")){
    return;
  }

  onSuccess = function(data) {
    if (data.wording){
      alert(data.wording)
    } else {
      window.location.reload();
    }
  };
  onError = function(data){
    if (data.status == 404){
      alert(e)
    }
  };

  $.ajax({
    type: "POST",
    url: url + "/play_grounds/playing_users",
    data: {
      authenticity_token: $("head meta[name=csrf-token]").attr("content"),
      court_id: court_id
    }
  }).then(onSuccess, onError)
};