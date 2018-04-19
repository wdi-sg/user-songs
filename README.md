# Rails Front-end

### Setup

Make sure you have the app running and that it has a few songs in it.

Going to the index page: `http://localhost:3000` you should see a list of the songs.

### Static Assets
Rails is smart enough to put in the proper urls when it's a SASS file.

Choose an image file. Name it `pic.jpg` and put it in `app/assets/images`

Output an `image_url` in the view template to see where it goes.
```
<%= image_url 'pic.jpg' %>
```

Make an image tag with the url
```
<img src="<%= image_url 'pic.jpg' %>"/>
```

### Style our songs app

Implement a branding design guide in our app.

This will specify things like:
 - font type and size
 - 3-4 brand colors
 - logo
![https://identitydesigned.com/images/mash/royal-mail/royal-mail-logo-6.jpg](https://identitydesigned.com/images/mash/royal-mail/royal-mail-logo-6.jpg)

We'll use a color palette we pick from [https://color.adobe.com](https://color.adobe.com)

### Install bootstrap
According to the instructions:

[https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails](https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails)


Add `bootstrap` to your Gemfile:

```ruby
gem 'bootstrap', '~> 4.1.0'
```

```
bundle install
```

Make some changes in `app/assets/stylesheets/application.css`:

Take out all require statements.

Import Bootstrap styles:

```scss
// Custom bootstrap variables must be set or imported *before* bootstrap.
@import "bootstrap";
```

The available variables can be found [here](assets/stylesheets/bootstrap/_variables.scss).

Make sure the file has `.scss` extension (or `.sass` for Sass syntax). If you have just generated a new Rails app,
it may come with a `.css` file instead. If this file exists, it will be served instead of Sass, so rename it:

```console
mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
```

> Warning: the order of the import statements matter.

### bootstrap javascript & dependencies

Bootstrap JavaScript depends on jQuery.
Add the `jquery-rails` gem to your Gemfile:

```ruby
gem 'jquery-rails'
```

Bootstrap tooltips and popovers depend on [popper.js] for positioning.
The `bootstrap` gem already depends on the
[popper_js](https://github.com/glebm/popper_js-rubygem) gem.

Add Bootstrap dependencies and Bootstrap to your `application.js`:

```js
//= require jquery3
//= require popper
//= require bootstrap-sprockets
```

#### Song New Form:
Let's make some changes to the new form to conform with the bootstrap form. [https://getbootstrap.com/docs/4.0/components/forms/](https://getbootstrap.com/docs/4.0/components/forms/)

You shouldn't need any additional styles for this page if your markup and classes use bootstrap.

#### Song Index Page
Make the top part of our index page a bootstrap jumbotron: [https://getbootstrap.com/docs/4.0/components/jumbotron/](https://getbootstrap.com/docs/4.0/components/jumbotron/)

Make sure it has a `container` and `row` bootstrap class `div` around it. (like the table markup below)

In `app/assets/stylesheets` make a new stylesheet `song-index.scss` and import it in `application.scss`.

In the new SASS file set a background image for the jumbotron. SASS and Rails are smart enough to put figure out that you want an asset image in your css:
```
background-image: asset-url('pic.jpg');
```

You can also use one from [unsplash.it](https://unsplash.it)

### Ruby variables in javascript
Add it to your gemfile
```
gem 'gon'
```

Install it
```
bundle install
```

Add gon inside the head tag
```
<%= include_gon %>
```

Add gon to the controller
```
gon.songs = @songs
```

put a javascript file in the javascripts dir. Rails automatically includes it.
```
touch app/assets/javascripts/variables.js
```


```
alert( gon.songs[0].title );
```

### Javascript in rails

Let's write javascript to sort our songs inside the browser.

Add our markup
```
<div class="container">
  <div class="row">
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
  </div>
</div>
```

Add a button to use our sorting script
```
<button id="submit" type="button" class="btn">sort</button>
```

Add the javascript html sorting function:
```
var doSort = function(){
  var desc = function(a,b){
    return $(b).children('.song-title').text() < $(a).children('.song-title').text();
  };

  var asc = function(a,b){
    return $(b).children('.song-title').text() > $(a).children('.song-title').text();
  };

  var sortedRows = $('tbody tr').sort(desc);

  $('tbody').empty()
  $('tbody').append(sortedRows)

};
```

Add the listener:
```
window.onload = function(){
  $('#submit').click(doSort);
};
```

### Asset Pipeline

Check out the asset pipeline options:
Switch each of these and see how your assets change.

When this option is true, digests will be generated for asset URLs.
```
config.assets.digest = false
```

When debug mode is off, Sprockets concatenates and runs the necessary preprocessors on all files. With debug mode turned off the manifest above would generate instead:
```
config.assets.debug = false
```

See what assets precompile does:
```
rails assets:precompile
```

Look in the place where rails *actually* serves the compiled assets from:
```
ls -la public/assets
```
