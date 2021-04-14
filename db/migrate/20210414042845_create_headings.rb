class CreateHeadings < ActiveRecord::Migration[6.1]
  def change
    create_table :headings do |t|
      t.integer :member_id, null: false
      t.text :content

      t.timestamps
    end
  end
end
