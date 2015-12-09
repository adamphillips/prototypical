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

### Explicit

By default, Prototypical requires enabling on a per-action basis. This means
that you can be explicit about the controllers and actions affected by
Prototypical. This is probably the best setting for larger apps as it makes it
easier to track which actions allow prototyping and which don't.

To enable Prototypical for a controller, include the `Prototypical::Controller`
module in the controller then call the `enable_protyping` method. This is
usually done in a `before_action`.


```
# app/controllers/my_controller.rb
class MyController < ApplicationController
  include Prototypical::Controller

  before_action :enable_prototyping, only: [:my_action]

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

### Implicit

In smaller apps or in the early stages of an application you may prefer to
automatically have prototyping enabled. In order to do this you can first set
the `prototypical.enable_on_include` configuration option in
`config/application.rb`

```
# config/application.rb

    config.prototypical.enable_on_include = true
```

This means that including the module in a controller will automatically add the
`enable_prototyping` before_action for all actions.

Then if you include `Prototypical::Controller` in your `ApplicationController`,
prototyping will be automatically enabled for all controllers and actions in the
application.

## Configuration

### Enabling / disabling

There is a `prototypical.enabled` configuration option that can be used to enable or disable Prototypical at a high-level. If this is set to false then calling `enable_prototyping` will do nothing. By default this is set to `!Rails.env.production?`. This means that prototyping is automatically disabled in production but enabled everywhere else. If you want to enable prototypes in production then set this value in the `config/application.rb`

```
# config/application.rb

    config.prototypical.enabled = true
```

### Template folder

The folder for prototypes can be changed in the application config

```
# config/application.rb

    config.prototypical.view_path = 'app/prototypes'
```