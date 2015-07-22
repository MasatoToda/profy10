class AddLastcreatedatQuestions < ActiveRecord::Migration
  def change
          add_column :questions, :last_answerd_at, :timestamp
  end
end
