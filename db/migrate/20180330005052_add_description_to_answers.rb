class AddDescriptionToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :description, :string
  end
end
