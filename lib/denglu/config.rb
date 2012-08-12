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

      # Denglu api host, default to http://open.denglu.cc
      def host
        @host ||= 'http://open.denglu.cc'
      end

      # Denglu api version, no used now
      def version
        @version ||= '1.0'
      end

      # Denglu api rquest sign method, only support md5
      def sign_type
        @sign_type ||= :md5
      end

    end

  end

end

