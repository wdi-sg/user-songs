// alert("hello woooorld");

// alert( gon.songs[0].title);

// $('#sort').click(function(){
// 		alert("sort!")
// 	});
// //window.onload
// $(function(){

// 	var desc = function(a,b){
// 		console.log( a , b);
// 		return $(b).children('.song-title').text() < $(a).children('.song-title').text();
// 	};

// 	var asc = function(a,b){
// 		return $(b).children('.song-title').text() > $(a).children('.song-title').text();
// 	};

// 	var sortedRows = $('tbody tr').sort(desc);

// 	$('tbody').empty()
// 	$('tbody').append(sortedRows)

// })


window.onload = function(){

    $('#sort').click(function(){
    	alert("sort!");

        var desc = function(a,b){
          console.log( a,b );
          return $(b).children('.song-title').text() < $(a).children('.song-title').text();

        };

        var asc = function(a,b){
          return $(b).children('.song-title').text() > $(a).children('.song-title').text();
        };

        var sortedRows = $('tbody tr').sort(desc);

        $('tbody').empty()
        $('tbody').append(sortedRows)

        //alert(“helloe”);
    });
};