class AnswersController < ApplicationController
    def new
      #<%= form_tag(new_answer_path, method: :get, class: "question_submit") do %><%= hidden_field_tag(:question_id, question.id) %>
      #anserテーブルのカラムをしていして、pramasで受け取った値はquestion.id
    @question = Question.find(params[:question_id])
    #question_idというのはただのキーの名前、たぶん名前を変えてもOK。あとでやってみる。
    #Viewの方も変更しなければならない。
    @answer = Answer.new
    @answer.question_id = @question.id
  end

  def create
    @answer = Answer.create(create_params)
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def update
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.update(update_params)
  end
 
  private
  def create_params
    params.require(:answer).permit(:question_id, :text).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:answer).permit(:text)
  end
end
