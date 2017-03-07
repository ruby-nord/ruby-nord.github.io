$(document).ready(function() {
  'use strict';

  function buildShopsList (data) {
    var allRows = data.split(/\r?\n|\r/);

    for (var singleRow = 0; singleRow < allRows.length; singleRow++) {
      var rowCells = allRows[singleRow].split(',');
      var shop = '<div class="panel radius">';
      shop += '<div class="avatar-content">';

      console.log(singleRow);
      if (singleRow !== 0) {
        for (var rowCell = 0; rowCell < rowCells.length; rowCell++) {
          if (rowCell === 0) {
            shop += '<h3>';
            shop += rowCells[rowCell];
            shop += '</h3>';
          } else if (rowCell === 1) {
            shop += '<a href="' + rowCells[rowCell] + '" target="_blank">';
            shop += rowCells[rowCell];
            shop += '</a>';
          } else if (rowCell === 2) {
            shop += '<div class="label radius ' + rowCells[rowCell] + '">';
            shop += rowCells[rowCell];
            shop += '</div>';
          } else if (rowCell === 3) {
            shop += '<p>';
            shop += rowCells[rowCell];
            shop += '</p>';
          }
        }
        shop += '</div>';
        shop += '</div>';
        $('#js-shop-list').append(shop);

      }
    }
  }

  var dataUrl = 'https://raw.githubusercontent.com/ruby-nord/rubyshops/master/frenchrubyshops.csv';

  $.ajax({
    type: 'GET',
    url: dataUrl,
    dataType: 'text',
    success: function(data) {
      buildShopsList(data);
    }
   });
});
