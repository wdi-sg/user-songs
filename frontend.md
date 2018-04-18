# Rails Front-end

### Static assets

```
<img src="<%= image_url 'pic.jpg' %>"/>
```

![https://identitydesigned.com/images/mash/royal-mail/royal-mail-logo-6.jpg](https://identitydesigned.com/images/mash/royal-mail/royal-mail-logo-6.jpg)

### Bootstrap

```
gem 'bootstrap', '~> 4.1.0'
```

Install bootstrap according to the instructions
[https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails](https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails)

Let's make some changes to the new form to conform with the bootstrap form. [https://getbootstrap.com/docs/4.0/components/forms/](https://getbootstrap.com/docs/4.0/components/forms/)

We'll use a color palette we pick from [https://color.adobe.com](https://color.adobe.com)

### Start using some SASS features

Set the colors as variables in a new file.
```
$text-color: #000000;
...
```

Create a set of fonts according to this: [https://www.cssfontstack.com/](https://www.cssfontstack.com/)
```
$main-font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
$secondary-font-family:
```

Make a nested style just for the song form
```
.song-form{
  input {
    ...
  }
}
```
## Rails Javascript
Let's implement an index page sorting function. We won't make any ajax calls.

### Javascript vars in Rails

```
gem 'gon'
```

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
