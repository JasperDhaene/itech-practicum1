/*
 * search.js - event full-text search
 * 
 * Florian Dejonckheere <florian@floriandejonckheere.be>
 * 
 * */

var template = '' +
'              <li class="search-item">' +
'                <div class="row">' +
'                  <div class="col-xs-1">' +
'                    <i class="glyphicon glyphicon-{{glyphicon}}"></i>' +
'                  </div>' +
'                  <div class="col-xs-10">' +
'                    <a href="{{link}}">' +
'                      <strong>{{title}}</strong><br>' +
'                      <small><span class="ellipsis">{{description}}</span></small>' +
'                    </a>' +
'                  </div>' +
'                </div>' +
'              </li>';

$(document).ready(function(){
  /*
   * jQuery case-insensitive :contains selector
   * 
   * https://css-tricks.com/snippets/jquery/make-jquery-contains-case-insensitive/
   * 
   * */
  $.expr[":"].contains = $.expr.createPseudo(function(arg) {
      return function( elem ) {
          return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
      };
  });



  var updateJSON = function(){
    $.getJSON('/events.json', function(data){
      $('.navbar-search .search-menu').empty();
      $.each(data.events, function(idx, event){
        // TODO: ellipse text properly
        $('.navbar-search .search-menu').append(
                              template.replace('{{glyphicon}}', 'calendar')
                                      .replace('{{title}}', event.title)
                                      .replace('{{link}}', event.actions.show.href)
                                      .replace('{{description}}', event.description.substr(0, 60) + '...'));
      });
    });
  };

  $('.navbar-search .search-bar').val('');
  updateJSON();

  $('.navbar-search .search-bar').on('input', function(){
    $('.search-item').hide();
    var els = $('.search-item:contains(' + $(this).val() + ')');
    console.log(els.length);
    if(els.length == 0){
      $('.search-item');
    }
    $('.search-item:contains(' + $(this).val() + ')').show();
  });

  $('.navbar-search .search-bar').focus(function(){
    $('.search-menu').show();
  });
  $('.navbar-search .search-bar').blur(function(){
    // Ugly hack around blur
    $(this).delay(10).queue(function(){
      $('.search-menu').hide();
    });
  });
});
