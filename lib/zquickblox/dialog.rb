require_relative "dialog/create_dialog_request"
require_relative "dialog/update_dialog_request"
require_relative "dialog/get_dialogs_request"

module ZQuickblox
  module Dialog
    class << self
      def get(login, password, params)
        request = ZQuickblox::Dialog::GetDialogsRequest.new(params)
        run_request(login, password, request)
        response =  ZQuickblox::Util.symbolize_keys(request.response_body)
        dialogs = response[:items].map { |item| Dialog.new(item) }
        return dialogs
      end

      def create(login, password, params)
        dialog = Dialog.new(params)
        params = dialog.build_params
        request = ZQuickblox::Dialog::CreateDialogRequest.new(params)
        run_request(login, password, request)
        dialog = Dialog.new(ZQuickblox::Util.symbolize_keys(request.response_body))
        return dialog
      end

      def update(login, password, id, params)
        dialog = Dialog.new(params)
        params = dialog.build_params
        request = ZQuickblox::Dialog::UpdateDialogRequest.new(id, params)
        run_request(login, password, request)
        dialog = Dialog.new(ZQuickblox::Util.symbolize_keys(request.response_body))
        return dialog
      end

      def run_request(login, password, request)
        session = ZQuickblox::Session.create(login, password)
        request.header("QB-Token", session.token)
        request.execute
      end
    end

    class Dialog
      attr_accessor :id, :user_id, :type, 
        :occupants_ids, :name, :photo, 
        :created_at, :last_message, :last_message_date_sent,
        :last_message_user_id, :unread_messages_count

      def initialize(params)
        @id                       = params[:_id]
        @user_id                  = params[:user_id]
        @type                     = params[:type]
        @occupants_ids            = params[:occupants_ids]
        @name                     = params[:name]
        @photo                    = params[:photo]
        @created_at               = params[:created_at]
        @last_message             = params[:last_message]
        @last_message_date_sent   = params[:last_message_date_sent]
        @last_message_user_id     = params[:last_message_user_id]
        @unread_messages_count    = params[:unread_messages_count]
      end

      def build_params
        @params = {
          "type":              @type,
          "occupants_ids":     @occupants_ids,
          "name":              @name,
          "photo":             @photo    
        }
      end
    end
  end
end
