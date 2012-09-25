$(document).ready(function() {

  try {
    $('a[rel*=facebox]').facebox({
      loadingImage: '/assets/facebox/loading.gif',
      closeImage  : '/assets/facebox/closelabel.png'
    });
  } catch (ex) {
  }
});
