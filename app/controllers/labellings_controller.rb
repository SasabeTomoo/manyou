class LabellingsController < ApplicationController
  def create
    @task = Task.find(params[:id])
    labelling = @task.labellings.create(label_id: params[:label_ids])
    # redirect_to labels_url, notice: "#{labelling.label.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
  end
end
