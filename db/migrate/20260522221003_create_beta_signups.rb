class CreateBetaSignups < ActiveRecord::Migration[8.0]
  def change
    create_table :beta_signups do |t|
      t.string :email
      t.string :name
      t.string :company
      t.string :job_title
      t.string :team_size
      t.text :current_workflow
      t.boolean :ipads_in_field

      t.timestamps
    end

    add_index :beta_signups, :email
    add_index :beta_signups, :created_at
  end
end
