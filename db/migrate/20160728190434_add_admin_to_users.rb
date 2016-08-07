class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false #add an admin column in the user table and set boolean default to alse for each user.
  end
end
#this will add a column to users table so the user can be an admin user if selected, he we have selected the user as false as default
