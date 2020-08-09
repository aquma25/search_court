
// modal表示・非表示に関しての処理の共通化
function clickModalEvent(targetModal, changeDispStatus){
  var Modal = document.getElementById(targetModal);

  window.addEventListener('click', function() {
    Modal.style.display = changeDispStatus;
  })
}

// profile画像をクリックすると拡大された画像が表示される
function expansionUserImage(){
  clickModalEvent('user_image_modal', 'block')
}

// ✖︎ボタン押下でモーダルが消える
function modalCloseBtn(){
  clickModalEvent('user_image_modal', 'none')
}