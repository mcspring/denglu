# -*- encoding: utf-8 -*-

module Denglu

  class Base
    attr_reader :app_id, :app_key

    def initialize(app_id=nil, app_key=nil)
      @app_id = app_id || Config.app_id
      @app_key = app_key || Config.app_key

      unless @app_id || @app_key
        raise 'Uninitialized app_id or app_key!'
      end
    end

  protected
    def request_api(method, uri, options)
      uri = "#{Config.host}#{uri}"

      params = options.merge({
        :appid => @app_id,
        :timestamp => generate_millisecond,
        :sign_type => Config.sign_type
      })
      params[:sign] = generate_sign(params)

      case method.upcase.to_sym
      when :POST
        RestClient.post uri, params
      when :GET
        RestClient.get uri, :params => params
      else
        raise "Unexpected http request method: #{method}"
      end
    end

    def generate_sign(options={})
      sign_str = ''
      options.keys.sort.each do |key|
        sign_str << "#{key}=#{options[key]}"
      end

      sign_str << @app_key

      case Config.sign_type.upcase.to_sym
      when :MD5
        Digest::MD5.hexdigest(sign_str)
      else
        raise "Unsupported sign method: #{sign_type}, only :md5 method used for now!"
      end
    end

    def generate_millisecond
      Time.now.to_i * 1000
    end

  end

end
