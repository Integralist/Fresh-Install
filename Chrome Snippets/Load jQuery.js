// jquerify.js
// https://github.com/bgrins/devtools-snippets
// Add jQuery to any page that does not have it already.

(function () {

  if ( !window.jQuery ) {
    var s = document.createElement('script');
    s.setAttribute('src', '//code.jquery.com/jquery-latest.min.js');
    document.body.appendChild(s);
  }

})();