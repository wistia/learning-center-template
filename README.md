

To get all the setups:
=====================

1. RVM stuff
2. `bundle install`
3. Get the `database.yml` and `config.local.yml` file from someones
3. `rake db:create` (or mysql -u root -p and then `create database learning_center`)
4. `rake db:migrate`
5. Run `rake learning-center:sync`
6. Server is the ready!
