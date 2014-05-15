SpreeMyFavourites
=================

Adds a My Favourites page to the My Account section of spree frontend. At the moment, the favourites list is
just all the items a customer has ordered, sorted by the number of times they have been ordered.

This gem can also be used with the Spree Quick Cart gem (https://github.com/frankmt/spree_quick_cart), so that an Add to Cart button is added to the favourites table

Installation
------------

Add spree_my_favourites to your Gemfile:

```ruby
gem 'spree_my_favourites'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_my_favourites:install
```
