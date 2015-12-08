# Prototypical

Prototypical facilitates easy prototyping within a Rails app. It does this by
enabling a second folder for templates. By default this folder is
`app/prototypes`.

## Setup

Add it to your gemfile

```
# Gemfile
gem 'prototypical'
```

then run

```
bundle
```

## Usage

To enable Prototypical for a controller, include the `Prototypical::Controller`
module in the controller.

```
# app/controllers/my_controller.rb
class MyController < ApplicationController
  include Prototypical::Controller

  def my_action
  end
end
```

Then create the prototype view in `app/prototypes`.

```
# app/prototypes/my/my_action.html.erb
<div>
  <p>Prototype</p>
</div>
```

This will take precedence over an equivalent view in `app/views`.

Because Rails treats this as it would any other view, you can do all the normal
things you would expect in views including rendering other templates (either
from the prototypes folder or the main application) and helper methods.
Transitioning from a prototype to a view is as simple as moving the template and
disabling prototyping.

## Configuration

The folder for prototypes can be changed in the application config

```
# config/application.rb

    config.prototypical.view_path = 'app/prototypes'
```