window.onload = function(){
    let prevSort = 'desc';
    $('#sort-button').on('click', function(){
        const desc = function(a,b){
          return $(b).children('.song-title').text() < $(a).children('.song-title').text();
        };

        const asc = function(a,b){
          return $(b).children('.song-title').text() > $(a).children('.song-title').text();
        };

        let sortedRows;
        if (prevSort == 'desc') {
          sortedRows = $('tbody tr').sort(desc);
          prevSort = 'asc';
        } else {
          sortedRows = $('tbody tr').sort(asc);
          prevSort = 'desc';
        }

        $('tbody').empty()
        $('tbody').append(sortedRows)
    });

};