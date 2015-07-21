class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :answers, dependent: :destroy

  #validation
  validates_presence_of :user_id, :text, :group_id

  def user_answer(user_id)
      Answer.find_by(user_id: user_id, question_id: id)
      #このidって何？
      #question_idカラムの値が「メソッドを呼び出した元の質問のid」と一致する回答
      #「question_id: id」 の id という部分は、self.id の self を省略した形です。
  end
end
