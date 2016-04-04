module Users
  class GivingsController < UsersController
    before_action :require_login, only: [:index]

    def index
    end

    def new
      @wish = Wish.find_by(id: params[:wish_id])
      @giving = Giving.new(wish_id: @wish.id)
    end

    def create
      @giving = Giving.new(craete_giving_params)

      render 'new' && return unless @giving.save

      UsersMailer.send_giving.deliver_now
      Message.create(to_user_id:  craete_giving_params[:wish_id],
                     from_user_id: current_user.id,
                     body: 'サンプルでーす'
                    )
      redirect_to users_wish_path(craete_giving_params[:wish_id]), notice: '恵むと連絡しました'
    end

    def destroy
    end

    private

    def craete_giving_params
      params.require(:giving).permit(:wish_id, :user_id)
    end
  end
end
