class Question < ActiveRecord::Base

  #callback
  after_create :create_feed_content

  belongs_to :user
  belongs_to :group
  has_many :answers, dependent: :destroy
  has_one :feed_content, as: :content, dependent: :destroy

  #validation
  validates_presence_of :user_id, :text, :group_id

  def user_answer(user_id)
    Answer.find_by(user_id: user_id, question_id: id)
      #このidって何？
      #question_idカラムの値が「メソッドを呼び出した元の質問のid」と一致する回答
      #呼び出し元はquestion("users/_questionファイルから")
      #「question_id: id」 の id という部分は、self.id の self を省略した形です。
    end

    private
    def create_feed_content
      self.feed_content = FeedContent.create(group_id: group_id, updated_at: updated_at)
    end
  end
