
# InventoryManager

The **InventoryManager** gem is a lightweight and modular Rails engine designed to simplify inventory management in your Rails application. It provides built-in models, migrations, controllers, and serializers for managing brands, categories, items, and brand categories.

## Features
- Manage brands, categories, brand categories, and items with ease.
- Provides RESTful controllers and JSON API serializers.
- Includes migrations for setting up the database structure.
- Extensible and easy to integrate with existing Rails applications.

---

## Installation

Add the gem to your application's Gemfile:

```ruby
gem "inventory_manager"
```

Run `bundle install` to install the gem:

```bash
$ bundle install
```

Mount the engine in your application's routes:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount InventoryManager::Engine, at: "/inventory_manager"
end
```

Run the installation generator to set up migrations and controllers:

```bash
$ rails generate inventory_manager:install
```

Migrate the database:

```bash
$ rails db:migrate
```

---

## Usage

After installation, you can start managing your inventory by visiting the routes provided by the gem. For example:
- `/inventory_manager/brands`
- `/inventory_manager/categories`
- `/inventory_manager/items`

The gem also exposes an API for integrations. Use the built-in serializers to customize JSON responses for your frontend.

---

## Development

To run the engine in development mode:
1. Clone the repository and set it up as a Rails engine.
2. Use the dummy application under `spec/dummy` to test features locally.
3. Make changes, write tests, and ensure everything is working before committing.

---

## Contributing

Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a feature branch: `git checkout -b my-new-feature`.
3. Commit your changes: `git commit -am 'Add some feature'`.
4. Push to the branch: `git push origin my-new-feature`.
5. Create a pull request.

---

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).