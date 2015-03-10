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
'                      <small><span class="ellipsis body-snippet">{{body_snip}}</span></small>' +
'                      <span class="hidden body-hidden">{{body}}</span>' +
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
        $('.navbar-search .search-menu').append(
                              template.replace('{{glyphicon}}', 'calendar')
                                      .replace('{{title}}', event.title)
                                      .replace('{{link}}', event.actions.show.href)
                                      .replace('{{body_snip}}', event.description)
                                      .replace('{{body}}', event.description));
      });
    });
    $.getJSON('/people.json', function(data){
      $.each(data.people, function(idx, person){
        $('.navbar-search .search-menu').append(
                              template.replace('{{glyphicon}}', 'user')
                                      .replace('{{title}}', person.name)
                                      .replace('{{link}}', person.actions.show.href)
                                      .replace('{{body_snip}}', person.email)
                                      .replace('{{body}}', person.email));
      });
    });
  };

  $('.navbar-search .search-bar').on('input', function(){
    $('.search-menu').show();
    var query = $(this).val();
    $('.search-item').hide();
    if(query.trim() == ''){
      console.log('Empty');
      $('.search-item-result').each(function(){
        $(this).find('.body-snippet').html($(this).find('.body-hidden').html());
      });
      $('.search-item-result').show();
    } else {
      var els = $('.search-item-result:contains(' + query + ')');
      if(els.length == 0){
        $('.search-item-notfound').show();
      } else $('.search-item-result:contains(' + query + ')').each(function(){
        $(this).show();
        var fullText = $(this).find('.body-hidden').html();
        var startIdx = fullText.toLowerCase().indexOf(query.toLowerCase());
        var text = (startIdx == 0 ? '' : '...') +  fullText.substr(Math.max(startIdx - 10, 0), (startIdx - 10 < 0 ? 0 : 10)) + 
                            '<strong>' + fullText.substr(startIdx, query.length) + '</strong>' +
                            fullText.substr(startIdx + query.length);
        $(this).find('.body-snippet').html(text);
      });
    }
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
