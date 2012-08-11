# -*- encoding: utf-8 -*-

module Denglu

  class Config

    class << self
      attr_accessor :app_id, :app_key
      attr_accessor :host, :version, :sign_type

      def app_id
        @app_id ||= ''
      end

      def app_key
        @app_key ||= ''
      end

      def host
        @host ||= 'http://open.denglu.cc'
      end

      def version
        @version ||= '1.0'
      end

      def sign_type
        @sign_type ||= :md5
      end

    end

  end

end

