# Rails Front-end

```
gem 'bootstrap', '~> 4.1.0'
gem 'gon'
```

Install bootstrap according to the instructions
[https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails](https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails)

Add gon to the head
```
<%= include_gon %>
```

Add gon to the controller
```
gon.songs = @songs
```

Add jquery
```
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
```

Add our markup
```
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">title</th>
      <th scope="col">created</th>
    </tr>
  </thead>
  <tbody>
  <% @songs.each do |song| %>
    <tr>
      <td><%= song.id %></td>
      <td class="song-title"><%= song.title %></td>
      <td><%= song.created_at.strftime('%d.%m.%Y') %></td>
    </tr>
  <% end %>
  </tbody>
</table>
```

Add a button to use our sorting script
```
var desc = function(a,b){
  return $(b).children('.song-title').text() < $(a).children('.song-title').text();
};

var asc = function(a,b){
  return $(b).children('.song-title').text() > $(a).children('.song-title').text();
};

var sortedRows = $('tbody tr').sort(desc);

$('tbody').empty()
$('tbody').append(sortedRows)
```

Check out the asset pipeline options:

```
config.assets.js_compressor = :uglifier
config.assets.css_compressor = :sass
```

See what assets precompile does:
```
rails assets:precompile
```
