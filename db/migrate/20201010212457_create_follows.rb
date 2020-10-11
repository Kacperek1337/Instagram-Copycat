class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows, id: false, force: :cascade do |t|
      t.bigint :user_id
      t.bigint :following_id
    end
  end
end
