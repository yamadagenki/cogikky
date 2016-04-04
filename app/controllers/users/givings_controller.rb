module Users
  class GivingsController < UsersController
    before_action :require_login, only: [:index]

    def index
    end

    def new
      @wish = Wish.find_by(id: params[:wish_id])
      @giving = Giving.new
    end

    def create
      @giving = Giving.new(wish_id: wish.id, user_id: current_user.id)

      if @giving.save
        UsersMailer.send_giving.deliver_now
        Message.create(to_user_id:  wish.user_id,
                       from_user_id: current_user.id,
                       body: 'サンプルでーす'
                      )
      else
        render 'new'
      end
    end

    def destroy
    end
  end
end
