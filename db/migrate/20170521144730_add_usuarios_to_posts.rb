class AddUsuariosToPosts < ActiveRecord::Migration[5.0]
  def self.up
    add_column :posts, :usuario_id, :integer
    add_reference :posts, :usuario_id
  end

  def self.down
  	remove_column :posts, :usuario_id
  end
end
