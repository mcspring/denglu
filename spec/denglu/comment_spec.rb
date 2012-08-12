require 'spec_helper'

module Denglu

  describe Comment do
    before :each do
      @comment = Comment.new
    end

    context ".list" do
      it "should works" do
        result = @comment.list
        result.should be_instance_of(Array)
        result.to_json.should include('parentID')
      end
    end

    context ".latest" do
      it "should works" do
        result = @comment.latest
        result.should be_instance_of(Array)
        result.to_json.should_not include('parentID')
      end
    end

    context ".total" do
      it "should works" do
        result = @comment.total

        result.should be_instance_of(Array)
      end

      context "with argument" do
        before :each do
          @resource = @comment.total[0]
        end

        it "should return a hash object when supply resource id" do
          resource_id = @resource['id'].to_i

          result = @comment.total(resource_id)
          result.should be_instance_of(Hash)
        end

        it "should return a hash object when supply resource url" do
          resource_url = @resource['url']

          result = @comment.total(resource_url)
          result.should be_instance_of(Hash)
        end
      end
    end
  end

end
