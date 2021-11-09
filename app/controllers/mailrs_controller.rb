class MailrsController < ApplicationController


    def new
    end

    def create
        @mailr = Mailr.new(mailr_params)
        @mailr.is_sent = false
        if @mailr.save
            MainMailer.confirm(@mailr).deliver_now
            render plain: params[:mailr].inspect
        else
            render "おや？　何かがおかしいようです…"
        end
    end

    private 
        def mailr_params
            params.require(:mailr).permit(:remind_str,:dest_address,:sending_at,:is_sent)
        end

end
