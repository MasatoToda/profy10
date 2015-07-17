class QuestionsController < ApplicationController

  def create
    Question.create(create_params)
    redirect_to :root and return
  end

  private
  def create_params
    params.require(:question).permit(:text).merge(user_id: current_user.id, group_id: current_user.group_id)
    #permit(:text)httpリクエストからキー値と値が付加させてくる。
    #merge(user_id: current_user.id）はここで取得するからキー値 : 値とハッシュに格納するかたちになっている。
  end
end
