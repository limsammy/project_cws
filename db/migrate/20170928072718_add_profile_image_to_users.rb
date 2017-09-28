class AddProfileImageToUsers < ActiveRecord::Migration[5.1]
  def change
    def self.up
      add_column :users, :profile_image, :binary, :limit => 5.megabyte
    end

    def self.down
      remove_column :users, :profile_image
    end
  end
end
