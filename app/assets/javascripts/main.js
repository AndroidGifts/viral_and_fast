window.fbAsyncInit = function() {
	FB.init({
		appId      : '461668747344455',
		xfbml      : true,
		version    : 'v2.5'
	});
};

(function(d, s, id){
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {return;}
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

$(document).ready(function () {
	$('#wysiwyg').froalaEditor({
		heightMin: 300
	}).on('froalaEditor.contentChanged', function (e, editor) {
      $('#preview').html(editor.html.get());
    }).froalaEditor('html.get');
});

$( document ).ready(function(){
	$(".button-collapse").sideNav();
	$('.slider').slider();
	$('ul.tabs').tabs();
})
