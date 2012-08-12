# -* encoding: utf-8 -*-

module Denglu

  class Comment < Base

    # Get comment list
    # This will contains comments' relations in response.
    #
    # Example:
    #   >> comment = Denglu::Comment.new
    #   => #<#Denglu::Comment...>
    #   >> comments = comment.list
    #   => [{...}, {...}]
    #
    # Arguments:
    #   comment_id: (Integer)  The offset marker of response, default to 0 mains from the begining
    #   max: (Integer)  The max records of response, default to 50
    #
    def list(comment_id=0, max=50)
      req_method = :GET
      req_uri = '/api/v4/get_comment_list'
      req_options = {
        :commentid => comment_id,
        :count => max
      }

      response = request_api(req_method, req_uri, req_options)

      normalize_comments JSON.parse(response)
    end

    # Get latest comments
    # NOTE: This contains no relations of comments!
    #
    # Example:
    #   >> comment = Denglu::Comment.new
    #   => #<#Denglu::Comment...>
    #   >> comments = comment.latest
    #   => [{...}, {...}]
    #
    # Arguments:
    #   max: (Integer)  The max records of response, default to 20
    #
    def latest(max=20)
      req_method = :GET
      req_uri = '/api/v4/latest_comment'
      req_options = {
        :count => max
      }

      response = request_api(req_method, req_uri, req_options)

      JSON.parse(response)
    end

    # Get comment count
    # If resource is nil it will return all posts comment count in an array, otherwise just return a hash object.
    #
    # Example:
    #   >> comment = Denglu::Comment.new
    #   => #<#Denglu::Comment...>
    #   >> comments = comment.total
    #   => [{"id"=>..., "count"=>..., "url"=>...},
    #   =>  {...}]
    #
    # Arguments:
    #   resource: (Mixed)  Integer for resource id or string for uri.
    #
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

      response = JSON.parse(response)
      unless resource.nil?
        response = response[0]
      end

      response
    end

    # NOTE: NO IMPL!
    def stat(from_ts=nil)
      req_method = :GET
      req_uri = '/api/v4/get_change_comment_ids'
      req_options = {
        :time => from_ts || generate_millisecond
      }

      response = request_api(req_method, req_uri, req_options)
    end

  protected
    def normalize_comments(comments)
      comments.collect do |comment|
        comment['parentID'] = 0
        if comment.has_key?('parent')
          comment['parentID'] = comment['parent']['commentID']

          comment.delete 'parent'
        end

        comment
      end
    end

  end

end

