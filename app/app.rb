require 'grape'
require 'telegram/bot'

module CryptoBot
  class API < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json
    prefix :api

    TOKEN = '8309735777:AAH294UGFs6TJ5EwmDRZAAdESsr-8nCb8eA'
    CHANNEL_ID = "401429540"

    helpers do
      def telegram_bot
        @telegram_bot ||= Telegram::Bot::Client.new(TOKEN)
      end
    end

    resource :info do
      desc 'Send an info.'
      params do
        optional :user, type: Hash
      end
      post do
        telegram_bot.api.send_message(chat_id: CHANNEL_ID, text: params.inspect)
      end
    end
  end
end
