
// profile画像をクリックすると拡大された画像が表示される
function expansion_user_image(){
  var userImageModal = document.getElementById('user_image_modal');

  window.addEventListener('click', function() {
    userImageModal.style.display = 'block';
  })
}

// ✖︎ボタン押下でモーダルが消える
function modal_close_btn(){
  var userImageModal = document.getElementById('user_image_modal');

  window.addEventListener('click', function() {
    userImageModal.style.display = 'none';
  })
}

// 画像の以外の部分をクリックすると消える処理
window.addEventListener('click', function(e) {
  var userImageModal = document.getElementById('user_image_modal');
  if (e.target == userImageModal) {
    userImageModal.style.display = 'none';
  }
});