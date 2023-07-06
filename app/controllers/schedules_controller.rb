class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all #allメソッドでschedulesのレコードを全て取得
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start, :finish, :allday, :memo))
    if @schedule.save #予定登録に成功
      flash[:success] = "予定を新規登録しました"
      redirect_to :schedules
    else #予定登録に失敗
      flash[:failure] = "予定の登録に失敗しました"
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start, :finish, :allday, :memo))
      flash[:success] = "IDが「#{@schedule.id}」の予定を変更しました"
      redirect_to :schedules
    else
      redirect "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:success] = "スケジュールを削除しました"
    redirect_to :schedules
  end
end
