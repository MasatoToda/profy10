class QuestionsController < ApplicationController

  def create
    Question.create(create_params)
    redirect_to :root and return
  end

  def show
    #なんでquestion_idが取得できるのか。
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  private
  def create_params
    params.require(:question).permit(:text).merge(user_id: current_user.id, group_id: current_user.group_id)
    #permit(:text)httpリクエストからキー値と値が付加させてくる。ハイグレード　リアル　人工芝
    #merge(user_id: current_user.id）はここで取得するからキー値 : 値とハッシュに格納するかたちになっている。
  end
end
