class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.integer :genre_id
      t.integer :movie_id
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
