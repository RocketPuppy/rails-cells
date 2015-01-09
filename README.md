# README

should be normal rails setup

This is to demonstrate some ideas I had with using polymorphism instead of if/then/else to perform conditional behavior. It also served as a platform for me to experiment with the `cells` gem.

Have a look at the models. There are three `Order` models, which serve to highlight the possible states an order can inhabit. They all have separate validation criteria and default scopes. The scopes are mutually exclusive, that is, no order can be inhabiting more than one state at a time.

You'll also find an `OptionalAttributes` module, which lets you easily make attributes on your model inhabit the `Optional` class, rather than dealing with naked `nil`s. It's not currently used anywhere.

There's also the `WhiteListAttributes` module, which lets you whitelist certain attributes, blacklisting and making inaccessible the accessors for the attributes that weren't mentioned. This lets me tailor each order model so it only exposes the attributes relevant to the model.

The sole controller doesn't do any branching, it simply fetches an order and renders it. There's also no branching in the views (app/cells/).
