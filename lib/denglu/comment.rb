# -* encoding: utf-8 -*-
require 'open-uri'
require 'json'
require 'digest/md5'
require 'rest_client'

module Denglu

  class Comment < Base

    def list(comment_id=0, max=50)
      req_method = :GET
      req_uri = '/api/v4/get_comment_list'
      req_options = {
        :commentid => comment_id,
        :count => max
      }

      response = request_api(req_method, req_uri, req_options)
    end

    def latest(max=20)
      req_method = :GET
      req_uri = '/api/v4/latest_comment'
      req_options = {
        :count => max
      }

      response = request_api(req_method, req_uri, req_options)
    end

    def total(resource=nil)
      req_method = :GET
      req_uri = '/api/v4/get_comment_count'
      req_options = {}
      case
      when resource.is_a?(Integer)
        req_options[:postid] = resource
      when resource.is_a?(String)
        req_options[:url] = resource
      end

      response = request_api(req_method, req_uri, req_options)
    end

    def stat(from_ts=nil)
      req_method = :GET
      req_uri = '/api/v4/get_change_comment_ids'
      req_options = {
        :time => from_ts || generate_millisecond
      }

      response = request_api(req_method, req_uri, req_options)
    end

  end

end

comment = Denglu::Comment.new '43669den56kf1gxRCmfn7UBW5kevQ3', '458394366Cr0ppwALx71Sx9m2f8jm6'
p comment.list
p comment.latest
p comment.total
p comment.total 131
p comment.total 'http://dev.gigabase.org:3000/en/projects/131?img=5959'
#p comment.stat
