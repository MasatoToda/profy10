class RemoveQuestionsFromLastAnseredAt < ActiveRecord::Migration
  def change
        remove_column(:last_answerd_at)
  end
end
