module Twitter
  class API < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json
    prefix :api

    TOKEN = 'YOUR_TELEGRAM_BOT_API_TOKEN'
    CHANNEL_ID = ""
    

    helpers do
      def telegram_bot
        @telegram_bot ||= Telegram::Bot::Client.new(TOKEN)
      end
    end

    resource :info do
      desc 'Send an info.'
      params do
        requires :status, type: String, desc: 'Your status.'
      end
      post do
        telegram_bot.api.send_message(chat_id: CHANNEL_ID, text: params[:abc])
      end
    end
  end
end
