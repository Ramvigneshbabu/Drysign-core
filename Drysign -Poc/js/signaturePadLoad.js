

var signaturePad;
$( document ).ready(function() {
	
signaturePad= new SignaturePad(document.getElementById('signaturepad'), {
    backgroundColor: 'rgba(255, 255, 255, 0)',
    penColor: 'rgb(0, 0, 0)'
  });
  var saveButton = document.getElementById('saveSignaturepad');
  var cancelButton = document.getElementById('clearSignaturepad');

  saveButton.addEventListener('click', function (event) {
	  var data = signaturePad.toDataURL('image/png');
    saveSignaturetodb();

  // Send data to server instead...
    //window.open(data);
  });

  cancelButton.addEventListener('click', function (event) {
    signaturePad.clear();
  });

});