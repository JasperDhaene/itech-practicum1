/*
 * search.js - event full-text search
 * 
 * Florian Dejonckheere <florian@floriandejonckheere.be>
 * 
 * */

var template = '' +
'              <li class="search-item search-item-result">' +
'                <div class="row">' +
'                  <div class="col-xs-1">' +
'                    <i class="glyphicon glyphicon-{{glyphicon}}"></i>' +
'                  </div>' +
'                  <div class="col-xs-10">' +
'                    <a href="{{link}}">' +
'                      <strong>{{title}}</strong><br>' +
'                      <small><span class="ellipsis">{{body}}</span></small>' +
'                    </a>' +
'                  </div>' +
'                </div>' +
'              </li>';

$(document).ready(function(){
  /**
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


/**
 * 
 * Fetch and parse JSON
 * 
 * */
  var updateJSON = function(){
    $('.search-menu-item-result').remove();
    $.getJSON('/events.json', function(data){
      $.each(data.events, function(idx, event){
        // TODO: ellipse text properly
        $('.navbar-search .search-menu').append(
                              template.replace('{{glyphicon}}', 'calendar')
                                      .replace('{{title}}', event.title)
                                      .replace('{{link}}', event.actions.show.href)
                                      .replace('{{body}}', event.description.substr(0, 60) + '...'));
      });
    });
    $.getJSON('/people.json', function(data){
      $.each(data.people, function(idx, person){
        $('.navbar-search .search-menu').append(
                              template.replace('{{glyphicon}}', 'user')
                                      .replace('{{title}}', person.name)
                                      .replace('{{link}}', person.actions.show.href)
                                      .replace('{{body}}', person.email));
      });
    });
  };

  $('.navbar-search .search-bar').on('input', function(){
    $('.search-item').hide();
    var els = $('.search-item-result:contains(' + $(this).val() + ')');
    console.log(els.length);
    if(els.length == 0){
      $('.search-item-notfound').show();
    } else $('.search-item-result:contains(' + $(this).val() + ')').show();
  });

  $('.navbar-search .search-bar').on('focus', function(){
    $('.search-menu').show();
  });

  $('.navbar-search .search-bar').on('blur', function(){
    // Blur event fires before click; prevent menu from hiding a little while longer
    setTimeout(function(){
      $('.search-menu').hide();
    }, 100);
  });


  /**
   * Bootstrap search bar
   * 
   * */
  $('.navbar-search .search-bar').val('');
  updateJSON();
  $('.search-item-notfound').hide();
});
